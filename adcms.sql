-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2017-08-21 08:48:26
-- 服务器版本： 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `adcms`
--

-- --------------------------------------------------------

--
-- 表的结构 `dux_admin_group`
--

CREATE TABLE IF NOT EXISTS `dux_admin_group` (
  `group_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `base_purview` text,
  `menu_purview` text,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`group_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='后台管理组' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `dux_admin_group`
--

INSERT INTO `dux_admin_group` (`group_id`, `name`, `base_purview`, `menu_purview`, `status`) VALUES
(1, '管理员', 'a:2:{i:0;s:15:"Admin_AppManage";i:1;s:21:"Admin_AppManage_index";}', 'a:4:{i:0;s:19:"首页_管理首页";i:1;s:19:"内容_栏目管理";i:2;s:19:"内容_文章管理";i:3;s:22:"系统_用户组管理";}', 1);

-- --------------------------------------------------------

--
-- 表的结构 `dux_admin_log`
--

CREATE TABLE IF NOT EXISTS `dux_admin_log` (
  `log_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `time` int(10) DEFAULT NULL,
  `ip` varchar(250) DEFAULT NULL,
  `app` varchar(250) DEFAULT '1',
  `content` text,
  PRIMARY KEY (`log_id`),
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='后台操作记录' AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `dux_admin_log`
--

INSERT INTO `dux_admin_log` (`log_id`, `user_id`, `time`, `ip`, `app`, `content`) VALUES
(1, 0, 1499785409, '::1', 'admin', '登录系统'),
(2, 0, 1499789167, '127.0.0.1', 'admin', '登录系统'),
(3, 0, 1499869510, '::1', 'admin', '登录系统'),
(4, 0, 1499921693, '::1', 'admin', '登录系统'),
(5, 0, 1503189596, '::1', 'admin', '登录系统'),
(6, 0, 1503193817, '::1', 'admin', '登录系统');

-- --------------------------------------------------------

--
-- 表的结构 `dux_admin_user`
--

CREATE TABLE IF NOT EXISTS `dux_admin_user` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户IP',
  `group_id` int(10) NOT NULL DEFAULT '1' COMMENT '用户组ID',
  `username` varchar(20) NOT NULL COMMENT '登录名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `nicename` varchar(20) DEFAULT NULL COMMENT '昵称',
  `email` varchar(50) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态',
  `level` int(5) DEFAULT '1' COMMENT '等级',
  `reg_time` int(10) DEFAULT NULL COMMENT '注册时间',
  `last_login_time` int(10) DEFAULT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(15) DEFAULT '未知' COMMENT '登录IP',
  PRIMARY KEY (`user_id`),
  KEY `username` (`username`),
  KEY `group_id` (`group_id`) USING BTREE,
  KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='后台管理员' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `dux_admin_user`
--

INSERT INTO `dux_admin_user` (`user_id`, `group_id`, `username`, `password`, `nicename`, `email`, `status`, `level`, `reg_time`, `last_login_time`, `last_login_ip`) VALUES
(1, 1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '管理员', 'admin@duxcms.com', 1, 1, 1399361747, 1503193817, '::1');

-- --------------------------------------------------------

--
-- 表的结构 `dux_category`
--

CREATE TABLE IF NOT EXISTS `dux_category` (
  `class_id` int(10) NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) DEFAULT '0',
  `app` varchar(20) DEFAULT NULL,
  `show` tinyint(1) unsigned DEFAULT '1',
  `sequence` int(10) DEFAULT '0',
  `type` int(10) NOT NULL DEFAULT '1',
  `name` varchar(250) DEFAULT NULL,
  `urlname` varchar(250) DEFAULT NULL,
  `subname` varchar(250) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `class_tpl` varchar(250) DEFAULT NULL,
  `keywords` varchar(250) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `upload_config` int(10) DEFAULT '1',
  PRIMARY KEY (`class_id`),
  UNIQUE KEY `urlname` (`urlname`) USING BTREE,
  KEY `pid` (`parent_id`),
  KEY `mid` (`app`),
  KEY `sequence` (`sequence`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='栏目基础信息' AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `dux_category`
--

INSERT INTO `dux_category` (`class_id`, `parent_id`, `app`, `show`, `sequence`, `type`, `name`, `urlname`, `subname`, `image`, `class_tpl`, `keywords`, `description`, `upload_config`) VALUES
(1, 0, 'page', 1, 1, 1, '品牌简介', 'pinpaijianjie', '11', '/adcms/upload/2017-07-12/d09e4b0dd4d0838caa71c600c739cee1.png', 'ppjj', '', '', 1),
(2, 0, 'article', 1, 1, 1, '服务案例', 'fuwuanli', '', '', 'fwal', '', '', 1),
(5, 0, 'page', 1, 1, 1, '联系我们', 'lianxiwomen', '', '', 'lxwm', '', '', 1),
(6, 0, 'article', 1, 1, 1, '新闻动态', 'xinwendongtai', '', '', 'xwdt', '', '', 1),
(8, 2, 'article', 1, 1, 1, '户外广告工程案例', 'huwaiguanggaogongchenganli', '', '', 'list', '', '', 1),
(9, 2, 'article', 1, 1, 1, 'LED显示屏 亮化工程案例', 'LEDxianshiping-lianghuagongche', '', '', 'list', '', '', 1),
(10, 2, 'article', 1, 1, 1, '文化墙 展板 标牌案例', 'wenhuaqiang-zhanban-biaopaianl', '', '', 'list', '', '', 1),
(11, 2, 'article', 1, 1, 1, '彩印 名片 画册案例', 'caiyin-mingpian-huaceanli', '', '', 'list', '', '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `dux_category_article`
--

CREATE TABLE IF NOT EXISTS `dux_category_article` (
  `class_id` int(10) NOT NULL,
  `fieldset_id` int(10) NOT NULL,
  `content_tpl` varchar(250) NOT NULL,
  `config_upload` text NOT NULL,
  `content_order` varchar(250) NOT NULL,
  `page` int(10) NOT NULL DEFAULT '10'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章栏目信息';

--
-- 转存表中的数据 `dux_category_article`
--

INSERT INTO `dux_category_article` (`class_id`, `fieldset_id`, `content_tpl`, `config_upload`, `content_order`, `page`) VALUES
(2, 0, 'content', '', 'time DESC', 10),
(6, 0, 'content', '', 'time DESC', 6),
(8, 0, 'content', '', 'time DESC', 10),
(9, 0, 'content', '', 'time DESC', 10),
(10, 0, 'content', '', 'time DESC', 10),
(11, 0, 'content', '', 'time DESC', 10);

-- --------------------------------------------------------

--
-- 表的结构 `dux_category_page`
--

CREATE TABLE IF NOT EXISTS `dux_category_page` (
  `class_id` int(10) unsigned NOT NULL DEFAULT '0',
  `content` mediumtext COMMENT '内容',
  KEY `cid` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='单页栏目信息';

--
-- 转存表中的数据 `dux_category_page`
--

INSERT INTO `dux_category_page` (`class_id`, `content`) VALUES
(1, '&lt;p&gt;\r\n	&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 亳州扬名广告标识有限公司成立于2017年，注册资金100万元，从默默无闻到行业领先，凭着亳州君意广告策划资源优势以及出色的技术和服务，君意广告策划已经成为亳州领先的广告综合服务提供商。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 公司与本地多个镇直单位、学校、医院、电子厂、4S店建立起了广泛良好的合作关系。一流的服务质量，完美的客户体验以及高水准的专业服务团队，为企业、政府单位建立优秀的文化形象、打造卓越广泛的品牌知名度，构建企业的核心竞争力优势。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 公司秉承“专业、求实、创新、进取、诚信、高效”的经营理念，以“为客户创造更多价值”为宗旨。凭借优质设计方案、专业团队、雄厚的实力和丰富的经验在亳州及周边城镇取得良好的口碑，得到众客户的认可与信赖。帮助客户在广告、宣传方面取得更好的效果。在当前这个环境下，君意人将通过不断学习、努力进取发挥尽致自身力量，将梦想变为现实！顽强向强，永不止步...\r\n&lt;/p&gt;'),
(5, '&lt;span style=&quot;color:#4b4b4b;&quot;&gt; \r\n&lt;p style=&quot;font-family:宋体;font-size:12px;&quot;&gt;\r\n	&lt;span style=&quot;font-size:15px;font-family:微软雅黑;&quot;&gt;HEELO!&lt;/span&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;font-family:宋体;font-size:12px;&quot;&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;span style=&quot;line-height:30px;&quot;&gt; \r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-family:微软雅黑;font-size:15px;&quot;&gt;经营理念：&lt;/span&gt;&lt;span style=&quot;font-size:15px;&quot;&gt;为客户创造更多价值！&lt;/span&gt; \r\n&lt;/p&gt;\r\n&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#4b4b4b;&quot;&gt;&lt;span style=&quot;line-height:30px;&quot;&gt; \r\n&lt;p style=&quot;font-family:宋体;font-size:12px;&quot;&gt;\r\n	&lt;span style=&quot;font-size:15px;font-family:微软雅黑;&quot;&gt;企业文化：&lt;/span&gt;&lt;span style=&quot;font-size:15px;font-family:微软雅黑;&quot;&gt;充分信任，互相支持，聚焦需求，共同发展&lt;/span&gt; \r\n&lt;/p&gt;\r\n&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#4b4b4b;&quot;&gt;&lt;span style=&quot;line-height:30px;&quot;&gt; \r\n&lt;p style=&quot;font-family:宋体;font-size:12px;&quot;&gt;\r\n	&lt;span style=&quot;font-size:15px;font-family:微软雅黑;&quot;&gt;*若您阅览以上信息之后，有合作意向，请您为我们留言或使用以下方式联系我们，&lt;/span&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;font-family:宋体;font-size:12px;&quot;&gt;\r\n	&lt;span style=&quot;font-size:15px;font-family:微软雅黑;&quot;&gt;我们&lt;/span&gt;&lt;span style=&quot;font-family:微软雅黑;font-size:15px;&quot;&gt;将尽快给您回复，并为您提供最真诚的服务，谢谢您的支持。&lt;/span&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;font-family:宋体;font-size:12px;&quot;&gt;\r\n	&lt;span style=&quot;font-family:微软雅黑;font-size:15px;&quot;&gt;&lt;br /&gt;\r\n&lt;/span&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;font-family:宋体;font-size:12px;&quot;&gt;\r\n	&lt;span style=&quot;font-family:微软雅黑;font-size:15px;&quot;&gt;&lt;span style=&quot;color:#399ec3;&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;b&gt;&lt;span style=&quot;color:rgba(66,165,246,1);&quot;&gt;扬名广告标识有限公司（亳州公司）&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#4b4b4b;&quot;&gt;&lt;span style=&quot;line-height:30px;&quot;&gt; \r\n&lt;p style=&quot;font-family:宋体;font-size:12px;&quot;&gt;\r\n	&lt;span style=&quot;font-family:微软雅黑;font-size:15px;&quot;&gt;&lt;span style=&quot;color:#399ec3;&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;b&gt;&lt;span style=&quot;color:rgba(66,165,246,1);&quot;&gt;&lt;span style=&quot;color:#399ec3;&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;span style=&quot;color:rgba(100,181,246,1);&quot;&gt;&lt;span style=&quot;color:rgba(75,75,75,1);&quot;&gt;&lt;span style=&quot;color:#4b4b4b;&quot;&gt;&lt;span style=&quot;line-height:30px;&quot;&gt;&lt;span style=&quot;font-family:微软雅黑;font-size:15px;&quot;&gt;&lt;span style=&quot;color:#399ec3;&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;b&gt;&lt;span style=&quot;color:rgba(66,165,246,1);&quot;&gt;&lt;span style=&quot;color:#399ec3;&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;span style=&quot;color:rgba(100,181,246,1);&quot;&gt;&lt;span style=&quot;color:rgba(75,75,75,1);&quot;&gt;&lt;img id=&quot;float_img_350&quot; class=&quot;float_in_img J_defImage &quot; src=&quot;http://11108381.s61i.faiusr.com/4/AD0InYCmBRAEGAAg-NmIvwUo-ZeQ4gIwHTgd.png&quot; alt=&quot;AD0InYCmBRAEGAAg-NmIvwUo-ZeQ4gIwHTgd&quot; style=&quot;margin-top:0px;margin-left:0px;&quot; width=&quot;23&quot; height=&quot;23&quot; /&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:32px;&quot;&gt;&lt;span style=&quot;font-size:24px;&quot;&gt; 王经理：13665688360&amp;nbsp; &lt;br /&gt;\r\n&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;font-family:宋体;font-size:12px;&quot;&gt;\r\n	&lt;span style=&quot;font-family:微软雅黑;font-size:15px;&quot;&gt;&lt;span style=&quot;color:#399ec3;&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;b&gt;&lt;span style=&quot;color:rgba(66,165,246,1);&quot;&gt;&lt;span style=&quot;color:#399ec3;&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;span style=&quot;color:rgba(100,181,246,1);&quot;&gt;&lt;span style=&quot;color:rgba(75,75,75,1);&quot;&gt;&lt;span style=&quot;font-size:32px;&quot;&gt;&lt;span style=&quot;font-size:24px;&quot;&gt;&lt;span style=&quot;color:#4b4b4b;&quot;&gt;&lt;span style=&quot;line-height:30px;&quot;&gt;&lt;span style=&quot;font-family:微软雅黑;font-size:15px;&quot;&gt;&lt;span style=&quot;color:#399ec3;&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;b&gt;&lt;span style=&quot;color:rgba(66,165,246,1);&quot;&gt;&lt;span style=&quot;color:#399ec3;&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;span style=&quot;color:rgba(100,181,246,1);&quot;&gt;&lt;span style=&quot;color:rgba(75,75,75,1);&quot;&gt;&lt;span style=&quot;color:#4b4b4b;&quot;&gt;&lt;span style=&quot;line-height:30px;&quot;&gt;&lt;span style=&quot;font-family:微软雅黑;font-size:15px;&quot;&gt;&lt;span style=&quot;color:#399ec3;&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;b&gt;&lt;span style=&quot;color:rgba(66,165,246,1);&quot;&gt;&lt;span style=&quot;color:#399ec3;&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;span style=&quot;color:rgba(100,181,246,1);&quot;&gt;&lt;span style=&quot;color:rgba(75,75,75,1);&quot;&gt;&lt;img id=&quot;float_img_350&quot; class=&quot;float_in_img J_defImage &quot; src=&quot;http://11108381.s61i.faiusr.com/4/AD0InYCmBRAEGAAg-NmIvwUo-ZeQ4gIwHTgd.png&quot; alt=&quot;AD0InYCmBRAEGAAg-NmIvwUo-ZeQ4gIwHTgd&quot; style=&quot;margin-top:0px;margin-left:0px;&quot; width=&quot;23&quot; height=&quot;23&quot; /&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:32px;&quot;&gt;&lt;span style=&quot;font-size:24px;&quot;&gt; 王经理：&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;18856707987&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;font-family:宋体;font-size:12px;&quot;&gt;\r\n	&lt;span style=&quot;font-family:微软雅黑;font-size:15px;&quot;&gt;&lt;span style=&quot;color:#399ec3;&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;b&gt;&lt;span style=&quot;color:rgba(66,165,246,1);&quot;&gt;&lt;span style=&quot;color:#399ec3;&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;span style=&quot;color:rgba(100,181,246,1);&quot;&gt;&lt;span style=&quot;color:rgba(75,75,75,1);&quot;&gt;&lt;span style=&quot;font-size:32px;&quot;&gt;&lt;span style=&quot;font-size:24px;&quot;&gt;&lt;/span&gt; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#4b4b4b;&quot;&gt;&lt;span style=&quot;line-height:30px;&quot;&gt;&lt;span style=&quot;font-family:微软雅黑;font-size:15px;&quot;&gt;&lt;span style=&quot;color:#399ec3;&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;b&gt;&lt;span style=&quot;color:rgba(66,165,246,1);&quot;&gt;&lt;span style=&quot;color:#399ec3;&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;span style=&quot;color:rgba(100,181,246,1);&quot;&gt;&lt;span style=&quot;color:rgba(75,75,75,1);&quot;&gt;&lt;span style=&quot;color:#4b4b4b;&quot;&gt;&lt;span style=&quot;line-height:30px;&quot;&gt;&lt;span style=&quot;font-family:微软雅黑;font-size:15px;&quot;&gt;&lt;span style=&quot;color:#399ec3;&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;b&gt;&lt;span style=&quot;color:rgba(66,165,246,1);&quot;&gt;&lt;span style=&quot;color:#399ec3;&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;span style=&quot;color:rgba(100,181,246,1);&quot;&gt;&lt;span style=&quot;color:rgba(75,75,75,1);&quot;&gt;&lt;span style=&quot;color:#399EC3;font-size:24px;&quot;&gt;&lt;span style=&quot;font-size:24px;&quot;&gt;&lt;span style=&quot;color:#64B5F6;font-size:24px;&quot;&gt;&lt;span style=&quot;color:#353535;font-size:24px;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;font-family:宋体;font-size:12px;&quot;&gt;\r\n	&lt;span style=&quot;color:#4b4b4b;&quot;&gt;&lt;span style=&quot;line-height:30px;&quot;&gt;&lt;span style=&quot;font-family:微软雅黑;font-size:15px;&quot;&gt;&lt;span style=&quot;color:#399ec3;&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;b&gt;&lt;span style=&quot;color:rgba(66,165,246,1);&quot;&gt;&lt;span style=&quot;color:#399ec3;&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;span style=&quot;color:rgba(100,181,246,1);&quot;&gt;&lt;span style=&quot;color:rgba(75,75,75,1);&quot;&gt;&lt;span style=&quot;color:#4b4b4b;&quot;&gt;&lt;span style=&quot;line-height:30px;&quot;&gt;&lt;span style=&quot;font-family:微软雅黑;font-size:15px;&quot;&gt;&lt;span style=&quot;color:#399ec3;&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;b&gt;&lt;span style=&quot;color:rgba(66,165,246,1);&quot;&gt;&lt;span style=&quot;color:#399ec3;&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;span style=&quot;color:rgba(100,181,246,1);&quot;&gt;&lt;span style=&quot;color:rgba(75,75,75,1);&quot;&gt;&lt;span style=&quot;color:#399EC3;font-size:24px;&quot;&gt;&lt;span style=&quot;font-size:24px;&quot;&gt;&lt;span style=&quot;color:#64B5F6;font-size:24px;&quot;&gt;&lt;span style=&quot;color:#353535;font-size:24px;&quot;&gt;&lt;img id=&quot;float_img_351&quot; class=&quot;float_in_img J_defImage &quot; src=&quot;http://11108381.s61i.faiusr.com/4/AD0InYCmBRAEGAAgjtqIvwUo8t3aggYwHTgX.png&quot; alt=&quot;AD0InYCmBRAEGAAgjtqIvwUo8t3aggYwHTgX&quot; style=&quot;margin-top:0px;margin-left:0px;height:23px;&quot; /&gt; &lt;span style=&quot;font-size:24px;&quot;&gt;&lt;span style=&quot;color:#64B5F6;font-size:24px;&quot;&gt;&lt;span style=&quot;color:#353535;font-size:24px;&quot;&gt;12345678@qq.com&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;font-family:宋体;font-size:12px;&quot;&gt;\r\n	&lt;span style=&quot;color:#4b4b4b;&quot;&gt;&lt;span style=&quot;line-height:30px;&quot;&gt;&lt;span style=&quot;font-family:微软雅黑;font-size:15px;&quot;&gt;&lt;span style=&quot;color:#399ec3;&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;b&gt;&lt;span style=&quot;color:rgba(66,165,246,1);&quot;&gt;&lt;span style=&quot;color:#399ec3;&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;span style=&quot;color:rgba(100,181,246,1);&quot;&gt;&lt;span style=&quot;color:rgba(75,75,75,1);&quot;&gt;&lt;span style=&quot;color:#4b4b4b;&quot;&gt;&lt;span style=&quot;line-height:30px;&quot;&gt;&lt;span style=&quot;font-family:微软雅黑;font-size:15px;&quot;&gt;&lt;span style=&quot;color:#399ec3;&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;b&gt;&lt;span style=&quot;color:rgba(66,165,246,1);&quot;&gt;&lt;span style=&quot;color:#399ec3;&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;span style=&quot;color:rgba(100,181,246,1);&quot;&gt;&lt;span style=&quot;color:rgba(75,75,75,1);&quot;&gt;&lt;span style=&quot;color:#399EC3;font-size:24px;&quot;&gt;&lt;span style=&quot;font-size:24px;&quot;&gt;&lt;span style=&quot;color:#64B5F6;font-size:24px;&quot;&gt;&lt;span style=&quot;color:#353535;font-size:24px;&quot;&gt;&lt;span style=&quot;font-size:24px;&quot;&gt;&lt;span style=&quot;color:#64B5F6;font-size:24px;&quot;&gt;&lt;span style=&quot;color:#353535;font-size:24px;&quot;&gt;&lt;img id=&quot;float_img_349&quot; class=&quot;float_in_img J_defImage &quot; src=&quot;http://11108381.s61i.faiusr.com/4/AD0InYCmBRAEGAAg39mIvwUo0IuhJjAdOB0.png&quot; alt=&quot;AD0InYCmBRAEGAAg39mIvwUo0IuhJjAdOB0&quot; style=&quot;margin-top:0px;margin-left:0px;height:29px;&quot; /&gt; &lt;span style=&quot;font-size:24px;&quot;&gt;&lt;span style=&quot;color:#A3A3A3;font-size:24px;&quot;&gt;&lt;span style=&quot;color:#4B4B4B;font-size:24px;&quot;&gt;&lt;span style=&quot;font-size:24px;&quot;&gt;&lt;span style=&quot;color:#353535;font-size:24px;&quot;&gt;联系地址：亳州市谯城区文帝西路939号（千家福超市对面）&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;font-family:宋体;font-size:12px;&quot;&gt;\r\n	&lt;span style=&quot;color:#4b4b4b;&quot;&gt;&lt;span style=&quot;line-height:30px;&quot;&gt;&lt;span style=&quot;font-family:微软雅黑;font-size:15px;&quot;&gt;&lt;span style=&quot;color:#399ec3;&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;b&gt;&lt;span style=&quot;color:rgba(66,165,246,1);&quot;&gt;&lt;span style=&quot;color:#399ec3;&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;span style=&quot;color:rgba(100,181,246,1);&quot;&gt;&lt;span style=&quot;color:rgba(75,75,75,1);&quot;&gt;&lt;span style=&quot;color:#4b4b4b;&quot;&gt;&lt;span style=&quot;line-height:30px;&quot;&gt;&lt;span style=&quot;font-family:微软雅黑;font-size:15px;&quot;&gt;&lt;span style=&quot;color:#399ec3;&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;b&gt;&lt;span style=&quot;color:rgba(66,165,246,1);&quot;&gt;&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt; \r\n	&lt;iframe src=&quot;http://localhost/adcms/public/lib/js/keditor/plugins/baidumap/index.html?center=115.76608%2C33.866605&amp;zoom=19&amp;width=900&amp;height=400&amp;markers=115.76608%2C33.866605&amp;markerStyles=l%2CA&quot; style=&quot;width:900px;height:400px;&quot; frameborder=&quot;0&quot;&gt;\r\n	&lt;/iframe&gt;\r\n&lt;br /&gt;\r\n&lt;span style=&quot;font-family:微软雅黑;font-size:15px;&quot;&gt;&lt;span style=&quot;color:#399ec3;&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;b&gt;&lt;span style=&quot;color:rgba(66,165,246,1);&quot;&gt;&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:微软雅黑;font-size:15px;&quot;&gt;&lt;span style=&quot;color:#399ec3;&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;b&gt;&lt;span style=&quot;color:rgba(66,165,246,1);&quot;&gt;&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;br /&gt;\r\n&lt;/span&gt; \r\n&lt;/p&gt;\r\n&lt;/span&gt;&lt;/span&gt;');

-- --------------------------------------------------------

--
-- 表的结构 `dux_config`
--

CREATE TABLE IF NOT EXISTS `dux_config` (
  `name` varchar(250) NOT NULL,
  `data` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='网站配置';

--
-- 转存表中的数据 `dux_config`
--

INSERT INTO `dux_config` (`name`, `data`) VALUES
('site_title', '亳州扬名广告标识有限公司'),
('site_subtitle', '-一个专注于广告业务的公司'),
('site_url', ''),
('site_keywords', '广告，亳州扬名，扬名广告，广告业务'),
('site_description', '公司地址:亳州市谯城区文帝西路939号（千家福超市对面）'),
('site_email', '977591972@qq.com'),
('site_copyright', '皖ICP备12345XXXXX号'),
('site_statistics', ''),
('tpl_name', 'sanhe'),
('tpl_index', 'hz'),
('tpl_search', 'search'),
('tpl_tags', 'tag'),
('mobile_status', '0'),
('mobile_tpl', 'mobile'),
('mobile_domain', '');

-- --------------------------------------------------------

--
-- 表的结构 `dux_config_upload`
--

CREATE TABLE IF NOT EXISTS `dux_config_upload` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `upload_size` int(10) NOT NULL,
  `upload_exts` varchar(250) DEFAULT NULL,
  `upload_replace` tinyint(1) DEFAULT NULL,
  `thumb_status` tinyint(1) DEFAULT NULL,
  `water_status` tinyint(1) DEFAULT NULL,
  `thumb_type` tinyint(1) DEFAULT NULL,
  `thumb_width` int(10) DEFAULT NULL,
  `thumb_height` int(10) DEFAULT NULL,
  `water_image` varchar(250) DEFAULT NULL,
  `water_position` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='网站配置' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `dux_config_upload`
--

INSERT INTO `dux_config_upload` (`id`, `name`, `upload_size`, `upload_exts`, `upload_replace`, `thumb_status`, `water_status`, `thumb_type`, `thumb_width`, `thumb_height`, `water_image`, `water_position`) VALUES
(1, '默认', 10, 'jpg,gif,bmp,png', 0, 0, 0, 1, 800, 800, 'logo.jpg', 1);

-- --------------------------------------------------------

--
-- 表的结构 `dux_content`
--

CREATE TABLE IF NOT EXISTS `dux_content` (
  `content_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `class_id` int(10) DEFAULT NULL COMMENT '栏目ID',
  `title` varchar(250) DEFAULT NULL COMMENT '标题',
  `urltitle` varchar(250) DEFAULT NULL COMMENT 'URL路径',
  `font_color` varchar(250) DEFAULT NULL COMMENT '颜色',
  `font_bold` tinyint(1) DEFAULT NULL COMMENT '加粗',
  `font_em` tinyint(1) DEFAULT NULL,
  `position` varchar(250) DEFAULT NULL,
  `keywords` varchar(250) DEFAULT NULL COMMENT '关键词',
  `description` varchar(250) DEFAULT NULL COMMENT '描述',
  `time` int(10) DEFAULT NULL COMMENT '更新时间',
  `image` varchar(250) DEFAULT NULL COMMENT '封面图',
  `url` varchar(250) DEFAULT NULL COMMENT '跳转',
  `sequence` int(10) DEFAULT NULL COMMENT '排序',
  `status` int(10) DEFAULT NULL COMMENT '状态',
  `copyfrom` varchar(250) DEFAULT NULL COMMENT '来源',
  `views` int(10) DEFAULT '0' COMMENT '浏览数',
  `taglink` int(10) DEFAULT '0' COMMENT 'TAG链接',
  `tpl` varchar(250) DEFAULT NULL,
  `site` int(10) DEFAULT '1',
  PRIMARY KEY (`content_id`),
  UNIQUE KEY `urltitle` (`urltitle`) USING BTREE,
  KEY `title` (`title`) USING BTREE,
  KEY `description` (`description`) USING BTREE,
  KEY `keywords` (`keywords`),
  KEY `class_id` (`class_id`) USING BTREE,
  KEY `time` (`time`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='内容基础' AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `dux_content`
--

INSERT INTO `dux_content` (`content_id`, `class_id`, `title`, `urltitle`, `font_color`, `font_bold`, `font_em`, `position`, `keywords`, `description`, `time`, `image`, `url`, `sequence`, `status`, `copyfrom`, `views`, `taglink`, `tpl`, `site`) VALUES
(1, 8, '建安集团 亳州福寿陵园项目工地', 'jiananjituan-zhoufushoulingyua', '0', 0, 0, '', '', '', 1499833260, '/adcms/upload/2017-07-12/467790e34633b3282fd7ce55928e6369.jpg', '', 0, 1, '本站', 0, 1, '', 1),
(2, 9, '超市LED显示屏', 'chaoshiLEDxianshiping', '0', 0, 0, '', '', '这是超市LED显示频', 1499851920, '/adcms/upload/2017-07-12/3a7940742aa3819fae45bb24e3b51505.jpg', '', 0, 1, '本站', 0, 1, '', 1),
(3, 10, '娱乐室标牌', 'yuleshibiaopai', '0', 0, 0, '', '', '测试用例', 1499851980, '/adcms/upload/2017-07-12/c2f3121a33899e366d5609812e961d02.jpg', '', 0, 1, '本站', 0, 1, '', 1),
(4, 11, '华信公司名片制作', 'huaxingongsimingpianzhizuo', '0', 0, 0, '', '', '测试用例', 1499852100, '/adcms/upload/2017-07-12/7f30fe1400dda3507216d7a99bfcc013.jpg', '', 0, 1, '本站', 0, 1, '', 1),
(5, 6, '树脂发光字的安装方法', 'shuzhifaguangzideanzhuangfangf', '0', 0, 0, '', '', '    树脂发光字是相对高档的工艺字，无论是在流程上，还是在材料上，都比其他工艺字要求要高，因此我们在安装树脂发光字的时候，必须因地制宜，用最恰当的方法以避免树脂发光字刮花', 1499860260, '/adcms/upload/2017-07-12/f3b71f738ed8e1e9a118cab9afedece2.png', '', 0, 1, '本站', 0, 1, '', 1),
(6, 6, '广告公司如何给客户创造更多价值？', 'guanggaogongsiruhegeikehuchuan', '0', 0, 0, '', '', ' 亳州扬名广告有限责任公司作为一家专业的品牌策划、展厅设计、门头招牌、楼顶发光字、大型广告施工综合广告服务商, 能否为客户带来相应的利益决定了这家广告公司的在市场的地位。', 1499861460, '/adcms/upload/2017-07-12/cc94d822e00f5f9d08f3a9a040e94e36.png', '', 0, 1, '本站', 0, 1, '', 1),
(7, 6, '门面广告有哪些材质？', 'menmianguanggaoyounaxiecaizhi', '0', 0, 0, '', '', ' 门面广告有哪些材质？想要确定门面广告材料就要考虑其具体环境以及设计，尤其是是否要选择防水材料很关键，主要的材质有铝塑板，玻璃，不锈钢、扣板、钢板雕花、长城板材质等。&em', 1499861580, '/adcms/upload/2017-07-12/372d2e98428b5352694efca47ef726ef.jpg', '', 0, 1, '本站', 0, 1, '', 1),
(8, 6, '名片好不好，纸张选择很重要', 'mingpianhaobuhaozhizhangxuanze', '0', 0, 0, '', '', '一、名片印刷纸张分类名片印刷根据纸张种类可以分为普通名片印刷(铜版纸名片)、特种纸名片印刷、高档纸名片印刷、PVC名片印刷。二、常用纸质名片材料常用的名片纸张有铜版纸，布纹', 1499861700, '/adcms/upload/2017-07-12/2c974b9ae8116c9d60b5783aec704c17.jpg', '', 0, 1, '本站', 0, 1, '', 1),
(9, 6, '门头广告招牌底板有几种？', 'mentouguanggaozhaopaidibanyouj', '0', 0, 0, '', '', '广告招牌底板是一种表达企业、店铺经营特色的广告牌匾，实际上也是商家的品牌标识。 广告招牌底板种类繁多，根据材质不同大致分为彩钢扣板、三维扣板、烤漆玻璃、铝塑板、生态木、', 1499861760, '/adcms/upload/2017-07-12/c1f286369904f674aba24cafa8ffdb4c.jpg', '', 0, 1, '本站', 0, 1, '', 1),
(10, 6, '为家乡亳州代言 古井贡酒成功推出读亳（bó）广告营销 ', 'weijiaxiangzhoudaiyan-gujinggo', '0', 0, 0, '', '', '期，微信朋友圈、新浪微博、百度贴吧、@亳州在线等媒体上广大网友纷纷为古井贡酒央视春晚特约广告播出点赞，并引发了社会各界广泛关注。 作为中国老八大名酒之一的古井贡酒，源起', 1499861820, '/adcms/upload/2017-07-12/b669ece9a2baefe34f47230e3b677930.jpg', '', 0, 1, '本站', 0, 1, '', 1),
(11, 6, '亳州最大的广告公司？', 'zhouzuidadeguanggaogongsi', '0', 0, 0, '', '', '亳州最大的广告公司有几家，不过君意广告公司在本行业还是相当不错的，与本地政府、学校、医院、汽车4S店等规模较大的公司都有密切合', 1499861880, '/adcms/upload/2017-07-12/57c9272466fa18d3191ca5ddac55414b.png', '', 0, 1, '本站', 0, 1, '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `dux_content_article`
--

CREATE TABLE IF NOT EXISTS `dux_content_article` (
  `content_id` int(10) DEFAULT NULL,
  `content` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章内容信息';

--
-- 转存表中的数据 `dux_content_article`
--

INSERT INTO `dux_content_article` (`content_id`, `content`) VALUES
(1, '&lt;p&gt;\r\n	&lt;img src=&quot;/adcms/upload/2017-07-12/c3199756d91610e9aac8fad27d266c17.jpg&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;/adcms/upload/2017-07-12/b8265b9239f6d0a04fd115b0bcf56d23.jpg&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;'),
(2, '&lt;p&gt;\r\n	这是超市LED显示频\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;/adcms/upload/2017-07-12/3a7940742aa3819fae45bb24e3b51505.jpg&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;'),
(3, '&lt;p&gt;\r\n	测试用例\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;http://localhost/adcms/public/lib/js/keditor/plugins/emoticons/images/0.gif&quot; alt=&quot;&quot; border=&quot;0&quot; /&gt;\r\n&lt;/p&gt;'),
(4, '&lt;p&gt;\r\n	测试用例\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;/adcms/upload/2017-07-12/7f30fe1400dda3507216d7a99bfcc013.jpg&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;'),
(5, '&lt;p&gt;\r\n	&lt;span style=&quot;font-size:17px;&quot;&gt; &amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp; 树脂&lt;/span&gt;&lt;span style=&quot;font-size:12px;&quot;&gt;&lt;span style=&quot;font-size:17px;&quot;&gt;发光字&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:17px;&quot;&gt;是相对高档的工艺字，无论是在流程上，还是在材料上，都比其他工艺字要求要高，因此我们在安装树脂发光字的时候，必须因地制宜，用最恰当的方法以避免树脂发光字刮花或损坏情况。君意广告为您罗列了以下几种安装方法。&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size:17px;&quot;&gt; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;树脂发光字相对比较常用于室内，而安装的方式取决于安装的地方不同，如有不锈钢、玻璃、大理石、木工板不同的地方，因此安装的方式也会不同。笔者整理了以下几个常用的安装方式：&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size:17px;&quot;&gt;一、不锈钢安装方式&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size:17px;&quot;&gt; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; 广美标识在安装的时候会采用玻璃胶和热熔胶混合使用，不锈钢装不锈钢上也可以采用螺丝固定。&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size:17px;&quot;&gt;二、玻璃面板安装方式&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size:17px;&quot;&gt; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;对于容易损坏的玻璃面板，广美建议使用玻璃胶和热熔胶混合使用，这样既可以保持树脂发光字的美观，也保护玻璃面板不被破坏。&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size:17px;&quot;&gt;三、大理石安装方式&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size:17px;&quot;&gt; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;大理石一般会比较少碰到，如果要安装大理石上，最好的方式是玻璃胶和螺丝固定。&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size:17px;&quot;&gt;四、木工板安装方式&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size:17px;&quot;&gt; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;木工板是较常碰到的，如果安装比较高，最好就是用螺丝固定了。&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size:17px;&quot;&gt; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;让然，除了这几种方式以外，还有很多其他的安装方式，同样的安装方式不一定适合所有地方，因此在注重质量的同时，也需要找到合适的安装方式。&lt;/span&gt;\r\n&lt;/p&gt;'),
(6, '&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 亳州扬名广告有限责任公司作为一家专业的品牌策划、展厅设计、门头招牌、楼顶发光字、大型广告施工综合广告服务商, \r\n能否为客户带来相应的利益决定了这家广告公司的在市场的地位。广告，这种宣传方式，是商家用来宣传自己的主流方式，它可以给商家带来大量的客户，不过前提是广告有没有创意。没有创意的广告只会让人看了厌烦，更不用说什么给客户带来效益了。而君意广告公司的存在，就是把广告性化、创意化。让死板的广告变的有趣味，让它拥有生命的气息，让它不在惹人们厌烦。如果一家广告公司不能够做到这一点，那很遗憾，这家广告公司的下场就是倒闭。那作为一家广告公司，那如何才能做到这点呢？\r\n&lt;p&gt;\r\n	&amp;emsp;&amp;emsp;创意这东西，是每个人都清楚的。在广告行业，每个广告策划师都清楚，只有一个拥有创意的广告才可以给客户带来效益。可是所有的创意广告都能给客户带来效益吗？答案是否定的。创意这东西，也有好坏之分。一个好的创意可以给客户带来效益，一个坏的创意则不行。什么叫做好的创意，这就需要策划师抓住人们的心理。因为只有人们认为好的，那这个创意没有任何的疑问，是个好的创意。例如韩国现代汽车的一则广告，非常的具有创意。但是它的内容并不能得到人们的认同，因此虽然有创意但却不是一个好的创意。广告的内容讲述的是一个男人想要利用车自杀却没有自杀的事情。这种内容很那让人接受，而这也注定了它不是一个好的创意。\r\n&lt;/p&gt;'),
(7, '&lt;span style=&quot;font-family:微软雅黑;color:#404040;letter-spacing:0;font-size:13px;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 门面广告有哪些材质？想要确定门面广告材料就要考虑其具体环境以及设计，尤其是是否要选择防水材料很关键，主要的材质有铝塑板，玻璃，不锈钢、扣板、钢板雕花、长城板材质等。&lt;/span&gt;\r\n&lt;p style=&quot;text-indent:0;line-height:24px;background:#FFFFFF;margin-left:0;&quot;&gt;\r\n	&lt;span style=&quot;font-family:微软雅黑;color:#404040;letter-spacing:0;font-size:13px;&quot;&gt;&amp;emsp;&amp;emsp;根据门面设计的各个细节，比如招牌设计、橱窗设计、外部照明设计等等来考虑，店面需要给人一种整体感觉，然后选择材料，将会更好的凸显档次、个性，从整体风格来看还可分为现代风格与传统风格。&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-indent:0;line-height:24px;background:#FFFFFF;margin-left:0;&quot;&gt;\r\n	&lt;span style=&quot;font-family:微软雅黑;color:#404040;letter-spacing:0;font-size:13px;&quot;&gt;&lt;span style=&quot;font-family:微软雅黑;&quot;&gt;&amp;emsp;&amp;emsp;一、门面材质：铝塑板&lt;/span&gt;+不锈钢发光字&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-indent:0;line-height:24px;background:#FFFFFF;margin-left:0;&quot;&gt;\r\n	&lt;span style=&quot;font-family:微软雅黑;color:#404040;letter-spacing:0;font-size:13px;&quot;&gt;&lt;span style=&quot;font-family:微软雅黑;&quot;&gt;&amp;emsp;&amp;emsp;二、防腐木&lt;/span&gt;+led发光字&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-indent:0;line-height:24px;background:#FFFFFF;margin-left:0;&quot;&gt;\r\n	&lt;span style=&quot;font-family:微软雅黑;color:#404040;letter-spacing:0;font-size:13px;&quot;&gt;&lt;span style=&quot;font-family:微软雅黑;&quot;&gt;&amp;emsp;&amp;emsp;三、门面原墙&lt;/span&gt;+亚克力字+吸塑发光字&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-indent:0;line-height:24px;background:#FFFFFF;margin-left:0;&quot;&gt;\r\n	&lt;span style=&quot;font-family:微软雅黑;color:#404040;letter-spacing:0;font-size:13px;&quot;&gt;&amp;emsp;&amp;emsp;门头用什么材料，现代风格给人一种整体感觉，体现店面的档次个性，以及大众化、时尚化感觉。传统风格外观给人稳健、踏实感，所以我们还要结合您所卖的产品来选择是现代风格还是传统风格，这样方可选择门头打造材料。&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-indent:0;line-height:24px;background:#FFFFFF;margin-left:0;&quot;&gt;\r\n	&lt;span style=&quot;font-family:微软雅黑;color:#404040;letter-spacing:0;font-size:13px;&quot;&gt;&amp;emsp;&amp;emsp;另外还要考虑普遍的材质，是不是人口密集度比较高的地方，这种能够聚集人气的地方我们要采取什么样的设计方式来给小店增加人气，从而带来了生意兴隆感。&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-indent:0;line-height:24px;background:#FFFFFF;margin-left:0;&quot;&gt;\r\n	&lt;span style=&quot;font-family:微软雅黑;color:#404040;letter-spacing:0;font-size:13px;&quot;&gt;&amp;emsp;&amp;emsp;店铺的外部造型是第一步，而且也有助于店铺的销售，多多注意商店外部造型将会达到树立企业形象为目的，按照这个整体外观造型选择材料，带来了更加独特特性，宣传了自己还招引了顾客。&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-indent:25px;line-height:24px;background:#FFFFFF;margin-left:0;&quot;&gt;\r\n	&lt;span style=&quot;font-family:微软雅黑;color:#404040;letter-spacing:0;font-size:13px;&quot;&gt;外观造型与区域景观也要保持一致，否则给顾客感觉不伦不类感，这样我们也会发挥好材料的特性，让其自然和谐。还要注意门头设计要注意大气，我们门头每天都要迎来送往多少客人呢，这也决定了店铺的兴衰，所以门头不能做的太小了。君意广告可免费为您量身打造属于你的个性门头招牌。&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-indent:25px;line-height:24px;background:#FFFFFF;margin-left:0;&quot;&gt;\r\n	&lt;span style=&quot;font-family:微软雅黑;color:#404040;letter-spacing:0;font-size:13px;&quot;&gt;PS：在亳州做门头一般需要申请审批后方可施工哦，不然城管不让施工的。&lt;span style=&quot;font-family:微软雅黑;&quot;&gt;&lt;br /&gt;\r\n&lt;/span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-indent:25px;line-height:24px;background:#FFFFFF;margin-left:0;&quot;&gt;\r\n	&lt;span style=&quot;font-family:微软雅黑;color:#404040;letter-spacing:0;font-size:13px;&quot;&gt;&lt;span style=&quot;font-family:微软雅黑;&quot;&gt;亳州扬名广告，为您创造更多价值！&lt;/span&gt;&lt;/span&gt;\r\n&lt;/p&gt;'),
(8, '&lt;p style=&quot;box-sizing:inherit;color:#333333;font-family:-apple-system, &#039;Helvetica Neue&#039;, Arial, &#039;PingFang SC&#039;, &#039;Hiragino Sans GB&#039;, &#039;Microsoft YaHei&#039;, &#039;WenQuanYi Micro Hei&#039;, sans-serif;font-size:medium;line-height:27.2px;margin-top:20px;margin-bottom:20px;&quot;&gt;\r\n	&lt;strong style=&quot;box-sizing:inherit;&quot;&gt;一、名片印刷纸张分类&lt;/strong&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;box-sizing:inherit;color:#333333;font-family:-apple-system, &#039;Helvetica Neue&#039;, Arial, &#039;PingFang SC&#039;, &#039;Hiragino Sans GB&#039;, &#039;Microsoft YaHei&#039;, &#039;WenQuanYi Micro Hei&#039;, sans-serif;font-size:medium;line-height:27.2px;margin-top:20px;margin-bottom:20px;&quot;&gt;\r\n	名片印刷根据纸张种类可以分为普通名片印刷(铜版纸名片)、特种纸名片印刷、高档纸名片印刷、PVC名片印刷。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;box-sizing:inherit;color:#333333;font-family:-apple-system, &#039;Helvetica Neue&#039;, Arial, &#039;PingFang SC&#039;, &#039;Hiragino Sans GB&#039;, &#039;Microsoft YaHei&#039;, &#039;WenQuanYi Micro Hei&#039;, sans-serif;font-size:medium;line-height:27.2px;margin-top:20px;margin-bottom:20px;&quot;&gt;\r\n	&lt;strong style=&quot;box-sizing:inherit;&quot;&gt;二、常用纸质名片材料&lt;/strong&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;box-sizing:inherit;color:#333333;font-family:-apple-system, &#039;Helvetica Neue&#039;, Arial, &#039;PingFang SC&#039;, &#039;Hiragino Sans GB&#039;, &#039;Microsoft YaHei&#039;, &#039;WenQuanYi Micro Hei&#039;, sans-serif;font-size:medium;line-height:27.2px;margin-top:20px;margin-bottom:20px;&quot;&gt;\r\n	常用的名片纸张有铜版纸，布纹纸，刚古纸，合成纸，冰白纸，荷兰白纸，安格纸，蛋壳纸，制作高档名片用的纸张有PVC透明纸，冰白纸，水晶磨砂等等。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;box-sizing:inherit;color:#333333;font-family:-apple-system, &#039;Helvetica Neue&#039;, Arial, &#039;PingFang SC&#039;, &#039;Hiragino Sans GB&#039;, &#039;Microsoft YaHei&#039;, &#039;WenQuanYi Micro Hei&#039;, sans-serif;font-size:medium;line-height:27.2px;margin-top:20px;margin-bottom:20px;&quot;&gt;\r\n	&lt;strong style=&quot;box-sizing:inherit;&quot;&gt;三、如何选择名片印刷纸张?&lt;/strong&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;box-sizing:inherit;color:#333333;font-family:-apple-system, &#039;Helvetica Neue&#039;, Arial, &#039;PingFang SC&#039;, &#039;Hiragino Sans GB&#039;, &#039;Microsoft YaHei&#039;, &#039;WenQuanYi Micro Hei&#039;, sans-serif;font-size:medium;line-height:27.2px;margin-top:20px;margin-bottom:20px;&quot;&gt;\r\n	1、大面积色块选择铜版纸印刷名片。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;box-sizing:inherit;color:#333333;font-family:-apple-system, &#039;Helvetica Neue&#039;, Arial, &#039;PingFang SC&#039;, &#039;Hiragino Sans GB&#039;, &#039;Microsoft YaHei&#039;, &#039;WenQuanYi Micro Hei&#039;, sans-serif;font-size:medium;line-height:27.2px;margin-top:20px;margin-bottom:20px;&quot;&gt;\r\n	大面积色块适合用铜版纸、铜版纸覆膜印刷。铜版纸系列纸张较厚，挺度较高，印刷颜色较为鲜艳。选择纸张侧重于纸张厚度的朋友，不妨选择铜版纸系列，性价比很高。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;box-sizing:inherit;color:#333333;font-family:-apple-system, &#039;Helvetica Neue&#039;, Arial, &#039;PingFang SC&#039;, &#039;Hiragino Sans GB&#039;, &#039;Microsoft YaHei&#039;, &#039;WenQuanYi Micro Hei&#039;, sans-serif;font-size:medium;line-height:27.2px;margin-top:20px;margin-bottom:20px;&quot;&gt;\r\n	2、简洁名片设计方案尤其适合特种纸印刷名片。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;box-sizing:inherit;color:#333333;font-family:-apple-system, &#039;Helvetica Neue&#039;, Arial, &#039;PingFang SC&#039;, &#039;Hiragino Sans GB&#039;, &#039;Microsoft YaHei&#039;, &#039;WenQuanYi Micro Hei&#039;, sans-serif;font-size:medium;line-height:27.2px;margin-top:20px;margin-bottom:20px;&quot;&gt;\r\n	简洁设计方案适合各种纸张印刷，尤其采用特种纸印刷，让特种纸自身特点充分发挥，更能体现出特别效果来。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://pic2.zhimg.com/v2-08065dd74695ed71139379b99d0fd6a9_b.png&quot; data-rawwidth=&quot;269&quot; data-rawheight=&quot;271&quot; class=&quot;content_image&quot; style=&quot;box-sizing:inherit;overflow:hidden;max-width:100%;display:block;margin:1.5em auto;color:#333333;font-family:-apple-system, &#039;Helvetica Neue&#039;, Arial, &#039;PingFang SC&#039;, &#039;Hiragino Sans GB&#039;, &#039;Microsoft YaHei&#039;, &#039;WenQuanYi Micro Hei&#039;, sans-serif;font-size:medium;line-height:27.2px;&quot; alt=&quot; &quot; width=&quot;269&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;box-sizing:inherit;color:#333333;font-family:-apple-system, &#039;Helvetica Neue&#039;, Arial, &#039;PingFang SC&#039;, &#039;Hiragino Sans GB&#039;, &#039;Microsoft YaHei&#039;, &#039;WenQuanYi Micro Hei&#039;, sans-serif;font-size:medium;line-height:27.2px;margin-top:20px;margin-bottom:20px;&quot;&gt;\r\n	3、特种纸纸张各有风格。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;box-sizing:inherit;color:#333333;font-family:-apple-system, &#039;Helvetica Neue&#039;, Arial, &#039;PingFang SC&#039;, &#039;Hiragino Sans GB&#039;, &#039;Microsoft YaHei&#039;, &#039;WenQuanYi Micro Hei&#039;, sans-serif;font-size:medium;line-height:27.2px;margin-top:20px;margin-bottom:20px;&quot;&gt;\r\n	布纹纸自身有精美纹路，而印刷效果大方，布纹纸是不少想体现庄重、大方效果的企业选择的纸张。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;box-sizing:inherit;color:#333333;font-family:-apple-system, &#039;Helvetica Neue&#039;, Arial, &#039;PingFang SC&#039;, &#039;Hiragino Sans GB&#039;, &#039;Microsoft YaHei&#039;, &#039;WenQuanYi Micro Hei&#039;, sans-serif;font-size:medium;line-height:27.2px;margin-top:20px;margin-bottom:20px;&quot;&gt;\r\n	4、PVC材质 PVC材质包括PVC非透明与PVC透明两种材质，非透明适合做华丽效果，透明体现时尚感觉，如果您想体现时尚品质感觉不妨采用PVC透明材质纸张。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://pic3.zhimg.com/v2-b8cb05147d3131886c6749f694e1dffa_b.png&quot; data-rawwidth=&quot;262&quot; data-rawheight=&quot;275&quot; class=&quot;content_image&quot; style=&quot;box-sizing:inherit;overflow:hidden;max-width:100%;display:block;margin:1.5em auto;color:#333333;font-family:-apple-system, &#039;Helvetica Neue&#039;, Arial, &#039;PingFang SC&#039;, &#039;Hiragino Sans GB&#039;, &#039;Microsoft YaHei&#039;, &#039;WenQuanYi Micro Hei&#039;, sans-serif;font-size:medium;line-height:27.2px;&quot; alt=&quot; &quot; width=&quot;262&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;box-sizing:inherit;color:#333333;font-family:-apple-system, &#039;Helvetica Neue&#039;, Arial, &#039;PingFang SC&#039;, &#039;Hiragino Sans GB&#039;, &#039;Microsoft YaHei&#039;, &#039;WenQuanYi Micro Hei&#039;, sans-serif;font-size:medium;line-height:27.2px;margin-top:20px;margin-bottom:20px;&quot;&gt;\r\n	君意广告策划可以为您提供的纸张有：白滨沙、白创意、白滑影、白唯美、白针孔、纯水纹、荷兰白、黑卡、红宝石、红金、黄创意、黄针孔、莱妮纹、蓝金、绿金、麻布纹、美兰丽琦、水晶工艺、烫银、细布纹、香槟金、象牙卡、银星彩丝、珠滑影等名片纸张。\r\n&lt;/p&gt;'),
(9, '&lt;p style=&quot;text-indent:28px;padding:0 0 0 0;line-height:19px;margin:0;&quot;&gt;\r\n	&lt;a href=&quot;http://www.mnxgg.com/&quot; style=&quot;font-family:微软雅黑;color:#333333;letter-spacing:0px;font-size:13px;text-decoration:none;&quot;&gt;&lt;span style=&quot;font-family:微软雅黑;color:#333333;letter-spacing:0px;font-size:14px;&quot;&gt;广告招牌底板&lt;/span&gt;&lt;/a&gt;&lt;span style=&quot;color:#393939;letter-spacing:0px;font-family:微软雅黑;text-decoration:none;font-size:14px;&quot;&gt;是一种表达企业、店铺经营特色的广告牌匾，实际上也是商家的品牌标识。&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-indent:28px;padding:0 0 0 0;line-height:19px;margin:0;&quot;&gt;\r\n	&lt;span style=&quot;font-family:微软雅黑;color:#393939;letter-spacing:0;font-size:10px;&quot;&gt; &lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-family:微软雅黑;color:#393939;letter-spacing:0;font-size:13px;&quot;&gt;&lt;span style=&quot;font-family:微软雅黑;text-decoration:none;font-size:14px;&quot;&gt;广告招牌底板种类繁多，根据材质不同大致分为彩钢扣板、三维扣板、烤漆玻璃、铝塑板、生态木、防腐木、&lt;/span&gt;&lt;span style=&quot;font-family:微软雅黑;color:#393939;letter-spacing:0px;text-decoration:none;font-size:14px;&quot;&gt;PVC雕花、铁皮雕花等。广告招牌底板种类繁多，需要什么样式的广告招牌，要根据自己店铺特色及店铺周边环境来决定。这些，君意广告&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#393939;letter-spacing:0px;font-family:微软雅黑;text-decoration:none;font-size:14px;&quot;&gt;都可以为您出谋划策。让您的门头招牌更出色&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;color:#393939;letter-spacing:0px;font-family:微软雅黑;text-decoration:none;font-size:14px;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;\r\n	&lt;p style=&quot;line-height:19px;text-indent:28px;&quot;&gt;\r\n		&lt;strong&gt;&lt;span style=&quot;color:#393939;letter-spacing:0px;font-family:微软雅黑;text-decoration:none;font-size:14px;&quot;&gt;（一&lt;/span&gt;&lt;span style=&quot;font-family:微软雅黑;color:#393939;letter-spacing:0px;text-decoration:none;font-size:14px;&quot;&gt;）喷绘门头&lt;/span&gt;&lt;span style=&quot;font-family:微软雅黑;color:#393939;letter-spacing:0px;font-size:13px;&quot;&gt;&lt;/span&gt;&lt;/strong&gt;\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;line-height:19px;text-indent:28px;&quot;&gt;\r\n		&lt;span style=&quot;color:#393939;font-family:微软雅黑;&quot;&gt;&lt;span style=&quot;text-decoration:none;font-size:14px;&quot;&gt; 喷绘材质的门头存在的时间算是很长的了，随着经济的发展，人们的审美，喷绘已经沦落为临时性的广告牌了，价格便宜、制作效率高是它一直存在的理由。&lt;/span&gt;&lt;/span&gt;\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;line-height:19px;text-indent:28px;&quot;&gt;\r\n		&lt;span style=&quot;color:#393939;font-family:微软雅黑;&quot;&gt;&lt;span style=&quot;font-size:13px;&quot;&gt;&lt;br /&gt;\r\n&lt;/span&gt;&lt;/span&gt;\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;text-indent:28px;padding:0 0 0 0;line-height:19px;margin:0;&quot;&gt;\r\n		&lt;span style=&quot;font-family:微软雅黑;color:#393939;letter-spacing:0;font-size:10px;&quot;&gt; &lt;/span&gt;\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;text-indent:28px;padding:0 0 0 0;line-height:19px;margin:0;&quot;&gt;\r\n		&lt;strong&gt;&lt;span style=&quot;color:#393939;letter-spacing:0px;font-family:微软雅黑;text-decoration:none;font-size:14px;&quot;&gt;（二&lt;/span&gt;&lt;span style=&quot;font-family:微软雅黑;color:#393939;letter-spacing:0px;text-decoration:none;font-size:14px;&quot;&gt;）三维扣板&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-family:微软雅黑;color:#393939;letter-spacing:0;font-size:13px;&quot;&gt;&lt;/span&gt;\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;text-indent:28px;padding:0 0 0 0;line-height:19px;margin:0;&quot;&gt;\r\n		&lt;span style=&quot;font-family:微软雅黑;color:#393939;letter-spacing:0;font-size:13px;&quot;&gt;&lt;span style=&quot;font-family:微软雅黑;text-decoration:none;font-size:14px;&quot;&gt;三维扣板是一种新型户外招牌立体装饰板。造型时尚简约，具有真实立体效果，且单块自由组合且可随性上色，展现灵活的装饰艺术效果。三维扣板防火阻燃，可水洗，可本色使用，也可&lt;/span&gt;&lt;span style=&quot;font-family:微软雅黑;color:#393939;letter-spacing:0px;text-decoration:none;font-size:14px;&quot;&gt;DIY上色，容易切割，安装方便，不同的单块组合呈现三维立体效果。&lt;/span&gt;&lt;/span&gt;\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;text-indent:28px;padding:0 0 0 0;line-height:19px;margin:0;&quot;&gt;\r\n		&lt;span style=&quot;font-family:微软雅黑;color:#393939;letter-spacing:0;font-size:13px;&quot;&gt;&lt;br /&gt;\r\n&lt;/span&gt;\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;text-indent:28px;padding:0 0 0 0;line-height:19px;margin:0;&quot;&gt;\r\n		&lt;span style=&quot;font-family:微软雅黑;color:#393939;letter-spacing:0;font-size:10px;&quot;&gt; &lt;/span&gt;\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;text-indent:28px;padding:0 0 0 0;line-height:19px;margin:0;&quot;&gt;\r\n		&lt;span style=&quot;font-family:微软雅黑;color:#393939;letter-spacing:0;font-size:10px;&quot;&gt;&lt;/span&gt;\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;line-height:19px;text-indent:28px;&quot;&gt;\r\n		&lt;strong&gt;&lt;span style=&quot;font-family:微软雅黑;color:#393939;letter-spacing:0px;text-decoration:none;font-size:14px;&quot;&gt;（三）彩钢扣板&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-family:微软雅黑;color:#393939;letter-spacing:0px;font-size:13px;&quot;&gt;&lt;/span&gt;\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;line-height:19px;text-indent:28px;&quot;&gt;\r\n		&lt;span style=&quot;font-family:微软雅黑;color:#393939;letter-spacing:0px;text-decoration:none;font-size:14px;&quot;&gt;彩钢扣板的特点：色彩丰富，鲜亮不褪色，牢固性强，适合各类字模；制作安装便捷，版面效果简洁，大方，醒目，新颖出奇。彩钢扣板分直角与圆角，长度可根据客户需求订做。该产品可垂直，水平及多角度造型安装，由成型后的镀锌彩涂板和相对应龙骨扣接组成.采用不同的龙骨可以装配出扣板间隙从0—60mm的效果。因其性价比高，在市场上已形成流行趋势。&lt;/span&gt;\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;text-indent:28px;padding:0 0 0 0;line-height:19px;margin:0;&quot;&gt;\r\n		&lt;br /&gt;\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;text-indent:28px;padding:0 0 0 0;line-height:19px;margin:0;&quot;&gt;\r\n		&lt;strong&gt;&lt;span style=&quot;font-family:微软雅黑;color:#393939;letter-spacing:0;font-size:13px;&quot;&gt;&lt;span style=&quot;font-family:微软雅黑;text-decoration:none;font-size:14px;&quot;&gt;（四&lt;/span&gt;&lt;span style=&quot;font-family:微软雅黑;color:#393939;letter-spacing:0px;text-decoration:none;font-size:14px;&quot;&gt;）烤漆玻璃&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-family:微软雅黑;color:#393939;letter-spacing:0;font-size:13px;&quot;&gt;&lt;/span&gt;\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;text-indent:28px;padding:0 0 0 0;line-height:19px;margin:0;&quot;&gt;\r\n		&lt;span style=&quot;color:#393939;letter-spacing:0px;font-family:微软雅黑;text-decoration:none;font-size:14px;&quot;&gt;烤漆玻璃耐水性，附着力极强，色彩的选择性强，耐污性强，易清洗。可适用于玻璃台面、玻璃形象墙、玻璃背景墙、玻璃围栏、店面内部和外部空间设计等。目前市场应用较广泛。&lt;/span&gt;\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;text-indent:28px;padding:0 0 0 0;line-height:19px;margin:0;&quot;&gt;\r\n		&lt;span style=&quot;font-family:微软雅黑;color:#393939;letter-spacing:0;font-size:13px;&quot;&gt;&lt;br /&gt;\r\n&lt;/span&gt;\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;text-indent:28px;padding:0 0 0 0;line-height:19px;margin:0;&quot;&gt;\r\n		&lt;span style=&quot;font-family:微软雅黑;color:#393939;letter-spacing:0;font-size:10px;&quot;&gt; &lt;/span&gt;\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;text-indent:28px;padding:0 0 0 0;line-height:19px;margin:0;&quot;&gt;\r\n		&lt;strong&gt;&lt;span style=&quot;font-family:微软雅黑;color:#393939;letter-spacing:0;font-size:13px;&quot;&gt;&lt;span style=&quot;font-family:微软雅黑;text-decoration:none;font-size:14px;&quot;&gt;（五&lt;/span&gt;&lt;span style=&quot;font-family:微软雅黑;color:#393939;letter-spacing:0px;text-decoration:none;font-size:14px;&quot;&gt;）铝塑板&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-family:微软雅黑;color:#393939;letter-spacing:0;font-size:13px;&quot;&gt;&lt;/span&gt;\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;text-indent:28px;padding:0 0 0 0;line-height:19px;margin:0;&quot;&gt;\r\n		&lt;span style=&quot;color:#393939;letter-spacing:0px;font-family:微软雅黑;text-decoration:none;font-size:14px;&quot;&gt;铝塑板颜色种类多样，让您选择空间更大，优越的施工性可配合设计人员做出各种造型变化，尽显个性化要求。铝塑板耐候性强，强度高，易保养且具有绝佳的防火性能。&lt;/span&gt;\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;text-indent:28px;padding:0 0 0 0;line-height:19px;margin:0;&quot;&gt;\r\n		&lt;span style=&quot;font-family:微软雅黑;color:#393939;letter-spacing:0;font-size:13px;&quot;&gt;&lt;br /&gt;\r\n&lt;/span&gt;\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;text-indent:28px;padding:0 0 0 0;line-height:19px;margin:0;&quot;&gt;\r\n		&lt;span style=&quot;font-family:微软雅黑;color:#393939;letter-spacing:0;font-size:10px;&quot;&gt; &lt;/span&gt;\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;text-indent:28px;padding:0 0 0 0;line-height:19px;margin:0;&quot;&gt;\r\n		&lt;a href=&quot;http://www.mnxgg.com/&quot; style=&quot;font-family:微软雅黑;color:#333333;letter-spacing:0px;font-size:13px;text-decoration:none;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family:微软雅黑;color:#333333;letter-spacing:0;font-size:13px;&quot;&gt;&lt;span style=&quot;font-family:微软雅黑;font-size:14px;&quot;&gt;（六&lt;/span&gt;&lt;span style=&quot;text-decoration:none;font-family:微软雅黑;color:#333333;letter-spacing:0px;font-size:14px;&quot;&gt;）生态木&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/a&gt;\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;text-indent:28px;padding:0 0 0 0;line-height:19px;margin:0;&quot;&gt;\r\n		&lt;span style=&quot;color:#393939;letter-spacing:0px;font-family:微软雅黑;text-decoration:none;font-size:14px;&quot;&gt;生态木可广泛用于各类园林、休闲娱乐场所、商业展示空间和高档雅舍的户内外墙面、顶面造形和地面地板的使用。户外门头广告牌采用生态木作为装饰材料趋向流行。其版面效果大方，醒目，独具一格。&lt;/span&gt;\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;text-indent:28px;padding:0 0 0 0;line-height:19px;margin:0;&quot;&gt;\r\n		&lt;span style=&quot;font-family:微软雅黑;color:#393939;letter-spacing:0;font-size:13px;&quot;&gt;&lt;br /&gt;\r\n&lt;/span&gt;\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;text-indent:28px;padding:0 0 0 0;line-height:19px;margin:0;&quot;&gt;\r\n		&lt;span style=&quot;font-family:微软雅黑;color:#393939;letter-spacing:0;font-size:10px;&quot;&gt; &lt;/span&gt;\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;text-indent:28px;padding:0 0 0 0;line-height:19px;margin:0;&quot;&gt;\r\n		&lt;strong&gt;&lt;span style=&quot;font-family:微软雅黑;color:#393939;letter-spacing:0;font-size:13px;&quot;&gt;&lt;span style=&quot;font-family:微软雅黑;text-decoration:none;font-size:14px;&quot;&gt;（七&lt;/span&gt;&lt;span style=&quot;font-family:微软雅黑;color:#393939;letter-spacing:0px;text-decoration:none;font-size:14px;&quot;&gt;）铁皮雕花&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-family:微软雅黑;color:#393939;letter-spacing:0;font-size:13px;&quot;&gt;&lt;/span&gt;\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;text-indent:28px;padding:0 0 0 0;line-height:19px;margin:0;&quot;&gt;\r\n		&lt;span style=&quot;color:#393939;letter-spacing:0px;font-family:微软雅黑;text-decoration:none;font-size:14px;&quot;&gt;铁皮雕花板表面是经特殊图层处理过的优质彩色浮雕饰面金属板，豪华美观的装饰效果，使整个户外招牌凸显档次与品位。其造型独特、风格迥异、新颖醒目，尽显个性化设计要求，目前正走在时尚前沿备受市场关注。&lt;/span&gt;\r\n	&lt;/p&gt;\r\n&lt;br /&gt;\r\n&lt;/span&gt;\r\n&lt;/p&gt;'),
(10, '期，微信朋友圈、新浪微博、百度贴吧、@亳州在线等媒体上广大网友纷纷为古井贡酒央视春晚特约广告播出点赞，并引发了社会各界广泛关注。\r\n&lt;p style=&quot;text-align:center;&quot;&gt;\r\n	&lt;img src=&quot;http://news.xinhuanet.com/food/2016-02/16/1118055059_14555910693591n.png&quot; alt=&quot; &quot; align=&quot;middle&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&amp;nbsp; \r\n&amp;nbsp;作为中国老八大名酒之一的古井贡酒，源起于公元196年曹操向汉献帝刘协晋献家乡亳州产的九酝春酒。古井贡酒一直坚守“做真人、酿美酒、善其身、济天下”的价值观，以强烈的社会责任感积极弘扬家乡文化及中国美酒精神。2015年古井贡酒先后以中法友好使者的角色，见证了亳州与法国干邑缔结友好城市，并以酒为礼，精彩绽放意大利米兰世博会，受到世界人民的喜爱。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:center;&quot;&gt;\r\n	&lt;img src=&quot;http://news.xinhuanet.com/food/2016-02/16/1118055059_14555910693901n.png&quot; alt=&quot; &quot; align=&quot;middle&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&amp;nbsp; \r\n&amp;nbsp;2016年春节，古井贡酒特约央视春晚及元宵晚会，并在央视播出的精心定制的春晚特约广告片，结尾落版特别标注安徽亳（bó）州字样，除夕夜春晚直播期间就让10.33亿的受众看到这一幕，大力地向海内外华人宣传了千年白酒品牌古井贡酒和亳州这坐千年古城，可谓打响了春节营销的双向炮。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:center;&quot;&gt;\r\n	&lt;img src=&quot;http://news.xinhuanet.com/food/2016-02/16/1118055059_14555910694061n.png&quot; alt=&quot; &quot; align=&quot;middle&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&amp;nbsp; &amp;nbsp;更值得一提的是，在古井贡酒特约春晚的同时，又同步推出了读亳（bó）有奖的全国大型互动活动，在整个春节期间引起广泛的线上和线下互动宣传，反响空前、获得了较好的传播效果，截止目前线上有奖互动参加人数已近10万。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:center;&quot;&gt;\r\n	&lt;img src=&quot;http://news.xinhuanet.com/food/2016-02/16/1118055059_14555910694211n.png&quot; alt=&quot; &quot; align=&quot;middle&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&amp;nbsp; \r\n&amp;nbsp;提到“亳”这个字，这是一个极为生僻的字，亳字乍看起来很像毫毛的“毫”字，这两个字虽然只差一笔，但其含义却差之千里，翻开现代汉语词典，其中对于亳字的解释很短：亳州，地名，在安徽。这就说明亳字自古以来只有一个用途，那就特指安徽的地名亳州。一个亳字，千古一用，其寓意宏伟，博奥精深，千古一用，是华夏文明在历史长河发展中的重要标志之一。此次古井贡酒推出读亳（bó）有奖的活动，与地方地名捆绑宣传，可谓是珠联璧合，交相辉映。为家乡代言，体现出了企业的家乡情怀，爱产品爱家乡，是一种责任和担当，饮酒思源，不忘家乡。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:center;&quot;&gt;\r\n	&lt;img src=&quot;http://news.xinhuanet.com/food/2016-02/16/1118055059_14555910694371n.png&quot; alt=&quot; &quot; align=&quot;middle&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&amp;nbsp; \r\n&amp;nbsp;于小处入手，于细微处见大，是营销策划中的高招。而将本土特色、地域文化融入产品宣传，使之成为提高附加值的元素，从而既彰显了产品的地理标志属性，更固化了产品的可识别性和唯一性。一个“亳”字勾起了许多人了解这座曹操和华佗的故乡的兴趣，知道了曹操与千年老酒的渊源，增加了古井贡酒的美誉度。需要指出的是此次古井贡酒的别字广告营销手段充满了正能量，起到了宣传亳州古城和古井贡酒双重作用。可以说，此次古井贡酒读“亳”有奖广告营销，给中国广告业呈现了一次成功的营销典范！\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	来源： &lt;em&gt;新华网&lt;/em&gt;\r\n&lt;/p&gt;'),
(11, '亳州最大的广告公司有几家，不过君意广告公司在本行业还是相当不错的，与本地政府、学校、医院、汽车4S店等规模较大的公司都有密切合');

-- --------------------------------------------------------

--
-- 表的结构 `dux_ext_category`
--

CREATE TABLE IF NOT EXISTS `dux_ext_category` (
  `data_id` int(10) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`data_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `dux_ext_category`
--

INSERT INTO `dux_ext_category` (`data_id`, `category_name`) VALUES
(1, '品牌推广'),
(2, '广告代理'),
(3, '广告发布'),
(4, '广告设计'),
(5, '门头招牌'),
(6, '楼顶发光字'),
(7, 'LED显示屏'),
(8, '亮化工程'),
(9, '墙体广告 '),
(10, '会场布置'),
(11, '展厅设计'),
(12, ' 亚克力制品'),
(13, '雕刻标识'),
(14, '展架展板'),
(15, ' 喷绘写真'),
(16, '超薄灯箱');

-- --------------------------------------------------------

--
-- 表的结构 `dux_ext_guestbook`
--

CREATE TABLE IF NOT EXISTS `dux_ext_guestbook` (
  `data_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `content` text,
  `time` int(10) DEFAULT NULL,
  `tel` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`data_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `dux_ext_guestbook`
--

INSERT INTO `dux_ext_guestbook` (`data_id`, `name`, `email`, `content`, `time`, `tel`) VALUES
(1, 'Life', '349865361@qq.com', '欢迎使用DuxCms内容管理系统！', 1418960975, '123456'),
(2, '张威', '826250862@qq.com', '哈哈', 1499867720, '13645602655');

-- --------------------------------------------------------

--
-- 表的结构 `dux_ext_indexfive`
--

CREATE TABLE IF NOT EXISTS `dux_ext_indexfive` (
  `data_id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `se_title` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`data_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `dux_ext_indexfive`
--

INSERT INTO `dux_ext_indexfive` (`data_id`, `title`, `image`, `se_title`) VALUES
(1, '品牌策划推广', '/adcms/upload/2017-07-12/ec5a2462680ab3088d460f1af95b3300.png', '专业的设计策划团队'),
(2, '展览展示/会议', '/adcms/upload/2017-07-12/b669ece9a2baefe34f47230e3b677930.jpg', '设计、策划、搭建'),
(3, '大型广告牌施工', '/adcms/upload/2017-07-12/57c9272466fa18d3191ca5ddac55414b.png', '极其丰富的施工安装经验'),
(4, '字艺标牌制作', '/adcms/upload/2017-07-12/d779eb36dcfba050be8742e413cc144e.jpg', '楼顶发光字、亮化、文化墙'),
(5, '喷绘写真加工', '/adcms/upload/2017-07-12/745d502c587842fa44bb6be3b4553fe9.jpg', '拥有多台高速喷绘机、写真机');

-- --------------------------------------------------------

--
-- 表的结构 `dux_ext_indexpic`
--

CREATE TABLE IF NOT EXISTS `dux_ext_indexpic` (
  `data_id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`data_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `dux_ext_indexpic`
--

INSERT INTO `dux_ext_indexpic` (`data_id`, `title`, `image`) VALUES
(1, '广告', '/adcms/upload/2017-07-13/c1f286369904f674aba24cafa8ffdb4c.jpg'),
(2, '艺术', '/adcms/upload/2017-07-13/cc94d822e00f5f9d08f3a9a040e94e36.png'),
(3, '哈哈', '/adcms/upload/2017-07-13/57c9272466fa18d3191ca5ddac55414b.png'),
(4, 'what', '/adcms/upload/2017-07-13/d779eb36dcfba050be8742e413cc144e.jpg'),
(5, '测试', '/adcms/upload/2017-07-13/745d502c587842fa44bb6be3b4553fe9.jpg'),
(6, '啊啊', '/adcms/upload/2017-07-13/ec5a2462680ab3088d460f1af95b3300.png'),
(7, '汽车', '/adcms/upload/2017-07-13/c1f286369904f674aba24cafa8ffdb4c.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `dux_field`
--

CREATE TABLE IF NOT EXISTS `dux_field` (
  `field_id` int(10) NOT NULL AUTO_INCREMENT,
  `fieldset_id` int(10) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `field` varchar(250) DEFAULT NULL,
  `type` int(5) DEFAULT '1',
  `tip` varchar(250) DEFAULT NULL,
  `verify_type` varchar(250) DEFAULT NULL,
  `verify_data` text,
  `verify_data_js` text,
  `verify_condition` tinyint(1) DEFAULT NULL,
  `default` varchar(250) DEFAULT NULL,
  `sequence` int(10) DEFAULT '0',
  `errormsg` varchar(250) DEFAULT NULL,
  `config` text,
  PRIMARY KEY (`field_id`),
  KEY `field` (`field`),
  KEY `sequence` (`sequence`),
  KEY `fieldset_id` (`fieldset_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='扩展字段基础' AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `dux_field`
--

INSERT INTO `dux_field` (`field_id`, `fieldset_id`, `name`, `field`, `type`, `tip`, `verify_type`, `verify_data`, `verify_data_js`, `verify_condition`, `default`, `sequence`, `errormsg`, `config`) VALUES
(1, 1, '姓名', 'name', 1, '', 'regex', 'cmVxdWlyZQ==', 'Kg==', 1, '', 0, '姓名不能为空', ''),
(2, 1, '邮箱', 'email', 1, '请填写您的邮箱', 'regex', 'ZW1haWw=', 'ZQ==', 1, '', 1, '邮箱格式错误', ''),
(3, 1, '内容', 'content', 2, '请填写内容', 'regex', 'cmVxdWlyZQ==', 'Kg==', 1, '', 3, '请填写内容', ''),
(4, 1, '时间', 'time', 10, '', 'regex', '', '', 1, '', 2, '', ''),
(5, 2, '类别名称', 'category_name', 1, '请填写服务类别名称', 'regex', 'cmVxdWlyZQ==', '', 1, '', 0, '请填写服务类别名称', ''),
(6, 3, '标题', 'title', 1, '', 'regex', 'cmVxdWlyZQ==', '', 1, '', 0, '标题不能为空', ''),
(7, 3, '图片', 'image', 5, '请选择所要上传的图片', 'regex', 'cmVxdWlyZQ==', '', 1, '', 2, '', ''),
(8, 3, '副标题', 'se_title', 1, '请输入副标题', 'regex', 'cmVxdWlyZQ==', '', 1, '', 1, '请输入副标题！', ''),
(9, 1, '电话', 'tel', 1, '请输入您的联系电话', 'regex', 'cmVxdWlyZQ==', 'bQ==', 1, '', 0, '电话不能为空', ''),
(10, 4, '标题', 'title', 1, '请输入标题', 'regex', 'cmVxdWlyZQ==', '', 1, '', 0, '', ''),
(11, 4, '图片', 'image', 5, '请选择图片', 'regex', 'cmVxdWlyZQ==', '', 1, '', 1, '', '');

-- --------------------------------------------------------

--
-- 表的结构 `dux_fieldset`
--

CREATE TABLE IF NOT EXISTS `dux_fieldset` (
  `fieldset_id` int(10) NOT NULL AUTO_INCREMENT,
  `table` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`fieldset_id`),
  UNIQUE KEY `table` (`table`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='字段集基础' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `dux_fieldset`
--

INSERT INTO `dux_fieldset` (`fieldset_id`, `table`, `name`) VALUES
(1, 'guestbook', '留言板'),
(2, 'category', '服务类别'),
(3, 'indexfive', '首页五图'),
(4, 'indexpic', '首页循环图');

-- --------------------------------------------------------

--
-- 表的结构 `dux_fieldset_expand`
--

CREATE TABLE IF NOT EXISTS `dux_fieldset_expand` (
  `fieldset_id` int(10) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  UNIQUE KEY `fieldset_id` (`fieldset_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字段集-扩展模型';

-- --------------------------------------------------------

--
-- 表的结构 `dux_fieldset_form`
--

CREATE TABLE IF NOT EXISTS `dux_fieldset_form` (
  `fieldset_id` int(10) DEFAULT NULL,
  `show_list` tinyint(1) DEFAULT NULL,
  `show_info` tinyint(1) DEFAULT NULL,
  `list_page` int(5) DEFAULT NULL,
  `list_where` varchar(250) DEFAULT NULL,
  `list_order` varchar(250) DEFAULT NULL,
  `tpl_list` varchar(250) DEFAULT NULL,
  `tpl_info` varchar(250) DEFAULT NULL,
  `post_status` tinyint(1) DEFAULT NULL,
  `post_msg` varchar(250) DEFAULT NULL,
  `post_return_url` varchar(250) DEFAULT NULL,
  UNIQUE KEY `fieldset_id` (`fieldset_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字段集-扩展表单';

--
-- 转存表中的数据 `dux_fieldset_form`
--

INSERT INTO `dux_fieldset_form` (`fieldset_id`, `show_list`, `show_info`, `list_page`, `list_where`, `list_order`, `tpl_list`, `tpl_info`, `post_status`, `post_msg`, `post_return_url`) VALUES
(1, 1, 0, 10, '', 'data_id desc', 'guestbook', 'guestbook', 1, '留言发布成功！', ''),
(2, 1, 1, 10, '', 'data_id desc', 'form_list', 'form_content', 1, '服务类别添加成功！', ''),
(3, 1, 1, 5, '', 'data_id desc', 'form_list', 'form_content', 0, '信息提交成功！', ''),
(4, 1, 1, 20, '', 'data_id desc', 'form_list', 'form_content', 0, '表单提交成功！', '');

-- --------------------------------------------------------

--
-- 表的结构 `dux_field_expand`
--

CREATE TABLE IF NOT EXISTS `dux_field_expand` (
  `field_id` int(10) DEFAULT NULL,
  `post` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='扩展字段-扩展模型';

-- --------------------------------------------------------

--
-- 表的结构 `dux_field_form`
--

CREATE TABLE IF NOT EXISTS `dux_field_form` (
  `field_id` int(10) DEFAULT NULL,
  `post` tinyint(1) DEFAULT '0',
  `show` tinyint(1) DEFAULT '0',
  `search` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='扩展字段-表单';

--
-- 转存表中的数据 `dux_field_form`
--

INSERT INTO `dux_field_form` (`field_id`, `post`, `show`, `search`) VALUES
(1, 1, 1, 1),
(2, 1, 1, 1),
(3, 1, 1, 1),
(4, 0, 1, 1),
(5, 0, 1, 0),
(6, 0, 1, 0),
(7, 0, 1, 0),
(8, 1, 1, 1),
(9, 1, 1, 0),
(10, 0, 1, 0),
(11, 0, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `dux_file`
--

CREATE TABLE IF NOT EXISTS `dux_file` (
  `file_id` int(10) NOT NULL AUTO_INCREMENT,
  `url` varchar(250) DEFAULT NULL,
  `original` varchar(250) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `ext` varchar(250) DEFAULT NULL,
  `size` int(10) DEFAULT NULL,
  `time` int(10) DEFAULT NULL,
  PRIMARY KEY (`file_id`),
  KEY `ext` (`ext`),
  KEY `time` (`time`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='上传文件' AUTO_INCREMENT=36 ;

--
-- 转存表中的数据 `dux_file`
--

INSERT INTO `dux_file` (`file_id`, `url`, `original`, `title`, `ext`, `size`, `time`) VALUES
(1, '/adcms/upload/2017-07-12/d09e4b0dd4d0838caa71c600c739cee1.png', '/adcms/upload/2017-07-12/d09e4b0dd4d0838caa71c600c739cee1.png', 'aboutus', 'png', 120694, 1499789627),
(2, '/adcms/upload/2017-07-12/467790e34633b3282fd7ce55928e6369.jpg', '/adcms/upload/2017-07-12/467790e34633b3282fd7ce55928e6369.jpg', 'case', 'jpg', 3531, 1499833326),
(3, '/adcms/upload/2017-07-12/467790e34633b3282fd7ce55928e6369.jpg', '/adcms/upload/2017-07-12/467790e34633b3282fd7ce55928e6369.jpg', 'case', 'jpg', 3531, 1499833419),
(4, '/adcms/upload/2017-07-12/c3199756d91610e9aac8fad27d266c17.jpg', '/adcms/upload/2017-07-12/c3199756d91610e9aac8fad27d266c17.jpg', 'case3', 'jpg', 36460, 1499833430),
(5, '/adcms/upload/2017-07-12/b8265b9239f6d0a04fd115b0bcf56d23.jpg', '/adcms/upload/2017-07-12/b8265b9239f6d0a04fd115b0bcf56d23.jpg', 'case1', 'jpg', 24972, 1499833447),
(6, '/adcms/upload/2017-07-12/ec5a2462680ab3088d460f1af95b3300.png', '/adcms/upload/2017-07-12/ec5a2462680ab3088d460f1af95b3300.png', 'ABUIABAEGAAgtcbfxAUom42h6gYwsQE4lgE', 'png', 14921, 1499849277),
(7, '/adcms/upload/2017-07-12/b669ece9a2baefe34f47230e3b677930.jpg', '/adcms/upload/2017-07-12/b669ece9a2baefe34f47230e3b677930.jpg', 'ABUIABACGAAgn635xQUo6raxgQQwsQE4lgE', 'jpg', 46057, 1499849319),
(8, '/adcms/upload/2017-07-12/57c9272466fa18d3191ca5ddac55414b.png', '/adcms/upload/2017-07-12/57c9272466fa18d3191ca5ddac55414b.png', 'ABUIABAEGAAgzc3fxAUo6P-JwQUwoAE4qAE', 'png', 29945, 1499849401),
(9, '/adcms/upload/2017-07-12/d779eb36dcfba050be8742e413cc144e.jpg', '/adcms/upload/2017-07-12/d779eb36dcfba050be8742e413cc144e.jpg', 'ABUIABACGAAgw7jgxAUo-cne9AQwsQE4lgE', 'jpg', 50366, 1499849439),
(10, '/adcms/upload/2017-07-12/745d502c587842fa44bb6be3b4553fe9.jpg', '/adcms/upload/2017-07-12/745d502c587842fa44bb6be3b4553fe9.jpg', 'ABUIABACGAAgzLngxAUogISzuAcwsQE4lgE', 'jpg', 43060, 1499849458),
(11, '/adcms/upload/2017-07-12/ec5a2462680ab3088d460f1af95b3300.png', '/adcms/upload/2017-07-12/ec5a2462680ab3088d460f1af95b3300.png', 'ABUIABAEGAAgtcbfxAUom42h6gYwsQE4lgE', 'png', 14921, 1499849897),
(12, '/adcms/upload/2017-07-12/b669ece9a2baefe34f47230e3b677930.jpg', '/adcms/upload/2017-07-12/b669ece9a2baefe34f47230e3b677930.jpg', 'ABUIABACGAAgn635xQUo6raxgQQwsQE4lgE', 'jpg', 46057, 1499849918),
(13, '/adcms/upload/2017-07-12/d779eb36dcfba050be8742e413cc144e.jpg', '/adcms/upload/2017-07-12/d779eb36dcfba050be8742e413cc144e.jpg', 'ABUIABACGAAgw7jgxAUo-cne9AQwsQE4lgE', 'jpg', 50366, 1499849946),
(14, '/adcms/upload/2017-07-12/57c9272466fa18d3191ca5ddac55414b.png', '/adcms/upload/2017-07-12/57c9272466fa18d3191ca5ddac55414b.png', 'ABUIABAEGAAgzc3fxAUo6P-JwQUwoAE4qAE', 'png', 29945, 1499849954),
(15, '/adcms/upload/2017-07-12/d779eb36dcfba050be8742e413cc144e.jpg', '/adcms/upload/2017-07-12/d779eb36dcfba050be8742e413cc144e.jpg', 'ABUIABACGAAgw7jgxAUo-cne9AQwsQE4lgE', 'jpg', 50366, 1499849975),
(16, '/adcms/upload/2017-07-12/745d502c587842fa44bb6be3b4553fe9.jpg', '/adcms/upload/2017-07-12/745d502c587842fa44bb6be3b4553fe9.jpg', 'ABUIABACGAAgzLngxAUogISzuAcwsQE4lgE', 'jpg', 43060, 1499849993),
(17, '/adcms/upload/2017-07-12/3a7940742aa3819fae45bb24e3b51505.jpg', '/adcms/upload/2017-07-12/3a7940742aa3819fae45bb24e3b51505.jpg', '1', 'jpg', 5775, 1499851968),
(18, '/adcms/upload/2017-07-12/3a7940742aa3819fae45bb24e3b51505.jpg', '/adcms/upload/2017-07-12/3a7940742aa3819fae45bb24e3b51505.jpg', '1', 'jpg', 5775, 1499852023),
(19, '/adcms/upload/2017-07-12/c2f3121a33899e366d5609812e961d02.jpg', '/adcms/upload/2017-07-12/c2f3121a33899e366d5609812e961d02.jpg', '1', 'jpg', 5546, 1499852087),
(20, '/adcms/upload/2017-07-12/7f30fe1400dda3507216d7a99bfcc013.jpg', '/adcms/upload/2017-07-12/7f30fe1400dda3507216d7a99bfcc013.jpg', '1', 'jpg', 2073, 1499852184),
(21, '/adcms/upload/2017-07-12/7f30fe1400dda3507216d7a99bfcc013.jpg', '/adcms/upload/2017-07-12/7f30fe1400dda3507216d7a99bfcc013.jpg', '1', 'jpg', 2073, 1499852223),
(22, '/adcms/upload/2017-07-12/f3b71f738ed8e1e9a118cab9afedece2.png', '/adcms/upload/2017-07-12/f3b71f738ed8e1e9a118cab9afedece2.png', 'ABUIABAEGAAg_rC_xgUo2OnMrQIwkQI4ugE', 'png', 74007, 1499860314),
(23, '/adcms/upload/2017-07-12/cc94d822e00f5f9d08f3a9a040e94e36.png', '/adcms/upload/2017-07-12/cc94d822e00f5f9d08f3a9a040e94e36.png', '1', 'png', 328814, 1499861540),
(24, '/adcms/upload/2017-07-12/372d2e98428b5352694efca47ef726ef.jpg', '/adcms/upload/2017-07-12/372d2e98428b5352694efca47ef726ef.jpg', '1', 'jpg', 32299, 1499861696),
(25, '/adcms/upload/2017-07-12/2c974b9ae8116c9d60b5783aec704c17.jpg', '/adcms/upload/2017-07-12/2c974b9ae8116c9d60b5783aec704c17.jpg', '1', 'jpg', 37566, 1499861756),
(26, '/adcms/upload/2017-07-12/c1f286369904f674aba24cafa8ffdb4c.jpg', '/adcms/upload/2017-07-12/c1f286369904f674aba24cafa8ffdb4c.jpg', '1', 'jpg', 33698, 1499861804),
(27, '/adcms/upload/2017-07-12/b669ece9a2baefe34f47230e3b677930.jpg', '/adcms/upload/2017-07-12/b669ece9a2baefe34f47230e3b677930.jpg', 'ABUIABACGAAgn635xQUo6raxgQQwsQE4lgE', 'jpg', 46057, 1499861862),
(28, '/adcms/upload/2017-07-12/57c9272466fa18d3191ca5ddac55414b.png', '/adcms/upload/2017-07-12/57c9272466fa18d3191ca5ddac55414b.png', 'ABUIABAEGAAgzc3fxAUo6P-JwQUwoAE4qAE', 'png', 29945, 1499861924),
(29, '/adcms/upload/2017-07-13/c1f286369904f674aba24cafa8ffdb4c.jpg', '/adcms/upload/2017-07-13/c1f286369904f674aba24cafa8ffdb4c.jpg', '1', 'jpg', 33698, 1499922540),
(30, '/adcms/upload/2017-07-13/cc94d822e00f5f9d08f3a9a040e94e36.png', '/adcms/upload/2017-07-13/cc94d822e00f5f9d08f3a9a040e94e36.png', '1', 'png', 328814, 1499922566),
(31, '/adcms/upload/2017-07-13/57c9272466fa18d3191ca5ddac55414b.png', '/adcms/upload/2017-07-13/57c9272466fa18d3191ca5ddac55414b.png', 'ABUIABAEGAAgzc3fxAUo6P-JwQUwoAE4qAE', 'png', 29945, 1499922583),
(32, '/adcms/upload/2017-07-13/d779eb36dcfba050be8742e413cc144e.jpg', '/adcms/upload/2017-07-13/d779eb36dcfba050be8742e413cc144e.jpg', 'ABUIABACGAAgw7jgxAUo-cne9AQwsQE4lgE', 'jpg', 50366, 1499922596),
(33, '/adcms/upload/2017-07-13/745d502c587842fa44bb6be3b4553fe9.jpg', '/adcms/upload/2017-07-13/745d502c587842fa44bb6be3b4553fe9.jpg', 'ABUIABACGAAgzLngxAUogISzuAcwsQE4lgE', 'jpg', 43060, 1499922607),
(34, '/adcms/upload/2017-07-13/ec5a2462680ab3088d460f1af95b3300.png', '/adcms/upload/2017-07-13/ec5a2462680ab3088d460f1af95b3300.png', 'ABUIABAEGAAgtcbfxAUom42h6gYwsQE4lgE', 'png', 14921, 1499922630),
(35, '/adcms/upload/2017-07-13/c1f286369904f674aba24cafa8ffdb4c.jpg', '/adcms/upload/2017-07-13/c1f286369904f674aba24cafa8ffdb4c.jpg', '1', 'jpg', 33698, 1499922639);

-- --------------------------------------------------------

--
-- 表的结构 `dux_fragment`
--

CREATE TABLE IF NOT EXISTS `dux_fragment` (
  `fragment_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `label` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`fragment_id`),
  KEY `label` (`label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='网站碎片' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dux_position`
--

CREATE TABLE IF NOT EXISTS `dux_position` (
  `position_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `sequence` int(10) DEFAULT '0',
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='推荐位' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `dux_position`
--

INSERT INTO `dux_position` (`position_id`, `name`, `sequence`) VALUES
(1, '首页推荐', 0);

-- --------------------------------------------------------

--
-- 表的结构 `dux_tags`
--

CREATE TABLE IF NOT EXISTS `dux_tags` (
  `tag_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `click` int(10) DEFAULT '1',
  `quote` int(10) DEFAULT '1',
  PRIMARY KEY (`tag_id`),
  KEY `quote` (`quote`),
  KEY `click` (`click`),
  KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='TAG标签' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dux_tags_has`
--

CREATE TABLE IF NOT EXISTS `dux_tags_has` (
  `content_id` int(10) DEFAULT NULL,
  `tag_id` int(10) DEFAULT NULL,
  KEY `aid` (`content_id`),
  KEY `tid` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='TAG关系';

-- --------------------------------------------------------

--
-- 表的结构 `dux_total_spider`
--

CREATE TABLE IF NOT EXISTS `dux_total_spider` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `time` int(10) DEFAULT NULL,
  `baidu` int(10) DEFAULT '0',
  `google` int(10) DEFAULT '0',
  `soso` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='蜘蛛统计' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dux_total_visitor`
--

CREATE TABLE IF NOT EXISTS `dux_total_visitor` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `time` int(10) DEFAULT NULL,
  `count` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='访客统计' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `dux_total_visitor`
--

INSERT INTO `dux_total_visitor` (`id`, `time`, `count`) VALUES
(1, 1499702400, 1),
(2, 1499788800, 777),
(3, 1499875200, 270),
(4, 1503158400, 224);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
