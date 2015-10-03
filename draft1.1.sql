drop table public.executive_summary_stg;
create table public.executive_summary_stg(
Country	character varying,
dataYear	character varying,
dataType	character varying,
Items	character varying,
Source	character varying,
month01	character varying,
month02	character varying,
month03	character varying,
month04	character varying,
month05	character varying,
month06	character varying,
month07	character varying,
month08	character varying,
month09	character varying,
month10	character varying,
month11	character varying,
month12	character varying,
src	character varying,
FY	character varying);

--import data from csv after formatting data

drop table executive_summary;
CREATE TABLE executive_summary
(
  country character varying,
  datayear integer,
  datatype character varying,
  items character varying,
  source character varying,
  month01 double precision,
  month02 double precision,
  month03 double precision,
  month04 double precision,
  month05 double precision,
  month06 double precision,
  month07 double precision,
  month08 double precision,
  month09 double precision,
  month10 double precision,
  month11 double precision,
  month12 double precision,
  src character varying,
  fy double precision);


truncate table executive_summary;  
insert into executive_summary(Country,dataYear,dataType,Items,Source,
month01,month02,month03,month04,month05,month06,
month07,month08,month09,month10,month11,month12,src,FY) (
select trim(Country) Country,cast(trim(dataYear) as integer),trim(dataType),trim(Items),'001',
cast(month01 as double precision),cast(month02 as double precision),cast(month03 as double precision),
cast(month04 as double precision),cast(month05 as double precision),cast(month06 as double precision),
cast(month07 as double precision),cast(month08 as double precision),cast(month09 as double precision),
cast(month10 as double precision),cast(month11 as double precision),cast(month12 as double precision),
src,cast(trim(FY) as double precision) from public.executive_summary_stg
where trim(Country) != 'Country'
);

------------------------------------------
---making bonus positive
/*insert into executive_summary(
select a.country,a.datayear,a.datatype,'Bonuses Total TOBU_TEMP' items,null source, 
-1*a.month01 ,-1*a.month02 , -1*a.month03 ,
-1*a.month04 ,-1*a.month05 , -1*a.month06 ,
-1*a.month07 ,-1*a.month08 , -1*a.month09 ,
-1*a.month10 ,-1*a.month11 , -1*a.month12  
from executive_summary a
where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Bonuses Total (PL_150_03_00)') ;

delete from executive_summary a
where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Bonuses Total (PL_150_03_00)' ;

update executive_summary a
set items='Bonuses Total (PL_150_03_00)'
where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Bonuses Total TOBU_TEMP' ;

insert into executive_summary(
select a.country,a.datayear,a.datatype,'Bonus acquisition TOBU_TEMP' items,null source,
-1*a.month01 ,-1*a.month02 , -1*a.month03 ,
-1*a.month04 ,-1*a.month05 , -1*a.month06 ,
-1*a.month07 ,-1*a.month08 , -1*a.month09 ,
-1*a.month10 ,-1*a.month11 , -1*a.month12  
from executive_summary a
where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Bonuses acquisition') ;

delete from executive_summary a
where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Bonuses acquisition' ;

update executive_summary a
set items='Bonuses acquisition'
where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Bonus acquisition TOBU_TEMP' ;

insert into executive_summary(
select a.country,a.datayear,a.datatype,'Bonus ret TOBU_TEMP' items,null source,
-1*a.month01 ,-1*a.month02 , -1*a.month03 ,
-1*a.month04 ,-1*a.month05 , -1*a.month06 ,
-1*a.month07 ,-1*a.month08 , -1*a.month09 ,
-1*a.month10 ,-1*a.month11 , -1*a.month12  
from executive_summary a
where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Bonuses retention') ;

delete from executive_summary a
where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Bonuses retention' ;

update executive_summary a
set items='Bonuses retention'
where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Bonus ret TOBU_TEMP' ;

--------making marketing positive 
insert into executive_summary(
select a.country,a.datayear,a.datatype,'Marketing Total TOBU_TEMP' items,null source, 
-1*a.month01 Jan15 ,-1*a.month02 Feb15, -1*a.month03 Mar15 ,
-1*a.month04 Apr15 ,-1*a.month05 May15, -1*a.month06 Jun15 ,
-1*a.month07 Jul15 ,-1*a.month08 Aug15, -1*a.month09 Sep15 ,
-1*a.month10 Oct15 ,-1*a.month11 Nov15, -1*a.month12 Dec15 
from executive_summary a
where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Marketing (PL_250_04)') ;

delete from executive_summary a
where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Marketing (PL_250_04)' ;

update executive_summary a
set items='Marketing (PL_250_04)'
where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Marketing Total TOBU_TEMP' ;

insert into executive_summary(
select a.country,a.datayear,a.datatype,'Aff Marketing TOBU_TEMP' items,null source,
-1*a.month01 Jan15 ,-1*a.month02 Feb15, -1*a.month03 Mar15 ,
-1*a.month04 Apr15 ,-1*a.month05 May15, -1*a.month06 Jun15 ,
-1*a.month07 Jul15 ,-1*a.month08 Aug15, -1*a.month09 Sep15 ,
-1*a.month10 Oct15 ,-1*a.month11 Nov15, -1*a.month12 Dec15 
from executive_summary a
where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Affiliate marketing') ;

delete from executive_summary a
where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Affiliate marketing' ;

update executive_summary a
set items='Affiliate marketing'
where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Aff Marketing TOBU_TEMP' ;*/


insert into executive_summary(
select a.country,a.datayear,a.datatype,a.items,'002' source, 
-1*a.month01 ,-1*a.month02 , -1*a.month03 ,
-1*a.month04 ,-1*a.month05 , -1*a.month06 ,
-1*a.month07 ,-1*a.month08 , -1*a.month09 ,
-1*a.month10 ,-1*a.month11 , -1*a.month12  
from executive_summary a
where a.items like 'Bonus%' 
or a.items in ('Marketing (PL_250_04)',
'Media advertising (TV, press, internet...)','Advertising agencies','TV drawing','Sponsoring',
'Retail marketing (shops)','Affiliate marketing','Poker','Others')) ;

delete from executive_summary 
where source ='001' and (items like 'Bonus%' 
or items in ('Marketing (PL_250_04)',
'Media advertising (TV, press, internet...)','Advertising agencies','TV drawing','Sponsoring',
'Retail marketing (shops)','Affiliate marketing','Poker','Others'));


-------------------------------------
--data for Active Players
insert into executive_summary (
select db.country,db.datayear, db.datatype,'Active Players' items, '003' source,
db.month01 + ftd.month01 month01, 
db.month02 + ftd.month02 month02, 
db.month03 + ftd.month03 month03, 
db.month04 + ftd.month04 month04, 
db.month05 + ftd.month05 month05, 
db.month06 + ftd.month06 month06, 
db.month07 + ftd.month07 month07, 
db.month08 + ftd.month08 month08, 
db.month09 + ftd.month09 month09, 
db.month10 + ftd.month10 month10, 
db.month11 + ftd.month11 month11, 
db.month12 + ftd.month12 month12, 
null src, null fy from (
select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a 
where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Database' ) db,
(select 4 seq,a.country,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12, a.datayear
from executive_summary a
where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='First Time Depositors') ftd
where db.datatype = ftd.datatype and db.country = ftd.country and db.datayear = ftd.datayear);

----------------------------------------------------------------
-------inserting NGW per UAP
insert into executive_summary (
select ngw.country,ngw.datayear, ngw.datatype,'NGW per UAP' items, '004' source,
ngw.month01 / uap.month01 month01, 
ngw.month02 / uap.month02 month02, 
ngw.month03 / uap.month03 month03, 
ngw.month04 / uap.month04 month04, 
ngw.month05 / uap.month05 month05, 
ngw.month06 / uap.month06 month06, 
ngw.month07 / uap.month07 month07, 
ngw.month08 / uap.month08 month08, 
ngw.month09 / uap.month09 month09, 
ngw.month10 / uap.month10 month10, 
ngw.month11 / uap.month11 month11, 
ngw.month12 / uap.month12 month12, 
null src, null fy from (
select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Active Players') uap,
(select 4 seq,a.country,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12, a.datayear
from executive_summary a where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Net Gross Win') ngw
where uap.datatype = ngw.datatype and uap.country = ngw.country and uap.datayear = ngw.datayear);

---------------------------------------------------------------------------
----stake per apd
insert into executive_summary (
select stk.country,stk.datayear, stk.datatype,'Stake per APD' items, '005' source,
stk.month01 / apd.month01 month01, 
stk.month02 / apd.month02 month02, 
stk.month03 / apd.month03 month03, 
stk.month04 / apd.month04 month04, 
stk.month05 / apd.month05 month05, 
stk.month06 / apd.month06 month06, 
stk.month07 / apd.month07 month07, 
stk.month08 / apd.month08 month08, 
stk.month09 / apd.month09 month09, 
stk.month10 / apd.month10 month10, 
stk.month11 / apd.month11 month11, 
stk.month12 / apd.month12 month12, 
null src, null fy from (
select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Stake amount') Stk,
(select 4 seq,a.country,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12, a.datayear
from executive_summary a where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Active Player Days') apd
where stk.datatype = apd.datatype and stk.country = apd.country and stk.datayear = apd.datayear);

------------------------------------------------------------
------------ngw margin
insert into executive_summary (
select ngw.country,ngw.datayear, ngw.datatype,'NGW Margin' items, '006' source,
ngw.month01 / stk.month01 month01, 
ngw.month02 / stk.month02 month02, 
ngw.month03 / stk.month03 month03, 
ngw.month04 / stk.month04 month04, 
ngw.month05 / stk.month05 month05, 
ngw.month06 / stk.month06 month06, 
ngw.month07 / stk.month07 month07, 
ngw.month08 / stk.month08 month08, 
ngw.month09 / stk.month09 month09, 
ngw.month10 / stk.month10 month10, 
ngw.month11 / stk.month11 month11, 
ngw.month12 / stk.month12 month12, 
null src, null fy from (
select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Net Gross Win') ngw,
(select 4 seq,a.country,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12, a.datayear
from executive_summary a where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Stake amount') stk
where stk.datatype = ngw.datatype and stk.country = ngw.country and stk.datayear = ngw.datayear);

-----------------------------------------------------------------------
----player yeild
insert into executive_summary (
select ngr.country,ngr.datayear, ngr.datatype,'Player Yeild' items, '007' source,
ngr.month01 / uap.month01 month01, 
ngr.month02 / uap.month02 month02, 
ngr.month03 / uap.month03 month03, 
ngr.month04 / uap.month04 month04, 
ngr.month05 / uap.month05 month05, 
ngr.month06 / uap.month06 month06, 
ngr.month07 / uap.month07 month07, 
ngr.month08 / uap.month08 month08, 
ngr.month09 / uap.month09 month09, 
ngr.month10 / uap.month10 month10, 
ngr.month11 / uap.month11 month11, 
ngr.month12 / uap.month12 month12, 
null src, null fy from (
select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Net Gaming Revenue' ) ngr,
(select 4 seq,a.country,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12, a.datayear
from executive_summary a where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Active Players' ) uap
where ngr.datatype = uap.datatype and ngr.country = uap.country and ngr.datayear = uap.datayear);

-------------------------------------------------------------------------------------------
-------------frequency
insert into executive_summary (
select apd.country,apd.datayear, apd.datatype,'Frequency' items, '008' source,
apd.month01 / uap.month01 month01, 
apd.month02 / uap.month02 month02, 
apd.month03 / uap.month03 month03, 
apd.month04 / uap.month04 month04, 
apd.month05 / uap.month05 month05, 
apd.month06 / uap.month06 month06, 
apd.month07 / uap.month07 month07, 
apd.month08 / uap.month08 month08, 
apd.month09 / uap.month09 month09, 
apd.month10 / uap.month10 month10, 
apd.month11 / uap.month11 month11, 
apd.month12 / uap.month12 month12, 
null src, null fy from (
select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Active Player Days' ) apd,
(select 4 seq,a.country,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12, a.datayear
from executive_summary a where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Active Players' ) uap
where apd.datatype = uap.datatype and apd.country = uap.country and apd.datayear = uap.datayear);

------------------------------------------------------------------------
--------------bonus cost per active customer
insert into executive_summary (
select obc.country,obc.datayear, obc.datatype,'Bonus Cost per Active Customer' items, '009' source,
obc.month01 / uap.month01 month01, 
obc.month02 / uap.month02 month02, 
obc.month03 / uap.month03 month03, 
obc.month04 / uap.month04 month04, 
obc.month05 / uap.month05 month05, 
obc.month06 / uap.month06 month06, 
obc.month07 / uap.month07 month07, 
obc.month08 / uap.month08 month08, 
obc.month09 / uap.month09 month09, 
obc.month10 / uap.month10 month10, 
obc.month11 / uap.month11 month11, 
obc.month12 / uap.month12 month12, 
null src, null fy from (
select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Bonuses Total (PL_150_03_00)' ) obc,
(select 4 seq,a.country,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12, a.datayear
from executive_summary a where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Active Players') uap
where obc.datatype = uap.datatype and obc.country = uap.country and obc.datayear = uap.datayear);


-------------------------------------------------------------------------------
------------aquisition as percentage of total bonus
insert into executive_summary (
select obc.country,obc.datayear, obc.datatype,'Aquisition % of Total Bonus' items, '010' source,
bac.month01 / obc.month01 month01, 
bac.month02 / obc.month02 month02, 
bac.month03 / obc.month03 month03, 
bac.month04 / obc.month04 month04, 
bac.month05 / obc.month05 month05, 
bac.month06 / obc.month06 month06, 
bac.month07 / obc.month07 month07, 
bac.month08 / obc.month08 month08, 
bac.month09 / obc.month09 month09, 
bac.month10 / obc.month10 month10, 
bac.month11 / obc.month11 month11, 
bac.month12 / obc.month12 month12, 
null src, null fy from (
select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Bonuses Total (PL_150_03_00)') obc,
(select 4 seq,a.country,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12, a.datayear
from executive_summary a where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Bonuses acquisition') bac
where obc.datatype = bac.datatype and obc.country = bac.country and obc.datayear = bac.datayear);

--------------------------------------------------------------------------
------retention % of total bonus
insert into executive_summary (
select obc.country,obc.datayear, obc.datatype,'Retention % of Total Bonus' items, '011' source,
bac.month01 / obc.month01 month01, 
bac.month02 / obc.month02 month02, 
bac.month03 / obc.month03 month03, 
bac.month04 / obc.month04 month04, 
bac.month05 / obc.month05 month05, 
bac.month06 / obc.month06 month06, 
bac.month07 / obc.month07 month07, 
bac.month08 / obc.month08 month08, 
bac.month09 / obc.month09 month09, 
bac.month10 / obc.month10 month10, 
bac.month11 / obc.month11 month11, 
bac.month12 / obc.month12 month12, 
null src, null fy from (
select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Bonuses Total (PL_150_03_00)') obc,
(select 4 seq,a.country,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12, a.datayear
from executive_summary a where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Bonuses retention') bac
where obc.datatype = bac.datatype and obc.country = bac.country and obc.datayear = bac.datayear);

-----------------------------------------------------------------------
--------------marketing spent non-affiliates
insert into executive_summary (
select obc.country,obc.datayear, obc.datatype,'Marketing Spent Non Affiliates' items, '012' source,
obc.month01 - afm.month01 month01, 
obc.month02 - afm.month02 month02, 
obc.month03 - afm.month03 month03, 
obc.month04 - afm.month04 month04, 
obc.month05 - afm.month05 month05, 
obc.month06 - afm.month06 month06, 
obc.month07 - afm.month07 month07, 
obc.month08 - afm.month08 month08, 
obc.month09 - afm.month09 month09, 
obc.month10 - afm.month10 month10, 
obc.month11 - afm.month11 month11, 
obc.month12 - afm.month12 month12, 
null src, null fy from (
select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - TOTAL BUSINESS'  and a.items ='Marketing (PL_250_04)') obc,
(select 4 seq,a.country,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12, a.datayear
from executive_summary a where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Affiliate marketing') afm
where obc.datatype = afm.datatype and obc.country = afm.country and obc.datayear = afm.datayear);

------------------------------------------------------------------------
---------affiliates cost as % of ngw
insert into executive_summary (
select afm.country,afm.datayear, afm.datatype,'Affiliates Cost as % of NGW' items, '013' source,
afm.month01 / ngw.month01 month01, 
afm.month02 / ngw.month02 month02, 
afm.month03 / ngw.month03 month03, 
afm.month04 / ngw.month04 month04, 
afm.month05 / ngw.month05 month05, 
afm.month06 / ngw.month06 month06, 
afm.month07 / ngw.month07 month07, 
afm.month08 / ngw.month08 month08, 
afm.month09 / ngw.month09 month09, 
afm.month10 / ngw.month10 month10, 
afm.month11 / ngw.month11 month11, 
afm.month12 / ngw.month12 month12, 
null src, null fy from (
select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Net Gross Win') ngw,
(select 4 seq,a.country,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12, a.datayear
from executive_summary a where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Affiliate marketing') afm
where ngw.datatype = afm.datatype and ngw.country = afm.country and ngw.datayear = afm.datayear);

---------------------------------------------------------------------------------
------------bonus cost as % of ngw
insert into executive_summary (
select obc.country,obc.datayear, obc.datatype,'Bonus cost % of NGW' items, '014' source,
case when ngw.month01 = 0 then null else obc.month01 / ngw.month01 end month01, 
case when ngw.month02 = 0 then null else obc.month02 / ngw.month02 end month02, 
case when ngw.month03 = 0 then null else obc.month03 / ngw.month03 end month03, 
case when ngw.month04 = 0 then null else obc.month04 / ngw.month04 end month04, 
case when ngw.month05 = 0 then null else obc.month05 / ngw.month05 end month05, 
case when ngw.month06 = 0 then null else obc.month06 / ngw.month06 end month06, 
case when ngw.month07 = 0 then null else obc.month07 / ngw.month07 end month07, 
case when ngw.month08 = 0 then null else obc.month08 / ngw.month08 end month08, 
case when ngw.month09 = 0 then null else obc.month09 / ngw.month09 end month09, 
case when ngw.month10 = 0 then null else obc.month10 / ngw.month10 end month10, 
case when ngw.month11 = 0 then null else obc.month11 / ngw.month11 end month11, 
case when ngw.month12 = 0 then null else obc.month12 / ngw.month12 end month12, 
null src, null fy from (
select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Bonuses Total (PL_150_03_00)') obc,
(select 4 seq,a.country,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12, a.datayear
from executive_summary a where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Net Gross Win') ngw
where obc.datatype = ngw.datatype and obc.country = ngw.country and obc.datayear = ngw.datayear);

-----------------------------------------------------------------------------------
-------------Average cost per acquisition (CPA)
insert into executive_summary (
select ms.country,ms.datayear, ms.datatype,'Average cost per acquisition (CPA)' items, '015' source,
((ms.month01 + atb.month01*tb.month01)/ftd.month01) month01,
((ms.month02 + atb.month02*tb.month02)/ftd.month02) month02,
((ms.month03 + atb.month03*tb.month03)/ftd.month03) month03,
((ms.month04 + atb.month04*tb.month04)/ftd.month04) month04,
((ms.month05 + atb.month05*tb.month05)/ftd.month05) month05,
((ms.month06 + atb.month06*tb.month06)/ftd.month06) month06,
((ms.month07 + atb.month07*tb.month07)/ftd.month07) month07,
((ms.month08 + atb.month08*tb.month08)/ftd.month08) month08,
((ms.month09 + atb.month09*tb.month09)/ftd.month09) month09,
((ms.month10 + atb.month10*tb.month10)/ftd.month10) month10,
((ms.month11 + atb.month11*tb.month11)/ftd.month11) month11,
((ms.month12 + atb.month12*tb.month12)/ftd.month12) month12,
null src, null fy from (
select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Marketing (PL_250_04)') ms,
(select a.country,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12, a.datayear
from executive_summary a where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Aquisition % of Total Bonus') atb,
(select a.country,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12, a.datayear
from executive_summary a where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Bonuses Total (PL_150_03_00)') tb,
(select a.country,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12, a.datayear
from executive_summary a where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='First Time Depositors') ftd
where 1=1
and ms.datatype = atb.datatype and ms.country = atb.country and ms.datayear = atb.datayear
and ms.datatype = tb.datatype and ms.country = tb.country and ms.datayear = tb.datayear
and ms.datatype = ftd.datatype and ms.country = ftd.country and ms.datayear = ftd.datayear);


-----------------Total Business Player Churn Rate---------------
insert into executive_summary (
select a.country,a.datayear,a.datatype,'Player Churn Rate' items, '016' src,
null month01, 
case b.month01 when 0 then null else 1-(a.month02/b.month01) end  month02,
case b.month02 when 0 then null else 1-(a.month03/b.month02) end  month03,
case b.month03 when 0 then null else 1-(a.month04/b.month03) end  month04,
case b.month04 when 0 then null else 1-(a.month05/b.month04) end  month05,
case b.month05 when 0 then null else 1-(a.month06/b.month05) end  month06,
case b.month06 when 0 then null else 1-(a.month07/b.month06) end  month07,
case b.month07 when 0 then null else 1-(a.month08/b.month07) end  month08,
case b.month08 when 0 then null else 1-(a.month09/b.month08) end  month09,
case b.month09 when 0 then null else 1-(a.month10/b.month09) end  month10,
case b.month10 when 0 then null else 1-(a.month11/b.month10) end  month11,
case b.month11 when 0 then null else 1-(a.month12/b.month11) end  month12,
null src, null fy  
from executive_summary a ,executive_summary b 
where a.datatype = b.datatype and a.items = 'Database' and b.items = 'Active Players' 
and a.country = b.country and a.datayear = b.datayear 
and a.datatype = 'ACTUALS - TOTAL BUSINESS' );

update executive_summary a
set month01 = (
select case b.month12 when 0 then null else 1-(a.month01/b.month12) end 
from executive_summary a ,executive_summary b 
where a.datatype = b.datatype and a.items = 'Database' and b.items = 'Active Players' 
and a.country = b.country 
and a.datayear ='2015' 
and b.datayear ='2014'
and a.datatype = 'ACTUALS - TOTAL BUSINESS')
where datatype = 'ACTUALS - TOTAL BUSINESS' 
and items= 'Player Churn Rate'
and datayear ='2015';
--------------------------------------------------------------------------------

-------------UAP retails/online
insert into executive_summary (
select cr_src_country,yyy,'ACTUALS - '||upper(cr_stor_distr_channel) datatype,'UAP' items,'017' source
,sum(month01),sum(month02),sum(month03),sum(month04),sum(month05),sum(month06)
,sum(month07),sum(month08),sum(month09),sum(month10),sum(month11),sum(month12),null src,null fy 
from (
select cr_src_country,cr_stor_distr_channel,yyy,
case when mon=1  then vals else 0 end month01,
case when mon=2  then vals else 0 end month02,
case when mon=3  then vals else 0 end month03,
case when mon=4  then vals else 0 end month04,
case when mon=5  then vals else 0 end month05,
case when mon=6  then vals else 0 end month06,
case when mon=7  then vals else 0 end month07,
case when mon=8  then vals else 0 end month08,
case when mon=9  then vals else 0 end month09,
case when mon=10 then vals else 0 end month10,
case when mon=11 then vals else 0 end month11,
case when mon=12 then vals else 0 end month12 from (
select cr_src_country,cr_stor_distr_channel,date_part('YEAR',bet_Date) yyy,date_part('MONTH',bet_Date) mon
,sum(Player_cnt) vals 
from channel_wise_uap_count 
where 1=1
and cr_src_country  = 'CZ' 
and cr_src_country = cli_src_country
and cr_stor_distr_channel in ('Retail','Online')
group by cr_src_country,cr_stor_distr_channel,bet_Date,cr_stor_distr_channel
) ab 
) abc
group by cr_src_country,cr_stor_distr_channel,yyy,datatype);
--select * from channel_wise_uap_count;


-------------retail APD
insert into executive_summary (
select cr_src_country,yyy,'ACTUALS - RETAIL' datatype,'APD' items,'018' source
,sum(month01),sum(month02),sum(month03),sum(month04),sum(month05),sum(month06)
,sum(month07),sum(month08),sum(month09),sum(month10),sum(month11),sum(month12),null src,null fy 
from (
select cr_src_country,yyy,
case when mon=1  then vals else 0 end month01,
case when mon=2  then vals else 0 end month02,
case when mon=3  then vals else 0 end month03,
case when mon=4  then vals else 0 end month04,
case when mon=5  then vals else 0 end month05,
case when mon=6  then vals else 0 end month06,
case when mon=7  then vals else 0 end month07,
case when mon=8  then vals else 0 end month08,
case when mon=9  then vals else 0 end month09,
case when mon=10 then vals else 0 end month10,
case when mon=11 then vals else 0 end month11,
case when mon=12 then vals else 0 end month12 from (
select cr_src_country,date_part('YEAR',bet_Date) yyy,date_part('MONTH',bet_Date) mon
,sum(Player_cnt) vals 
from channel_wise_apd_count 
where 1=1
and cr_src_country  = 'CZ' 
and cr_src_country=cli_src_country
and cr_stor_distr_channel='Retail'
group by cr_src_country,bet_Date,cr_stor_distr_channel) ab 
) abc
group by cr_src_country,yyy,datatype);


-------------retail FTD

/*drop table player_value_data_stg;
create table player_value_data_stg (  
cr_src_country character varying(50),
str_dis_channel character varying(50),
  mon_begin_first_deposit date,
  prod_grp_desc character varying(50),
  cli_src_cntry character varying(50),
  mon_beg_bet_resolve_date_nvp date,
  player_cnt integer,
  msc integer
);

insert into player_value_data_stg ( 
select cas_cntry_code,str_dis_channel,mon_begin_first_deposit,
prod_grp_desc,cli_src_cntry,mon_beg_bet_resolve_date_nvp,
player_cnt, 
(mon_beg_bet_resolve_date_nvp-mon_begin_first_deposit) msc
from player_value_Data
where (mon_beg_bet_resolve_date_nvp-mon_begin_first_deposit) > 0 
and (mon_beg_bet_resolve_date_nvp-mon_begin_first_deposit) < 32);

insert into executive_summary (select cr_src_country,yyy,
'ACTUALS - '||upper(str_dis_channel) datatype,'FTD' items,'019' source
,sum(month01),sum(month02),sum(month03),sum(month04),sum(month05),sum(month06)
,sum(month07),sum(month08),sum(month09),sum(month10),sum(month11),sum(month12),null src,null fy 
from (
select cr_src_country,yyy,str_dis_channel,
case when mon=1  then vals else 0 end month01,
case when mon=2  then vals else 0 end month02,
case when mon=3  then vals else 0 end month03,
case when mon=4  then vals else 0 end month04,
case when mon=5  then vals else 0 end month05,
case when mon=6  then vals else 0 end month06,
case when mon=7  then vals else 0 end month07,
case when mon=8  then vals else 0 end month08,
case when mon=9  then vals else 0 end month09,
case when mon=10 then vals else 0 end month10,
case when mon=11 then vals else 0 end month11,
case when mon=12 then vals else 0 end month12 from (
select cr_src_country,date_part('YEAR',mon_begin_first_deposit) yyy,date_part('MONTH',mon_begin_first_deposit) mon,sum(Player_cnt) vals,
str_dis_channel 
from player_value_data_stg where cr_src_country='CZ' and str_dis_channel in('Retail','Online')
group by cr_src_country,date_part('YEAR',mon_begin_first_deposit),date_part('MONTH',mon_begin_first_deposit),str_dis_channel) ab ) abc
group by cr_src_country,yyy,datatype,upper(str_dis_channel));*/

insert into executive_summary (
select cr_src_country,yyy,
'ACTUALS - ONLINE' datatype,'FTD' items,'019' source
,sum(month01),sum(month02),sum(month03),sum(month04),sum(month05),sum(month06)
,sum(month07),sum(month08),sum(month09),sum(month10),sum(month11),sum(month12),null src,null fy 
from (
select cr_src_country,yyy,str_dis_channel,
case when mon=1  then vals else 0 end month01,
case when mon=2  then vals else 0 end month02,
case when mon=3  then vals else 0 end month03,
case when mon=4  then vals else 0 end month04,
case when mon=5  then vals else 0 end month05,
case when mon=6  then vals else 0 end month06,
case when mon=7  then vals else 0 end month07,
case when mon=8  then vals else 0 end month08,
case when mon=9  then vals else 0 end month09,
case when mon=10 then vals else 0 end month10,
case when mon=11 then vals else 0 end month11,
case when mon=12 then vals else 0 end month12 from (
select cas_cntry_code cr_src_country,date_part('YEAR',mon_begin_first_deposit) yyy,date_part('MONTH',mon_begin_first_deposit) mon, 
str_dis_channel,sum(player_cnt) vals from 
(select cas_cntry_code ,str_dis_channel,mon_begin_first_deposit,
prod_grp_desc,cli_src_cntry,mon_beg_bet_resolve_date_nvp,
player_cnt, 
(mon_beg_bet_resolve_date_nvp-mon_begin_first_deposit) msc
from player_value_Data
where (mon_beg_bet_resolve_date_nvp-mon_begin_first_deposit)=0
and cas_cntry_code = cli_src_cntry) ab
where str_dis_channel = 'Online'
and cas_cntry_code='CZ'
group by cas_cntry_code,str_dis_channel,mon_begin_first_deposit
) ab ) abc
group by cr_src_country,yyy,datatype,upper(str_dis_channel));

------------Retail FTD-----

insert into executive_summary (
select OaFTD.country,OaFTD.datayear, 'ACTUALS - RETAIL','FTD' items, '019-1' source,
OaFTD.month01 - OnFTD.month01 month01, 
OaFTD.month02 - OnFTD.month02 month02, 
OaFTD.month03 - OnFTD.month03 month03, 
OaFTD.month04 - OnFTD.month04 month04, 
OaFTD.month05 - OnFTD.month05 month05, 
OaFTD.month06 - OnFTD.month06 month06, 
OaFTD.month07 - OnFTD.month07 month07, 
OaFTD.month08 - OnFTD.month08 month08, 
OaFTD.month09 - OnFTD.month09 month09, 
OaFTD.month10 - OnFTD.month10 month10, 
OaFTD.month11 - OnFTD.month11 month11, 
OaFTD.month12 - OnFTD.month12 month12, 
null src, null fy from (
select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='First Time Depositors') OaFTD,
(select 4 seq,a.country,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12, a.datayear
from executive_summary a where a.datatype = 'ACTUALS - ONLINE' and a.items ='FTD') OnFTD
where OaFTD.country = OnFTD.country and OaFTD.datayear = OnFTD.datayear);






------------------------------------------------------------------------
---------retail database
delete from executive_summary where datatype in('ACTUALS - RETAIL','ACTUALS - ONLINE') and items='Database' ;
insert into executive_summary (
select uap.country,uap.datayear, uap.datatype,'Database' items, '020' source,
uap.month01 - ftd.month01 month01, 
uap.month02 - ftd.month02 month02, 
uap.month03 - ftd.month03 month03, 
uap.month04 - ftd.month04 month04, 
uap.month05 - ftd.month05 month05, 
uap.month06 - ftd.month06 month06, 
uap.month07 - ftd.month07 month07, 
uap.month08 - ftd.month08 month08, 
uap.month09 - ftd.month09 month09, 
uap.month10 - ftd.month10 month10, 
uap.month11 - ftd.month11 month11, 
uap.month12 - ftd.month12 month12, 
null src, null fy from (
select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - RETAIL' and a.items ='UAP') uap,
(select 4 seq,a.country,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12, a.datayear
from executive_summary a where a.datatype = 'ACTUALS - RETAIL' and a.items ='FTD') ftd
where uap.datatype = ftd.datatype and uap.country = ftd.country and uap.datayear = ftd.datayear);

---------------inserting Retail Anonymous player Net gross win amount CZ
insert into executive_summary (
select anogw.country,anogw.datayear, anogw.datatype,'Retail Anonymous player Net gross win amount' items, '023' source,
0.8*anogw.month01 month01, 0.8*anogw.month02 month02, 0.8*anogw.month03 month03, 
0.8*anogw.month04 month04, 0.8*anogw.month05 month05, 0.8*anogw.month06 month06, 
0.8*anogw.month07 month07, 0.8*anogw.month08 month08, 0.8*anogw.month09 month09, 
0.8*anogw.month10 month10, 0.8*anogw.month11 month11, 0.8*anogw.month12 month12,
null src, null fy from (
select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - RETAIL' and a.items ='Gross win anonymous players'
and a.country='CZ') anogw);

------------Retail Known player Net gross win amount CZ
insert into executive_summary (
select anogw.country,anogw.datayear, anogw.datatype,'Retail Known player Net gross win amount' items, '024' source,
ngw.month01 - anogw.month01*0.8 month01, ngw.month02 - anogw.month02*0.8 month02, 
ngw.month03 - anogw.month03*0.8 month03, ngw.month04 - anogw.month04*0.8 month04, 
ngw.month05 - anogw.month05*0.8 month05, ngw.month06 - anogw.month06*0.8 month06, 
ngw.month07 - anogw.month07*0.8 month07, ngw.month08 - anogw.month08*0.8 month08, 
ngw.month09 - anogw.month09*0.8 month09, ngw.month10 - anogw.month10*0.8 month10, 
ngw.month11 - anogw.month11*0.8 month11, ngw.month12 - anogw.month12*0.8 month12,
null src, null fy from 
(select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - RETAIL' and a.items ='Net Gross Win' and a.country='CZ') ngw,
(select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - RETAIL' and a.items ='Gross win anonymous players' and a.country='CZ') anogw
where anogw.datatype = ngw.datatype and anogw.country = ngw.country and anogw.datayear = ngw.datayear);


----------------------------------------------------------------
-------inserting NGW per UAP
insert into executive_summary (
select ngw.country,ngw.datayear, ngw.datatype,'Retail Net Gross Win per Unique active customer/player' items, '025' source,
case when uap.month01 = 0 then null else ngw.month01 / uap.month01 end month01, 
case when uap.month02 = 0 then null else ngw.month02 / uap.month02 end month02, 
case when uap.month03 = 0 then null else ngw.month03 / uap.month03 end month03, 
case when uap.month04 = 0 then null else ngw.month04 / uap.month04 end month04, 
case when uap.month05 = 0 then null else ngw.month05 / uap.month05 end month05, 
case when uap.month06 = 0 then null else ngw.month06 / uap.month06 end month06, 
case when uap.month07 = 0 then null else ngw.month07 / uap.month07 end month07, 
case when uap.month08 = 0 then null else ngw.month08 / uap.month08 end month08, 
case when uap.month09 = 0 then null else ngw.month09 / uap.month09 end month09, 
case when uap.month10 = 0 then null else ngw.month10 / uap.month10 end month10, 
case when uap.month11 = 0 then null else ngw.month11 / uap.month11 end month11, 
case when uap.month12 = 0 then null else ngw.month12 / uap.month12 end month12,
null src, null fy from (
select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - RETAIL' and a.items ='UAP') uap,
(select 4 seq,a.country,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12, a.datayear
from executive_summary a where a.datatype = 'ACTUALS - RETAIL' and a.items ='Retail Known player Net gross win amount') ngw
where uap.datatype = ngw.datatype and uap.country = ngw.country and uap.datayear = ngw.datayear);





----------------------Online APDs
insert into executive_summary (
select cr_src_country,yyy,'ACTUALS - ONLINE' datatype,'APD' items,'026' source
,sum(month01),sum(month02),sum(month03),sum(month04),sum(month05),sum(month06)
,sum(month07),sum(month08),sum(month09),sum(month10),sum(month11),sum(month12),null src,null fy 
from (
select cr_src_country,yyy,
case when mon=1  then vals else 0 end month01,
case when mon=2  then vals else 0 end month02,
case when mon=3  then vals else 0 end month03,
case when mon=4  then vals else 0 end month04,
case when mon=5  then vals else 0 end month05,
case when mon=6  then vals else 0 end month06,
case when mon=7  then vals else 0 end month07,
case when mon=8  then vals else 0 end month08,
case when mon=9  then vals else 0 end month09,
case when mon=10 then vals else 0 end month10,
case when mon=11 then vals else 0 end month11,
case when mon=12 then vals else 0 end month12 from (
select cr_src_country,date_part('YEAR',bet_Date) yyy,date_part('MONTH',bet_Date) mon
,sum(Player_cnt) vals 
from channel_wise_apd_count 
where 1=1
and cr_src_country  = 'CZ' 
and cr_src_country=cli_src_country
and cr_stor_distr_channel='Online'
group by cr_src_country,bet_Date,cr_stor_distr_channel) ab 
) abc
group by cr_src_country,yyy,datatype);

------------------------------------------------------------
------------Retail Bonus Cost
insert into executive_summary (
select RAPD.country,RAPD.datayear, RAPD.datatype,'Retail Bonus Cost' items, '027' source,
case (RAPD.month01+OAPD.month01) when 0 then null else OBC.month01 * (RAPD.month01 / (RAPD.month01+OAPD.month01)) end month01,
case (RAPD.month02+OAPD.month02) when 0 then null else OBC.month02 * (RAPD.month02 / (RAPD.month02+OAPD.month02)) end month02,
case (RAPD.month03+OAPD.month03) when 0 then null else OBC.month03 * (RAPD.month03 / (RAPD.month03+OAPD.month03)) end month03,
case (RAPD.month04+OAPD.month04) when 0 then null else OBC.month04 * (RAPD.month04 / (RAPD.month04+OAPD.month04)) end month04,
case (RAPD.month05+OAPD.month05) when 0 then null else OBC.month05 * (RAPD.month05 / (RAPD.month05+OAPD.month05)) end month05,
case (RAPD.month06+OAPD.month06) when 0 then null else OBC.month06 * (RAPD.month06 / (RAPD.month06+OAPD.month06)) end month06,
case (RAPD.month07+OAPD.month07) when 0 then null else OBC.month07 * (RAPD.month07 / (RAPD.month07+OAPD.month07)) end month07,
case (RAPD.month08+OAPD.month08) when 0 then null else OBC.month08 * (RAPD.month08 / (RAPD.month08+OAPD.month08)) end month08,
case (RAPD.month09+OAPD.month09) when 0 then null else OBC.month09 * (RAPD.month09 / (RAPD.month09+OAPD.month09)) end month09,
case (RAPD.month10+OAPD.month10) when 0 then null else OBC.month10 * (RAPD.month10 / (RAPD.month10+OAPD.month10)) end month10,
case (RAPD.month11+OAPD.month11) when 0 then null else OBC.month11 * (RAPD.month11 / (RAPD.month11+OAPD.month11)) end month11,
case (RAPD.month12+OAPD.month12) when 0 then null else OBC.month12 * (RAPD.month12 / (RAPD.month12+OAPD.month12)) end month12,
null src, null fy from 
(select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - RETAIL' and a.items ='APD') RAPD,
(select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - ONLINE' and a.items ='APD') OAPD,
(select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Bonuses Total (PL_150_03_00)') OBC
where RAPD.items = OAPD.items and RAPD.country = OAPD.country and RAPD.datayear = OAPD.datayear
                              and RAPD.country = OBC.country  and RAPD.datayear = OBC.datayear
);


















---------------------------------------------------------------------------
----retail stake per apd
insert into executive_summary (
select stk.country,stk.datayear, stk.datatype,'Retail Stake amount per active player days' items, '028' source,
case when apd.month01=0 then null else stk.month01 / apd.month01 end month01, 
case when apd.month02=0 then null else stk.month02 / apd.month02 end month02, 
case when apd.month03=0 then null else stk.month03 / apd.month03 end month03, 
case when apd.month04=0 then null else stk.month04 / apd.month04 end month04, 
case when apd.month05=0 then null else stk.month05 / apd.month05 end month05, 
case when apd.month06=0 then null else stk.month06 / apd.month06 end month06, 
case when apd.month07=0 then null else stk.month07 / apd.month07 end month07, 
case when apd.month08=0 then null else stk.month08 / apd.month08 end month08, 
case when apd.month09=0 then null else stk.month09 / apd.month09 end month09, 
case when apd.month10=0 then null else stk.month10 / apd.month10 end month10, 
case when apd.month11=0 then null else stk.month11 / apd.month11 end month11, 
case when apd.month12=0 then null else stk.month12 / apd.month12 end month12,
null src, null fy from (
select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - RETAIL' and a.items ='Stake amount known customers') Stk,
(select 4 seq,a.country,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12, a.datayear
from executive_summary a where a.datatype = 'ACTUALS - RETAIL' and a.items ='APD') apd
where stk.datatype = apd.datatype and stk.country = apd.country and stk.datayear = apd.datayear
);


-----------------------------------------------------------------------
----retail player yeild
insert into executive_summary (
select ngr.country,ngr.datayear, ngr.datatype,'Player Yeild per UAP' items, '029' source,
case when uap.month01 = 0 then null else (ngr.month01-bc.month01) / uap.month01 end month01, 
case when uap.month02 = 0 then null else (ngr.month02-bc.month02) / uap.month02 end month02, 
case when uap.month03 = 0 then null else (ngr.month03-bc.month03) / uap.month03 end month03, 
case when uap.month04 = 0 then null else (ngr.month04-bc.month04) / uap.month04 end month04, 
case when uap.month05 = 0 then null else (ngr.month05-bc.month05) / uap.month05 end month05, 
case when uap.month06 = 0 then null else (ngr.month06-bc.month06) / uap.month06 end month06, 
case when uap.month07 = 0 then null else (ngr.month07-bc.month07) / uap.month07 end month07, 
case when uap.month08 = 0 then null else (ngr.month08-bc.month08) / uap.month08 end month08, 
case when uap.month09 = 0 then null else (ngr.month09-bc.month09) / uap.month09 end month09, 
case when uap.month10 = 0 then null else (ngr.month10-bc.month10) / uap.month10 end month10, 
case when uap.month11 = 0 then null else (ngr.month11-bc.month11) / uap.month11 end month11, 
case when uap.month12 = 0 then null else (ngr.month12-bc.month12) / uap.month12 end month12, 
null src, null fy from 
(select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - RETAIL' and a.items ='Retail Known player Net gross win amount' ) ngr,
(select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - RETAIL' and a.items ='Retail Bonus Cost' ) bc,
(select 4 seq,a.country,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12, a.datayear
from executive_summary a where a.datatype = 'ACTUALS - RETAIL' and a.items ='UAP' ) uap
where ngr.datatype = uap.datatype and ngr.country = uap.country and ngr.datayear = uap.datayear
and ngr.datatype = bc.datatype and ngr.country = bc.country and ngr.datayear = bc.datayear
);


--------------------------------------------------------------------------
------------retail yeild per uap
insert into executive_summary (
select ye.country,ye.datayear, ye.datatype,'Player Yeild' items, '030' source,
case when uap.month01 = 0 then null else ye.month01 / uap.month01 end month01, 
case when uap.month02 = 0 then null else ye.month02 / uap.month02 end month02, 
case when uap.month03 = 0 then null else ye.month03 / uap.month03 end month03, 
case when uap.month04 = 0 then null else ye.month04 / uap.month04 end month04, 
case when uap.month05 = 0 then null else ye.month05 / uap.month05 end month05, 
case when uap.month06 = 0 then null else ye.month06 / uap.month06 end month06, 
case when uap.month07 = 0 then null else ye.month07 / uap.month07 end month07, 
case when uap.month08 = 0 then null else ye.month08 / uap.month08 end month08, 
case when uap.month09 = 0 then null else ye.month09 / uap.month09 end month09, 
case when uap.month10 = 0 then null else ye.month10 / uap.month10 end month10, 
case when uap.month11 = 0 then null else ye.month11 / uap.month11 end month11, 
case when uap.month12 = 0 then null else ye.month12 / uap.month12 end month12, 
null src, null fy from (
select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - RETAIL' and a.items ='Player Yeild' ) ye,
(select 4 seq,a.country,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12, a.datayear
from executive_summary a where a.datatype = 'ACTUALS - RETAIL' and a.items ='UAP' ) uap
where ye.datatype = uap.datatype and ye.country = uap.country and ye.datayear = uap.datayear
);

------------------------------------------------------------
------------Retail ngw margin
insert into executive_summary (
select ngw.country,ngw.datayear, ngw.datatype,'Retail NGW Margin' items, '031' source,
case when stk.month01 = 0 then null else ngw.month01 / stk.month01 end month01, 
case when stk.month02 = 0 then null else ngw.month02 / stk.month02 end month02, 
case when stk.month03 = 0 then null else ngw.month03 / stk.month03 end month03, 
case when stk.month04 = 0 then null else ngw.month04 / stk.month04 end month04, 
case when stk.month05 = 0 then null else ngw.month05 / stk.month05 end month05, 
case when stk.month06 = 0 then null else ngw.month06 / stk.month06 end month06, 
case when stk.month07 = 0 then null else ngw.month07 / stk.month07 end month07, 
case when stk.month08 = 0 then null else ngw.month08 / stk.month08 end month08, 
case when stk.month09 = 0 then null else ngw.month09 / stk.month09 end month09, 
case when stk.month10 = 0 then null else ngw.month10 / stk.month10 end month10, 
case when stk.month11 = 0 then null else ngw.month11 / stk.month11 end month11, 
case when stk.month12 = 0 then null else ngw.month12 / stk.month12 end month12,
null src, null fy from (
select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - RETAIL' and a.items ='Net Gross Win') ngw,
(select 4 seq,a.country,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12, a.datayear
from executive_summary a where a.datatype = 'ACTUALS - RETAIL' and a.items ='Stake amount') stk
where stk.datatype = ngw.datatype and stk.country = ngw.country and stk.datayear = ngw.datayear
);

------------------------------------------------------------
------------Retail Known Stake Share
insert into executive_summary (
select kStk.country,kStk.datayear, kStk.datatype,'Retail Known Stake Share' items, '032' source,
case when stk.month01 = 0 then null else kStk.month01 / stk.month01 end month01, 
case when stk.month02 = 0 then null else kStk.month02 / stk.month02 end month02, 
case when stk.month03 = 0 then null else kStk.month03 / stk.month03 end month03, 
case when stk.month04 = 0 then null else kStk.month04 / stk.month04 end month04, 
case when stk.month05 = 0 then null else kStk.month05 / stk.month05 end month05, 
case when stk.month06 = 0 then null else kStk.month06 / stk.month06 end month06, 
case when stk.month07 = 0 then null else kStk.month07 / stk.month07 end month07, 
case when stk.month08 = 0 then null else kStk.month08 / stk.month08 end month08, 
case when stk.month09 = 0 then null else kStk.month09 / stk.month09 end month09, 
case when stk.month10 = 0 then null else kStk.month10 / stk.month10 end month10, 
case when stk.month11 = 0 then null else kStk.month11 / stk.month11 end month11, 
case when stk.month12 = 0 then null else kStk.month12 / stk.month12 end month12,
null src, null fy from (
select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - RETAIL' and a.items ='Stake amount known customers') kStk,
(select 4 seq,a.country,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12, a.datayear
from executive_summary a where a.datatype = 'ACTUALS - RETAIL' and a.items ='Stake amount') stk
where stk.datatype = kStk.datatype and stk.country = kStk.country and stk.datayear = kStk.datayear);

------------------------------------------------------------
------------Retail Annonymous Stake Share
insert into executive_summary (
select kStk.country,kStk.datayear, kStk.datatype,'Retail Annonymous Stake Share' items, '033' source,
case when stk.month01 = 0 then null else kStk.month01 / stk.month01 end month01, 
case when stk.month02 = 0 then null else kStk.month02 / stk.month02 end month02, 
case when stk.month03 = 0 then null else kStk.month03 / stk.month03 end month03, 
case when stk.month04 = 0 then null else kStk.month04 / stk.month04 end month04, 
case when stk.month05 = 0 then null else kStk.month05 / stk.month05 end month05, 
case when stk.month06 = 0 then null else kStk.month06 / stk.month06 end month06, 
case when stk.month07 = 0 then null else kStk.month07 / stk.month07 end month07, 
case when stk.month08 = 0 then null else kStk.month08 / stk.month08 end month08, 
case when stk.month09 = 0 then null else kStk.month09 / stk.month09 end month09, 
case when stk.month10 = 0 then null else kStk.month10 / stk.month10 end month10, 
case when stk.month11 = 0 then null else kStk.month11 / stk.month11 end month11, 
case when stk.month12 = 0 then null else kStk.month12 / stk.month12 end month12,
null src, null fy from (
select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - RETAIL' and a.items ='Stake amount anonymous customers') kStk,
(select 4 seq,a.country,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12, a.datayear
from executive_summary a where a.datatype = 'ACTUALS - RETAIL' and a.items ='Stake amount') stk
where stk.datatype = kStk.datatype and stk.country = kStk.country and stk.datayear = kStk.datayear);

------------------------------------------------------------
------------Retail Stake Share
insert into executive_summary (
select kStk.country,kStk.datayear, kStk.datatype,'Retail Stake Share' items, '034' source,
case when stk.month01 = 0 then null else kStk.month01 / stk.month01 end month01, 
case when stk.month02 = 0 then null else kStk.month02 / stk.month02 end month02, 
case when stk.month03 = 0 then null else kStk.month03 / stk.month03 end month03, 
case when stk.month04 = 0 then null else kStk.month04 / stk.month04 end month04, 
case when stk.month05 = 0 then null else kStk.month05 / stk.month05 end month05, 
case when stk.month06 = 0 then null else kStk.month06 / stk.month06 end month06, 
case when stk.month07 = 0 then null else kStk.month07 / stk.month07 end month07, 
case when stk.month08 = 0 then null else kStk.month08 / stk.month08 end month08, 
case when stk.month09 = 0 then null else kStk.month09 / stk.month09 end month09, 
case when stk.month10 = 0 then null else kStk.month10 / stk.month10 end month10, 
case when stk.month11 = 0 then null else kStk.month11 / stk.month11 end month11, 
case when stk.month12 = 0 then null else kStk.month12 / stk.month12 end month12,
null src, null fy from (
select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - RETAIL' and a.items ='Stake amount') kStk,
(select 4 seq,a.country,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12, a.datayear
from executive_summary a where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Stake amount') stk
where stk.items = kStk.items and stk.country = kStk.country and stk.datayear = kStk.datayear);





-----------------online marketing spend---------------
insert into executive_summary (
select RUAP.country,RUAP.datayear, 'ACTUALS - ONLINE' datatype,'Online Marketing Spend' items, '035' source,
case (OUAP.month01+RUAP.month01) when 0 then null else oth.month01 + affmar.month01 + ( (adv_ag.month01 + media.month01 + spon.month01)* (OUAP.month01 / (OUAP.month01+RUAP.month01))) end month01,
case (OUAP.month02+RUAP.month02) when 0 then null else oth.month02 + affmar.month02 + ( (adv_ag.month02 + media.month02 + spon.month02)* (OUAP.month02 / (OUAP.month02+RUAP.month02))) end month02,
case (OUAP.month03+RUAP.month03) when 0 then null else oth.month03 + affmar.month03 + ( (adv_ag.month03 + media.month03 + spon.month03)* (OUAP.month03 / (OUAP.month03+RUAP.month03))) end month03,
case (OUAP.month04+RUAP.month04) when 0 then null else oth.month04 + affmar.month04 + ( (adv_ag.month04 + media.month04 + spon.month04)* (OUAP.month04 / (OUAP.month04+RUAP.month04))) end month04,
case (OUAP.month05+RUAP.month05) when 0 then null else oth.month05 + affmar.month05 + ( (adv_ag.month05 + media.month05 + spon.month05)* (OUAP.month05 / (OUAP.month05+RUAP.month05))) end month05,
case (OUAP.month06+RUAP.month06) when 0 then null else oth.month06 + affmar.month06 + ( (adv_ag.month06 + media.month06 + spon.month06)* (OUAP.month06 / (OUAP.month06+RUAP.month06))) end month06,
case (OUAP.month07+RUAP.month07) when 0 then null else oth.month07 + affmar.month07 + ( (adv_ag.month07 + media.month07 + spon.month07)* (OUAP.month07 / (OUAP.month07+RUAP.month07))) end month07,
case (OUAP.month08+RUAP.month08) when 0 then null else oth.month08 + affmar.month08 + ( (adv_ag.month08 + media.month08 + spon.month08)* (OUAP.month08 / (OUAP.month08+RUAP.month08))) end month08,
case (OUAP.month09+RUAP.month09) when 0 then null else oth.month09 + affmar.month09 + ( (adv_ag.month09 + media.month09 + spon.month09)* (OUAP.month09 / (OUAP.month09+RUAP.month09))) end month09,
case (OUAP.month10+RUAP.month10) when 0 then null else oth.month10 + affmar.month10 + ( (adv_ag.month10 + media.month10 + spon.month10)* (OUAP.month10 / (OUAP.month10+RUAP.month10))) end month10,
case (OUAP.month11+RUAP.month11) when 0 then null else oth.month11 + affmar.month11 + ( (adv_ag.month11 + media.month11 + spon.month11)* (OUAP.month11 / (OUAP.month11+RUAP.month11))) end month11,
case (OUAP.month12+RUAP.month12) when 0 then null else oth.month12 + affmar.month12 + ( (adv_ag.month12 + media.month12 + spon.month12)* (OUAP.month12 / (OUAP.month12+RUAP.month12))) end month12,
null src, null fy 
from 
(select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - RETAIL' and a.items ='UAP') RUAP,
(select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - ONLINE' and a.items ='UAP') OUAP,
(select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Others') Oth,
(select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Affiliate marketing') affmar,
(select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Advertising agencies') adv_ag,
(select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items like 'Media advertising%') media,
(select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items like 'Sponsoring') spon
where 1=1
and RUAP.items = OUAP.items and RUAP.country = OUAP.country and RUAP.datayear = OUAP.datayear
and Oth.datatype=affmar.datatype and Oth.country=affmar.country and Oth.datayear=affmar.datayear 
and Oth.datatype=spon.datatype and Oth.country=spon.country and Oth.datayear=spon.datayear 
and Oth.datatype=adv_ag.datatype and Oth.country=adv_ag.country and Oth.datayear=adv_ag.datayear 
and Oth.datatype=media.datatype and Oth.country=media.country and Oth.datayear=media.datayear 
and RUAP.country = oth.country and ruap.datayear = oth.datayear and RUAP.country='CZ'
);
---------------------------------------

-----------------retail marketing spend---------------
insert into executive_summary (
select TMS.country,TMS.datayear, 'ACTUALS - RETAIL' datatype,'Retail Marketing Spend' items, '036' source,
TMS.month01-OMS.month01 month01,
TMS.month02-OMS.month02 month02,
TMS.month03-OMS.month03 month03,
TMS.month04-OMS.month04 month04,
TMS.month05-OMS.month05 month05,
TMS.month06-OMS.month06 month06,
TMS.month07-OMS.month07 month07,
TMS.month08-OMS.month08 month08,
TMS.month09-OMS.month09 month09,
TMS.month10-OMS.month10 month10,
TMS.month11-OMS.month11 month11,
TMS.month12-OMS.month12 month12,
null src, null fy 
from 
(select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - ONLINE' and a.items ='Online Marketing Spend') OMS,
(select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Marketing (PL_250_04)') TMS
where TMS.country = OMS.country and TMS.datayear = OMS.datayear
);
---------------------



--------------online
----------------online Web Net Gross Win
insert into executive_summary (
select cr_src_country,yyy,'ACTUALS - ONLINE' datatype,
case str_type when 'Web' then 'Web NGW' when 'Mobil' then 'Mobile NGW' end items,'037' source
,sum(month01),sum(month02),sum(month03),sum(month04),sum(month05),sum(month06)
,sum(month07),sum(month08),sum(month09),sum(month10),sum(month11),sum(month12),null src,null fy 
from (
select cr_src_country,yyy,str_type,
case when mon=1  then vals else 0 end month01,
case when mon=2  then vals else 0 end month02,
case when mon=3  then vals else 0 end month03,
case when mon=4  then vals else 0 end month04,
case when mon=5  then vals else 0 end month05,
case when mon=6  then vals else 0 end month06,
case when mon=7  then vals else 0 end month07,
case when mon=8  then vals else 0 end month08,
case when mon=9  then vals else 0 end month09,
case when mon=10 then vals else 0 end month10,
case when mon=11 then vals else 0 end month11,
case when mon=12 then vals else 0 end month12 from (
select src_country_code cr_src_country,str_type,
date_part('YEAR',day_date) yyy,date_part('MONTH',day_date) mon,
SUM(net_gross_win_amt) vals
from store_type_financial_data
where src_country_code = 'CZ'
and str_type in ('Web','Mobil')
group by src_country_code,str_type,
date_part('YEAR',day_date),
date_part('MONTH',day_date)) ab) abc
group by cr_src_country,yyy,datatype,case str_type when 'Web' then 'Web NGW' when 'Mobil' then 'Mobile NGW' end);

----------------online Stake Web/Mobile
insert into executive_summary (
select cr_src_country,yyy,'ACTUALS - ONLINE' datatype,
case str_type when 'Web' then 'Web Stake' when 'Mobil' then 'Mobile Stake' end items,'038' source
,sum(month01),sum(month02),sum(month03),sum(month04),sum(month05),sum(month06)
,sum(month07),sum(month08),sum(month09),sum(month10),sum(month11),sum(month12),null src,null fy 
from (
select cr_src_country,yyy,str_type,
case when mon=1  then vals else 0 end month01,
case when mon=2  then vals else 0 end month02,
case when mon=3  then vals else 0 end month03,
case when mon=4  then vals else 0 end month04,
case when mon=5  then vals else 0 end month05,
case when mon=6  then vals else 0 end month06,
case when mon=7  then vals else 0 end month07,
case when mon=8  then vals else 0 end month08,
case when mon=9  then vals else 0 end month09,
case when mon=10 then vals else 0 end month10,
case when mon=11 then vals else 0 end month11,
case when mon=12 then vals else 0 end month12 from (
select src_country_code cr_src_country,str_type,
date_part('YEAR',day_date) yyy,date_part('MONTH',day_date) mon,
SUM(stake_amt) vals
from store_type_financial_data
where src_country_code = 'CZ'
and str_type in ('Web','Mobil')
group by src_country_code,str_type,
date_part('YEAR',day_date),
date_part('MONTH',day_date)) ab) abc
group by cr_src_country,yyy,datatype,case str_type when 'Web' then 'Web Stake' when 'Mobil' then 'Mobile Stake' end);

-------------------online stake share
insert into executive_summary (
select OS.country,OS.datayear, 'ACTUALS - ONLINE' datatype,'Online Stake Share' items, '039' source,
OS.month01/OAS.month01 month01,
OS.month02/OAS.month02 month02,
OS.month03/OAS.month03 month03,
OS.month04/OAS.month04 month04,
OS.month05/OAS.month05 month05,
OS.month06/OAS.month06 month06,
OS.month07/OAS.month07 month07,
OS.month08/OAS.month08 month08,
OS.month09/OAS.month09 month09,
OS.month10/OAS.month10 month10,
OS.month11/OAS.month11 month11,
OS.month12/OAS.month12 month12,
null src, null fy 
from 
(select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - ONLINE' and a.items = 'Stake amount') OS,
(select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items = 'Stake amount') OAS
where OAS.country = OS.country and OAS.datayear = OS.datayear and OAS.items = OS.items);

----------online web stake share
insert into executive_summary (
select OS.country,OS.datayear, 'ACTUALS - ONLINE' datatype,'Web Stake Share' items, '040' source,
OS.month01/OAS.month01 month01,
OS.month02/OAS.month02 month02,
OS.month03/OAS.month03 month03,
OS.month04/OAS.month04 month04,
OS.month05/OAS.month05 month05,
OS.month06/OAS.month06 month06,
OS.month07/OAS.month07 month07,
OS.month08/OAS.month08 month08,
OS.month09/OAS.month09 month09,
OS.month10/OAS.month10 month10,
OS.month11/OAS.month11 month11,
OS.month12/OAS.month12 month12,
null src, null fy 
from 
(select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - ONLINE' and a.items = 'Web Stake') OS,
(select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - ONLINE' and a.items = 'Stake amount') OAS
where OAS.country = OS.country and OAS.datayear = OS.datayear and OAS.datatype = OS.datatype);

----------------online mobile stake share
insert into executive_summary (
select OS.country,OS.datayear, 'ACTUALS - ONLINE' datatype,'Mobile Stake Share' items, '041' source,
OS.month01/OAS.month01 month01,
OS.month02/OAS.month02 month02,
OS.month03/OAS.month03 month03,
OS.month04/OAS.month04 month04,
OS.month05/OAS.month05 month05,
OS.month06/OAS.month06 month06,
OS.month07/OAS.month07 month07,
OS.month08/OAS.month08 month08,
OS.month09/OAS.month09 month09,
OS.month10/OAS.month10 month10,
OS.month11/OAS.month11 month11,
OS.month12/OAS.month12 month12,
null src, null fy 
from 
(select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - ONLINE' and a.items = 'Mobile Stake') OS,
(select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - ONLINE' and a.items = 'Stake amount') OAS
where OAS.country = OS.country and OAS.datayear = OS.datayear and OAS.datatype = OS.datatype);

----------------online UAP Web/Mobile
insert into executive_summary (
select cr_src_country,yyy,'ACTUALS - ONLINE' datatype,
case str_type when 'Web' then 'Web UAP' when 'Mobil' then 'Mobile UAP' end items,'042' source
,sum(month01),sum(month02),sum(month03),sum(month04),sum(month05),sum(month06)
,sum(month07),sum(month08),sum(month09),sum(month10),sum(month11),sum(month12),null src,null fy 
from (
select cr_src_country,yyy,str_type,
case when mon=1  then vals else 0 end month01,
case when mon=2  then vals else 0 end month02,
case when mon=3  then vals else 0 end month03,
case when mon=4  then vals else 0 end month04,
case when mon=5  then vals else 0 end month05,
case when mon=6  then vals else 0 end month06,
case when mon=7  then vals else 0 end month07,
case when mon=8  then vals else 0 end month08,
case when mon=9  then vals else 0 end month09,
case when mon=10 then vals else 0 end month10,
case when mon=11 then vals else 0 end month11,
case when mon=12 then vals else 0 end month12 from (
select cr_src_country,cr_stor_type str_type,
date_part('YEAR',bet_Date) yyy,date_part('MONTH',bet_Date) mon,
sum(player_cnt) vals
from store_type_uap_count 
where cr_Stor_distr_channel = 'Online' 
and cr_src_country = 'CZ'
and cli_src_country = 'CZ'
group by cr_src_country,cr_stor_type,
date_part('YEAR',bet_Date),date_part('MONTH',bet_Date)) ab) abc
group by cr_src_country,yyy,datatype,case str_type when 'Web' then 'Web UAP' when 'Mobil' then 'Mobile UAP' end);

----------------online UAP
insert into executive_summary (
select cr_src_country,yyy,'ACTUALS - ONLINE' datatype,'Online UAP' items,'043' source
,sum(month01),sum(month02),sum(month03),sum(month04),sum(month05),sum(month06)
,sum(month07),sum(month08),sum(month09),sum(month10),sum(month11),sum(month12),null src,null fy 
from (
select cr_src_country,yyy,str_type,
case when mon=1  then vals else 0 end month01,
case when mon=2  then vals else 0 end month02,
case when mon=3  then vals else 0 end month03,
case when mon=4  then vals else 0 end month04,
case when mon=5  then vals else 0 end month05,
case when mon=6  then vals else 0 end month06,
case when mon=7  then vals else 0 end month07,
case when mon=8  then vals else 0 end month08,
case when mon=9  then vals else 0 end month09,
case when mon=10 then vals else 0 end month10,
case when mon=11 then vals else 0 end month11,
case when mon=12 then vals else 0 end month12 from (
select cr_src_country cr_src_country,cr_stor_distr_channel str_type,
date_part('YEAR',bet_date) yyy,date_part('MONTH',bet_date) mon,
SUM(player_cnt) vals
from channel_wise_uap_count
where cr_src_country = 'CZ'
and cr_src_country = cli_src_country
and cr_stor_distr_channel in ('Online')
group by cr_src_country,date_part('YEAR',bet_date),date_part('MONTH',bet_date),cr_stor_distr_channel) ab) abc
group by cr_src_country,yyy,datatype,case str_type when 'Web' then 'Web Stake' when 'Mobil' then 'Mobile Stake' end);

----------------online web/mobile UAP
insert into executive_summary (
select cr_src_country,yyy,'ACTUALS - ONLINE' datatype,
case str_type when 'Web' then 'Web UAP' when 'Mobil' then 'Mobile UAP' end items,'044' source
,sum(month01),sum(month02),sum(month03),sum(month04),sum(month05),sum(month06)
,sum(month07),sum(month08),sum(month09),sum(month10),sum(month11),sum(month12),null src,null fy 
from (
select cr_src_country,yyy,str_type,
case when mon=1  then vals else 0 end month01,
case when mon=2  then vals else 0 end month02,
case when mon=3  then vals else 0 end month03,
case when mon=4  then vals else 0 end month04,
case when mon=5  then vals else 0 end month05,
case when mon=6  then vals else 0 end month06,
case when mon=7  then vals else 0 end month07,
case when mon=8  then vals else 0 end month08,
case when mon=9  then vals else 0 end month09,
case when mon=10 then vals else 0 end month10,
case when mon=11 then vals else 0 end month11,
case when mon=12 then vals else 0 end month12 from (
select cr_src_country cr_src_country,cr_stor_type str_type,
date_part('YEAR',bet_date) yyy,date_part('MONTH',bet_date) mon,
SUM(player_cnt) vals
from store_type_uap_count
where cr_src_country = 'CZ'
and cr_src_country = cli_src_country
and cr_stor_distr_channel in ('Online')
group by cr_src_country,date_part('YEAR',bet_date),date_part('MONTH',bet_date),cr_stor_type) ab) abc
group by cr_src_country,yyy,datatype,case str_type when 'Web' then 'Web UAP' when 'Mobil' then 'Mobile UAP' end);


----------online database
insert into executive_summary (
select UAP.country,UAP.datayear, 'ACTUALS - ONLINE' datatype,'Database' items, '045' source,
UAP.month01-FTD.month01 month01,
UAP.month02-FTD.month02 month02,
UAP.month03-FTD.month03 month03,
UAP.month04-FTD.month04 month04,
UAP.month05-FTD.month05 month05,
UAP.month06-FTD.month06 month06,
UAP.month07-FTD.month07 month07,
UAP.month08-FTD.month08 month08,
UAP.month09-FTD.month09 month09,
UAP.month10-FTD.month10 month10,
UAP.month11-FTD.month11 month11,
UAP.month12-FTD.month12 month12,
null src, null fy 
from 
(select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - ONLINE' and a.items = 'UAP') UAP,
(select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - ONLINE' and a.items = 'FTD') FTD
where UAP.country = FTD.country and UAP.datayear = FTD.datayear and UAP.datatype = FTD.datatype);

----------------online web/mobile APD
insert into executive_summary (
select cr_src_country,yyy,'ACTUALS - ONLINE' datatype,
case str_type when 'Web' then 'Web APD' when 'Mobil' then 'Mobile APD' end items,'046' source
,sum(month01),sum(month02),sum(month03),sum(month04),sum(month05),sum(month06)
,sum(month07),sum(month08),sum(month09),sum(month10),sum(month11),sum(month12),null src,null fy 
from (
select cr_src_country,yyy,str_type,
case when mon=1  then vals else 0 end month01,
case when mon=2  then vals else 0 end month02,
case when mon=3  then vals else 0 end month03,
case when mon=4  then vals else 0 end month04,
case when mon=5  then vals else 0 end month05,
case when mon=6  then vals else 0 end month06,
case when mon=7  then vals else 0 end month07,
case when mon=8  then vals else 0 end month08,
case when mon=9  then vals else 0 end month09,
case when mon=10 then vals else 0 end month10,
case when mon=11 then vals else 0 end month11,
case when mon=12 then vals else 0 end month12 from (
select cr_src_country cr_src_country,cr_stor_type str_type,
date_part('YEAR',bet_date) yyy,date_part('MONTH',bet_date) mon,
SUM(player_cnt) vals
from store_type_apd_count
where cr_src_country = 'CZ'
and cr_src_country = cli_src_country
and cr_stor_distr_channel in ('Online')
group by cr_src_country,date_part('YEAR',bet_date),date_part('MONTH',bet_date),cr_stor_type) ab) abc
group by cr_src_country,yyy,datatype,case str_type when 'Web' then 'Web APD' when 'Mobil' then 'Mobile APD' end);


-------inserting ONLINE NGW per UAP
insert into executive_summary (
select ngw.country,ngw.datayear, ngw.datatype,'NGW per UAP' items, '047' source,
case when uap.month01 = 0 then null else ngw.month01 / uap.month01 end month01, 
case when uap.month02 = 0 then null else ngw.month02 / uap.month02 end month02, 
case when uap.month03 = 0 then null else ngw.month03 / uap.month03 end month03, 
case when uap.month04 = 0 then null else ngw.month04 / uap.month04 end month04, 
case when uap.month05 = 0 then null else ngw.month05 / uap.month05 end month05, 
case when uap.month06 = 0 then null else ngw.month06 / uap.month06 end month06, 
case when uap.month07 = 0 then null else ngw.month07 / uap.month07 end month07, 
case when uap.month08 = 0 then null else ngw.month08 / uap.month08 end month08, 
case when uap.month09 = 0 then null else ngw.month09 / uap.month09 end month09, 
case when uap.month10 = 0 then null else ngw.month10 / uap.month10 end month10, 
case when uap.month11 = 0 then null else ngw.month11 / uap.month11 end month11, 
case when uap.month12 = 0 then null else ngw.month12 / uap.month12 end month12,
null src, null fy from (
select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype in ('ACTUALS - ONLINE') and a.items ='UAP') uap,
(select a.country,a.datayear, a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12
from executive_summary a where a.datatype in ('ACTUALS - ONLINE') and a.items ='Net Gross Win') ngw
where uap.datatype = ngw.datatype and uap.country = ngw.country and uap.datayear = ngw.datayear);


----ONLINE stake per apd
insert into executive_summary (
select stk.country,stk.datayear, stk.datatype,'Stake per APD' items, '048' source,
case when apd.month01=0 then null else stk.month01 / apd.month01 end month01, 
case when apd.month02=0 then null else stk.month02 / apd.month02 end month02, 
case when apd.month03=0 then null else stk.month03 / apd.month03 end month03, 
case when apd.month04=0 then null else stk.month04 / apd.month04 end month04, 
case when apd.month05=0 then null else stk.month05 / apd.month05 end month05, 
case when apd.month06=0 then null else stk.month06 / apd.month06 end month06, 
case when apd.month07=0 then null else stk.month07 / apd.month07 end month07, 
case when apd.month08=0 then null else stk.month08 / apd.month08 end month08, 
case when apd.month09=0 then null else stk.month09 / apd.month09 end month09, 
case when apd.month10=0 then null else stk.month10 / apd.month10 end month10, 
case when apd.month11=0 then null else stk.month11 / apd.month11 end month11, 
case when apd.month12=0 then null else stk.month12 / apd.month12 end month12,
null src, null fy from (
select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - ONLINE' and a.items ='Stake amount') Stk,
(select 4 seq,a.country,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12, a.datayear
from executive_summary a where a.datatype = 'ACTUALS - ONLINE' and a.items ='APD') apd
where stk.datatype = apd.datatype and stk.country = apd.country and stk.datayear = apd.datayear);


------------------------------------------------------------
------------ONLINE ngw margin
insert into executive_summary (
select ngw.country,ngw.datayear, ngw.datatype,'Online NGW Margin' items, '049' source,
case when stk.month01 = 0 then null else ngw.month01 / stk.month01 end month01, 
case when stk.month02 = 0 then null else ngw.month02 / stk.month02 end month02, 
case when stk.month03 = 0 then null else ngw.month03 / stk.month03 end month03, 
case when stk.month04 = 0 then null else ngw.month04 / stk.month04 end month04, 
case when stk.month05 = 0 then null else ngw.month05 / stk.month05 end month05, 
case when stk.month06 = 0 then null else ngw.month06 / stk.month06 end month06, 
case when stk.month07 = 0 then null else ngw.month07 / stk.month07 end month07, 
case when stk.month08 = 0 then null else ngw.month08 / stk.month08 end month08, 
case when stk.month09 = 0 then null else ngw.month09 / stk.month09 end month09, 
case when stk.month10 = 0 then null else ngw.month10 / stk.month10 end month10, 
case when stk.month11 = 0 then null else ngw.month11 / stk.month11 end month11, 
case when stk.month12 = 0 then null else ngw.month12 / stk.month12 end month12,
null src, null fy from (
select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - ONLINE' and a.items ='Net Gross Win') ngw,
(select 4 seq,a.country,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12, a.datayear
from executive_summary a where a.datatype = 'ACTUALS - ONLINE' and a.items ='Stake amount') stk
where stk.datatype = ngw.datatype and stk.country = ngw.country and stk.datayear = ngw.datayear);

-----------------------------------------------------------------------
----Online player yeild
insert into executive_summary (
select ngr.country,ngr.datayear, ngr.datatype,'Player Yeild per UAP' items, '050' source,
case when uap.month01 = 0 then null else ngr.month01 / uap.month01 end month01, 
case when uap.month02 = 0 then null else ngr.month02 / uap.month02 end month02, 
case when uap.month03 = 0 then null else ngr.month03 / uap.month03 end month03, 
case when uap.month04 = 0 then null else ngr.month04 / uap.month04 end month04, 
case when uap.month05 = 0 then null else ngr.month05 / uap.month05 end month05, 
case when uap.month06 = 0 then null else ngr.month06 / uap.month06 end month06, 
case when uap.month07 = 0 then null else ngr.month07 / uap.month07 end month07, 
case when uap.month08 = 0 then null else ngr.month08 / uap.month08 end month08, 
case when uap.month09 = 0 then null else ngr.month09 / uap.month09 end month09, 
case when uap.month10 = 0 then null else ngr.month10 / uap.month10 end month10, 
case when uap.month11 = 0 then null else ngr.month11 / uap.month11 end month11, 
case when uap.month12 = 0 then null else ngr.month12 / uap.month12 end month12, 
null src, null fy from (
select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - ONLINE' and a.items ='Net Gaming Revenue' ) ngr,
(select 4 seq,a.country,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12, a.datayear
from executive_summary a where a.datatype = 'ACTUALS - ONLINE' and a.items ='UAP' ) uap
where ngr.datatype = uap.datatype and ngr.country = uap.country and ngr.datayear = uap.datayear);


-----------------Online/Retail Player Churn Rate---------------
insert into executive_summary (
select a.country,a.datayear,a.datatype,'Player Churn Rate' items, '051' src,
null month01, 
case b.month01 when 0 then null else 1-(a.month02/b.month01) end  month02,
case b.month02 when 0 then null else 1-(a.month03/b.month02) end  month03,
case b.month03 when 0 then null else 1-(a.month04/b.month03) end  month04,
case b.month04 when 0 then null else 1-(a.month05/b.month04) end  month05,
case b.month05 when 0 then null else 1-(a.month06/b.month05) end  month06,
case b.month06 when 0 then null else 1-(a.month07/b.month06) end  month07,
case b.month07 when 0 then null else 1-(a.month08/b.month07) end  month08,
case b.month08 when 0 then null else 1-(a.month09/b.month08) end  month09,
case b.month09 when 0 then null else 1-(a.month10/b.month09) end  month10,
case b.month10 when 0 then null else 1-(a.month11/b.month10) end  month11,
case b.month11 when 0 then null else 1-(a.month12/b.month11) end  month12,
null src, null fy  
from executive_summary a ,executive_summary b 
where a.datatype = b.datatype and a.items = 'Database' and b.items = 'UAP' 
and a.country = b.country and a.datayear = b.datayear 
and a.datatype in ('ACTUALS - ONLINE','ACTUALS - RETAIL') );

update executive_summary a1
set month01 = (
select case b.month12 when 0 then null else 1-(a.month01/b.month12) end 
from executive_summary a ,executive_summary b 
where a.datatype = b.datatype and a.items = 'Database' and b.items = 'UAP' 
and a.country = b.country 
and a.datayear ='2015' 
and b.datayear ='2014'
and a.datatype in ('ACTUALS - ONLINE','ACTUALS - RETAIL') 
and a.datatype = a1.datatype)
where datatype in ('ACTUALS - ONLINE','ACTUALS - RETAIL') 
and items= 'Player Churn Rate'
and datayear ='2015';
--------------------------------------------------------------------------------


------------------------------------------------------------
------------Online Bonus Cost
insert into executive_summary (
select OBC.country,OBC.datayear, OAPD.datatype,'Online Bonus Cost' items, '052' source,
case (RAPD.month01+OAPD.month01) when 0 then null else OBC.month01 * (OAPD.month01 / (RAPD.month01+OAPD.month01)) end month01,
case (RAPD.month02+OAPD.month02) when 0 then null else OBC.month02 * (OAPD.month02 / (RAPD.month02+OAPD.month02)) end month02,
case (RAPD.month03+OAPD.month03) when 0 then null else OBC.month03 * (OAPD.month03 / (RAPD.month03+OAPD.month03)) end month03,
case (RAPD.month04+OAPD.month04) when 0 then null else OBC.month04 * (OAPD.month04 / (RAPD.month04+OAPD.month04)) end month04,
case (RAPD.month05+OAPD.month05) when 0 then null else OBC.month05 * (OAPD.month05 / (RAPD.month05+OAPD.month05)) end month05,
case (RAPD.month06+OAPD.month06) when 0 then null else OBC.month06 * (OAPD.month06 / (RAPD.month06+OAPD.month06)) end month06,
case (RAPD.month07+OAPD.month07) when 0 then null else OBC.month07 * (OAPD.month07 / (RAPD.month07+OAPD.month07)) end month07,
case (RAPD.month08+OAPD.month08) when 0 then null else OBC.month08 * (OAPD.month08 / (RAPD.month08+OAPD.month08)) end month08,
case (RAPD.month09+OAPD.month09) when 0 then null else OBC.month09 * (OAPD.month09 / (RAPD.month09+OAPD.month09)) end month09,
case (RAPD.month10+OAPD.month10) when 0 then null else OBC.month10 * (OAPD.month10 / (RAPD.month10+OAPD.month10)) end month10,
case (RAPD.month11+OAPD.month11) when 0 then null else OBC.month11 * (OAPD.month11 / (RAPD.month11+OAPD.month11)) end month11,
case (RAPD.month12+OAPD.month12) when 0 then null else OBC.month12 * (OAPD.month12 / (RAPD.month12+OAPD.month12)) end month12,
null src, null fy from 
(select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - RETAIL' and a.items ='APD') RAPD,
(select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - ONLINE' and a.items ='APD') OAPD,
(select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Bonuses Total (PL_150_03_00)') OBC
where RAPD.items = OAPD.items and RAPD.country = OAPD.country and RAPD.datayear = OAPD.datayear
                              and RAPD.country = OBC.country  and RAPD.datayear = OBC.datayear
);



----ONLINE Web Net Gross Win Margins
insert into executive_summary (
select stk.country,stk.datayear, stk.datatype,'Web Net Gross Win Margins' items, '053' source,
case when apd.month01=0 then null else stk.month01 / apd.month01 end month01, 
case when apd.month02=0 then null else stk.month02 / apd.month02 end month02, 
case when apd.month03=0 then null else stk.month03 / apd.month03 end month03, 
case when apd.month04=0 then null else stk.month04 / apd.month04 end month04, 
case when apd.month05=0 then null else stk.month05 / apd.month05 end month05, 
case when apd.month06=0 then null else stk.month06 / apd.month06 end month06, 
case when apd.month07=0 then null else stk.month07 / apd.month07 end month07, 
case when apd.month08=0 then null else stk.month08 / apd.month08 end month08, 
case when apd.month09=0 then null else stk.month09 / apd.month09 end month09, 
case when apd.month10=0 then null else stk.month10 / apd.month10 end month10, 
case when apd.month11=0 then null else stk.month11 / apd.month11 end month11, 
case when apd.month12=0 then null else stk.month12 / apd.month12 end month12,
null src, null fy from (
select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype='ACTUALS - ONLINE' and a.items='Web NGW') Stk,
(select 4 seq,a.country,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12, a.datayear
from executive_summary a where a.datatype = 'ACTUALS - ONLINE' and a.items ='Web Stake') apd
where stk.datatype = apd.datatype and stk.country = apd.country and stk.datayear = apd.datayear);


----ONLINE  Mobile Net Gross Win Margins
insert into executive_summary (
select stk.country,stk.datayear, stk.datatype,'Mobile Net Gross Win Margins' items, '054' source,
case when apd.month01=0 then null else stk.month01 / apd.month01 end month01, 
case when apd.month02=0 then null else stk.month02 / apd.month02 end month02, 
case when apd.month03=0 then null else stk.month03 / apd.month03 end month03, 
case when apd.month04=0 then null else stk.month04 / apd.month04 end month04, 
case when apd.month05=0 then null else stk.month05 / apd.month05 end month05, 
case when apd.month06=0 then null else stk.month06 / apd.month06 end month06, 
case when apd.month07=0 then null else stk.month07 / apd.month07 end month07, 
case when apd.month08=0 then null else stk.month08 / apd.month08 end month08, 
case when apd.month09=0 then null else stk.month09 / apd.month09 end month09, 
case when apd.month10=0 then null else stk.month10 / apd.month10 end month10, 
case when apd.month11=0 then null else stk.month11 / apd.month11 end month11, 
case when apd.month12=0 then null else stk.month12 / apd.month12 end month12,
null src, null fy from (
select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype='ACTUALS - ONLINE' and a.items='Mobile NGW') Stk,
(select 4 seq,a.country,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12, a.datayear
from executive_summary a where a.datatype = 'ACTUALS - ONLINE' and a.items ='Mobile Stake') apd
where stk.datatype = apd.datatype and stk.country = apd.country and stk.datayear = apd.datayear);


insert into executive_summary (
select 
OAPD.country,OAPD.datayear, TAP.datatype,'Multi Channel Index' items, '055' source,
case TAP.month01 when 0 then null else (OAPD.month01 + WAP.month01 + MAPD.month01) / TAP.month01 end month01,
case TAP.month02 when 0 then null else (OAPD.month02 + WAP.month02 + MAPD.month02) / TAP.month02 end month02,
case TAP.month03 when 0 then null else (OAPD.month03 + WAP.month03 + MAPD.month03) / TAP.month03 end month03,
case TAP.month04 when 0 then null else (OAPD.month04 + WAP.month04 + MAPD.month04) / TAP.month04 end month04,
case TAP.month05 when 0 then null else (OAPD.month05 + WAP.month05 + MAPD.month05) / TAP.month05 end month05,
case TAP.month06 when 0 then null else (OAPD.month06 + WAP.month06 + MAPD.month06) / TAP.month06 end month06,
case TAP.month07 when 0 then null else (OAPD.month07 + WAP.month07 + MAPD.month07) / TAP.month07 end month07,
case TAP.month08 when 0 then null else (OAPD.month08 + WAP.month08 + MAPD.month08) / TAP.month08 end month08,
case TAP.month09 when 0 then null else (OAPD.month09 + WAP.month09 + MAPD.month09) / TAP.month09 end month09,
case TAP.month10 when 0 then null else (OAPD.month10 + WAP.month10 + MAPD.month10) / TAP.month10 end month10,
case TAP.month11 when 0 then null else (OAPD.month11 + WAP.month11 + MAPD.month11) / TAP.month11 end month11,
case TAP.month12 when 0 then null else (OAPD.month12 + WAP.month12 + MAPD.month12) / TAP.month12 end month12,
null src, null fy
 from 
(select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Active Player Days') TAP,
(select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - RETAIL' and a.items ='APD') OAPD,
(select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - ONLINE' and a.items ='Web APD') WAP,
(select a.country,a.datayear,a.datatype,a.items, 
a.month01, a.month02, a.month03, a.month04, a.month05, a.month06, 
a.month07, a.month08, a.month09, a.month10, a.month11, a.month12  
from executive_summary a where a.datatype = 'ACTUALS - ONLINE' and a.items ='Mobile APD') MAPD
where 1=1
and WAP.datayear = MAPD.datayear 
and WAP.datayear = TAP.datayear 
and WAP.datayear = OAPD.datayear
and WAP.country = MAPD.country 
and WAP.country = TAP.country
and WAP.country = OAPD.country );





























----overall query
select seq,country,datatype,items,
Dec15, Nov15, Oct15, Sep15, Aug15, Jul15, Jun15, May15, Apr15, Mar15, Feb15, Jan15, 
Dec14, Nov14, Oct14, Sep14, Aug14, Jul14, Jun14, May14, Apr14, Mar14, Feb14, Jan14 from ( 

select 101 seq,a.country,a.datatype,a.items, 
a.month01*1000 Jan15 ,a.month02*1000 Feb15, a.month03*1000 Mar15 ,a.month04*1000 Apr15 ,a.month05*1000 May15, a.month06*1000 Jun15 ,a.month07*1000 Jul15 ,a.month08*1000 Aug15, a.month09*1000 Sep15, a.month10*1000 Oct15 ,a.month11*1000 Nov15 ,a.month12*1000 Dec15 ,
b.month01*1000 Jan14 ,b.month02*1000 Feb14, b.month03*1000 Mar14 ,b.month04*1000 Apr14 ,b.month05*1000 May14, b.month06*1000 Jun14 ,b.month07*1000 Jul14 ,b.month08*1000 Aug14, b.month09*1000 Sep14, b.month10*1000 Oct14 ,b.month11*1000 Nov14 ,b.month12*1000 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Stake amount' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 102 seq,a.country,a.datatype,a.items, 
a.month01*1000  Jan15 ,a.month02*1000  Feb15, a.month03*1000  Mar15 ,a.month04*1000  Apr15 ,a.month05*1000  May15, a.month06*1000  Jun15 ,a.month07*1000  Jul15 ,a.month08*1000  Aug15 ,a.month09*1000  Sep15,a.month10*1000  Oct15 ,a.month11*1000  Nov15 ,a.month12*1000  Dec15 ,
b.month01*1000  Jan14 ,b.month02*1000  Feb14, b.month03*1000  Mar14 ,b.month04*1000  Apr14 ,b.month05*1000  May14, b.month06*1000  Jun14 ,b.month07*1000  Jul14 ,b.month08*1000  Aug14 ,b.month09*1000  Sep14,b.month10*1000  Oct14 ,b.month11*1000  Nov14 ,b.month12*1000  Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Net Gross Win' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 103 seq,a.country,a.datatype,a.items, 
a.month01 Jan15 ,a.month02 Feb15, a.month03 Mar15 ,a.month04 Apr15 ,a.month05 May15, a.month06 Jun15 ,a.month07 Jul15 ,a.month08 Aug15 ,a.month09 Sep15 ,a.month10 Oct15 ,a.month11 Nov15 ,a.month12 Dec15 ,
b.month01 Jan14 ,b.month02 Feb14, b.month03 Mar14 ,b.month04 Apr14 ,b.month05 May14, b.month06 Jun14 ,b.month07 Jul14 ,b.month08 Aug14 ,b.month09 Sep14,b.month10 Oct14 ,b.month11 Nov14 ,b.month12 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Active Players' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 104 seq,a.country,a.datatype,a.items, 
a.month01 Jan15 ,a.month02 Feb15, a.month03 Mar15 ,a.month04 Apr15 ,a.month05 May15, a.month06 Jun15 ,a.month07 Jul15 ,a.month08 Aug15 ,a.month09 Sep15 ,a.month10 Oct15 ,a.month11 Nov15 ,a.month12 Dec15 ,
b.month01 Jan14 ,b.month02 Feb14, b.month03 Mar14 ,b.month04 Apr14 ,b.month05 May14, b.month06 Jun14 ,b.month07 Jul14 ,b.month08 Aug14 ,b.month09 Sep14,b.month10 Oct14 ,b.month11 Nov14 ,b.month12 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Database' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 105 seq,a.country,a.datatype,a.items, 
a.month01 Jan15 ,a.month02 Feb15, a.month03 Mar15 ,a.month04 Apr15 ,a.month05 May15, a.month06 Jun15 ,a.month07 Jul15 ,a.month08 Aug15 ,a.month09 Sep15 ,a.month10 Oct15 ,a.month11 Nov15 ,a.month12 Dec15 ,
b.month01 Jan14 ,b.month02 Feb14, b.month03 Mar14 ,b.month04 Apr14 ,b.month05 May14, b.month06 Jun14 ,b.month07 Jul14 ,b.month08 Aug14 ,b.month09 Sep14,b.month10 Oct14 ,b.month11 Nov14 ,b.month12 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='First Time Depositors' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 106 seq,a.country,a.datatype,a.items, 
a.month01 Jan15 ,a.month02 Feb15, a.month03 Mar15 ,a.month04 Apr15 ,a.month05 May15, a.month06 Jun15 ,a.month07 Jul15 ,a.month08 Aug15 ,a.month09 Sep15 ,a.month10 Oct15 ,a.month11 Nov15 ,a.month12 Dec15 ,
b.month01 Jan14 ,b.month02 Feb14, b.month03 Mar14 ,b.month04 Apr14 ,b.month05 May14, b.month06 Jun14 ,b.month07 Jul14 ,b.month08 Aug14 ,b.month09 Sep14,b.month10 Oct14 ,b.month11 Nov14 ,b.month12 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Active Player Days' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 107 seq,a.country,a.datatype,a.items, 
a.month01*1000 Jan15 ,a.month02*1000 Feb15, a.month03*1000 Mar15 ,a.month04*1000 Apr15 ,a.month05*1000 May15, a.month06*1000 Jun15 ,a.month07*1000 Jul15 ,a.month08*1000 Aug15 ,a.month09*1000 Sep15,a.month10*1000 Oct15 ,a.month11*1000  Nov15 ,a.month12*1000 Dec15 ,
b.month01*1000 Jan14 ,b.month02*1000 Feb14, b.month03*1000 Mar14 ,b.month04*1000 Apr14 ,b.month05*1000 May14, b.month06*1000 Jun14 ,b.month07*1000 Jul14 ,b.month08*1000 Aug14 ,b.month09*1000 Sep14,b.month10*1000 Oct14 ,b.month11*1000  Nov14 ,b.month12*1000 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='NGW per UAP' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 108 seq,a.country,a.datatype,a.items, 
a.month01*1000 Jan15 ,a.month02*1000 Feb15, a.month03*1000 Mar15 ,a.month04*1000 Apr15 ,a.month05*1000 May15, a.month06*1000 Jun15 ,a.month07*1000 Jul15 ,a.month08*1000 Aug15 ,a.month09*1000 Sep15,a.month10*1000 Oct15 ,a.month11*1000 Nov15 ,a.month12*1000 Dec15 ,
b.month01*1000 Jan14 ,b.month02*1000 Feb14, b.month03*1000 Mar14 ,b.month04*1000 Apr14 ,b.month05*1000 May14, b.month06*1000 Jun14 ,b.month07*1000 Jul14 ,b.month08*1000 Aug14 ,b.month09*1000 Sep14,b.month10*1000 Oct14 ,b.month11*1000 Nov14 ,b.month12*1000 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Stake per APD' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 109 seq,a.country,a.datatype,a.items, 
a.month01 Jan15 ,a.month02 Feb15, a.month03 Mar15 ,a.month04 Apr15 ,a.month05 May15, a.month06 Jun15 ,a.month07 Jul15 ,a.month08 Aug15 ,a.month09 Sep15 ,a.month10 Oct15 ,a.month11 Nov15 ,a.month12 Dec15 ,
b.month01 Jan14 ,b.month02 Feb14, b.month03 Mar14 ,b.month04 Apr14 ,b.month05 May14, b.month06 Jun14 ,b.month07 Jul14 ,b.month08 Aug14 ,b.month09 Sep14,b.month10 Oct14 ,b.month11 Nov14 ,b.month12 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='NGW Margin' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 110 seq,a.country,a.datatype,a.items, 
a.month01*1000 Jan15 ,a.month02*1000 Feb15, a.month03*1000 Mar15 ,a.month04*1000 Apr15 ,a.month05*1000 May15, a.month06*1000 Jun15 ,a.month07*1000 Jul15 ,a.month08*1000 Aug15 ,a.month09*1000 Sep15,a.month10*1000 Oct15 ,a.month11*1000 Nov15 ,a.month12*1000 Dec15 ,
b.month01*1000 Jan14 ,b.month02*1000 Feb14, b.month03*1000 Mar14 ,b.month04*1000 Apr14 ,b.month05*1000 May14, b.month06*1000 Jun14 ,b.month07*1000 Jul14 ,b.month08*1000 Aug14 ,b.month09*1000 Sep14,b.month10*1000 Oct14 ,b.month11*1000 Nov14 ,b.month12*1000 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Player Yeild' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 111 seq,a.country,a.datatype,a.items, 
a.month01 Jan15 ,a.month02 Feb15, a.month03 Mar15 ,a.month04 Apr15 ,a.month05 May15, a.month06 Jun15 ,a.month07 Jul15 ,a.month08 Aug15 ,a.month09 Sep15,a.month10 Oct15 ,a.month11 Nov15 ,a.month12 Dec15 ,
b.month01 Jan14 ,b.month02 Feb14, b.month03 Mar14 ,b.month04 Apr14 ,b.month05 May14, b.month06 Jun14 ,b.month07 Jul14 ,b.month08 Aug14 ,b.month09 Sep14,b.month10 Oct14 ,b.month11 Nov14 ,b.month12 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Player Churn Rate' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 112 seq,a.country,a.datatype,'Frequency' items, 
a.month01 Jan15 ,a.month02 Feb15, a.month03 Mar15 ,a.month04 Apr15 ,a.month05 May15, a.month06 Jun15 ,a.month07 Jul15 ,a.month08 Aug15 ,a.month09 Sep15 ,a.month10 Oct15 ,a.month11 Nov15 ,a.month12 Dec15 ,
b.month01 Jan14 ,b.month02 Feb14, b.month03 Mar14 ,b.month04 Apr14 ,b.month05 May14, b.month06 Jun14 ,b.month07 Jul14 ,b.month08 Aug14 ,b.month09 Sep14,b.month10 Oct14 ,b.month11 Nov14 ,b.month12 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Frequency' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 113 seq,a.country,a.datatype,a.items items, 
a.month01 Jan15 ,a.month02 Feb15, a.month03 Mar15 ,a.month04 Apr15 ,a.month05 May15, a.month06 Jun15 ,a.month07 Jul15 ,a.month08 Aug15 ,a.month09 Sep15 ,a.month10 Oct15 ,a.month11 Nov15 ,a.month12 Dec15 ,
b.month01 Jan14 ,b.month02 Feb14, b.month03 Mar14 ,b.month04 Apr14 ,b.month05 May14, b.month06 Jun14 ,b.month07 Jul14 ,b.month08 Aug14 ,b.month09 Sep14,b.month10 Oct14 ,b.month11 Nov14 ,b.month12 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Multi Channel Index' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 114 seq,a.country,a.datatype,'Overall Bonus Cost' items, 
a.month01*1000 Jan15 ,a.month02*1000 Feb15, a.month03*1000 Mar15 ,a.month04*1000 Apr15 ,a.month05*1000 May15, a.month06*1000 Jun15 ,a.month07*1000 Jul15 ,a.month08*1000 Aug15 ,a.month09*1000 Sep15,a.month10*1000 Oct15 ,a.month11*1000 Nov15 ,a.month12*1000 Dec15 ,
b.month01*1000 Jan14 ,b.month02*1000 Feb14, b.month03*1000 Mar14 ,b.month04*1000 Apr14 ,b.month05*1000 May14, b.month06*1000 Jun14 ,b.month07*1000 Jul14 ,b.month08*1000 Aug14 ,b.month09*1000 Sep14,b.month10*1000 Oct14 ,b.month11*1000 Nov14 ,b.month12*1000 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Bonuses Total (PL_150_03_00)' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 115 seq,a.country,a.datatype,a.items items, 
a.month01 Jan15 ,a.month02 Feb15, a.month03 Mar15 ,a.month04 Apr15 ,a.month05 May15, a.month06 Jun15 ,a.month07 Jul15 ,a.month08 Aug15 ,a.month09 Sep15 ,a.month10 Oct15 ,a.month11 Nov15 ,a.month12 Dec15 ,
b.month01 Jan14 ,b.month02 Feb14, b.month03 Mar14 ,b.month04 Apr14 ,b.month05 May14, b.month06 Jun14 ,b.month07 Jul14 ,b.month08 Aug14 ,b.month09 Sep14,b.month10 Oct14 ,b.month11 Nov14 ,b.month12 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Bonus cost % of NGW' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 116 seq,a.country,a.datatype,a.items items, 
a.month01*1000 Jan15 ,a.month02*1000 Feb15, a.month03*1000 Mar15 ,a.month04*1000 Apr15 ,a.month05*1000 May15, a.month06*1000 Jun15 ,a.month07*1000 Jul15 ,a.month08*1000 Aug15 ,a.month09*1000 Sep15,a.month10*1000 Oct15 ,a.month11*1000 Nov15 ,a.month12*1000 Dec15 ,
b.month01*1000 Jan14 ,b.month02*1000 Feb14, b.month03*1000 Mar14 ,b.month04*1000 Apr14 ,b.month05*1000 May14, b.month06*1000 Jun14 ,b.month07*1000 Jul14 ,b.month08*1000 Aug14 ,b.month09*1000 Sep14,b.month10*1000 Oct14 ,b.month11*1000 Nov14 ,b.month12*1000 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Bonus Cost per Active Customer' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 117 seq,a.country,a.datatype,a.items items, 
a.month01 Jan15 ,a.month02 Feb15, a.month03 Mar15 ,a.month04 Apr15 ,a.month05 May15, a.month06 Jun15 ,a.month07 Jul15 ,a.month08 Aug15 ,a.month09 Sep15 ,a.month10 Oct15 ,a.month11 Nov15 ,a.month12 Dec15 ,
b.month01 Jan14 ,b.month02 Feb14, b.month03 Mar14 ,b.month04 Apr14 ,b.month05 May14, b.month06 Jun14 ,b.month07 Jul14 ,b.month08 Aug14 ,b.month09 Sep14,b.month10 Oct14 ,b.month11 Nov14 ,b.month12 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Aquisition % of Total Bonus' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 118 seq,a.country,a.datatype,a.items items, 
a.month01 Jan15 ,a.month02 Feb15, a.month03 Mar15 ,a.month04 Apr15 ,a.month05 May15, a.month06 Jun15 ,a.month07 Jul15 ,a.month08 Aug15 ,a.month09 Sep15 ,a.month10 Oct15 ,a.month11 Nov15 ,a.month12 Dec15 ,
b.month01 Jan14 ,b.month02 Feb14, b.month03 Mar14 ,b.month04 Apr14 ,b.month05 May14, b.month06 Jun14 ,b.month07 Jul14 ,b.month08 Aug14 ,b.month09 Sep14,b.month10 Oct14 ,b.month11 Nov14 ,b.month12 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Retention % of Total Bonus' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 119 seq,a.country,a.datatype,'Overall Marketing Spent' items, 
a.month01*1000 Jan15 ,a.month02*1000 Feb15, a.month03*1000 Mar15 ,a.month04*1000 Apr15 ,a.month05*1000 May15, a.month06*1000 Jun15 ,a.month07*1000 Jul15 ,a.month08*1000 Aug15 ,a.month09*1000 Sep15,a.month10*1000 Oct15 ,a.month11*1000 Nov15 ,a.month12*1000 Dec15 ,
b.month01*1000 Jan14 ,b.month02*1000 Feb14, b.month03*1000 Mar14 ,b.month04*1000 Apr14 ,b.month05*1000 May14, b.month06*1000 Jun14 ,b.month07*1000 Jul14 ,b.month08*1000 Aug14 ,b.month09*1000 Sep14,b.month10*1000 Oct14 ,b.month11*1000 Nov14 ,b.month12*1000 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Marketing (PL_250_04)' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 120 seq,a.country,a.datatype,a.items items, 
a.month01*1000 Jan15 ,a.month02*1000 Feb15, a.month03*1000 Mar15 ,a.month04*1000 Apr15 ,a.month05*1000 May15, a.month06*1000 Jun15 ,a.month07*1000 Jul15 ,a.month08*1000 Aug15 ,a.month09*1000 Sep15,a.month10*1000 Oct15 ,a.month11*1000 Nov15 ,a.month12*1000 Dec15 ,
b.month01*1000 Jan14 ,b.month02*1000 Feb14, b.month03*1000 Mar14 ,b.month04*1000 Apr14 ,b.month05*1000 May14, b.month06*1000 Jun14 ,b.month07*1000 Jul14 ,b.month08*1000 Aug14 ,b.month09*1000 Sep14,b.month10*1000 Oct14 ,b.month11*1000 Nov14 ,b.month12*1000 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Marketing Spent Non Affiliates' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 121 seq,a.country,a.datatype,'Marketing Spent Affiliates' items, 
a.month01*1000 Jan15 ,a.month02*1000 Feb15, a.month03*1000 Mar15 ,a.month04*1000 Apr15 ,a.month05*1000 May15, a.month06*1000 Jun15 ,a.month07*1000 Jul15 ,a.month08*1000 Aug15 ,a.month09*1000 Sep15,a.month10*1000 Oct15 ,a.month11*1000 Nov15 ,a.month12*1000 Dec15 ,
b.month01*1000 Jan14 ,b.month02*1000 Feb14, b.month03*1000 Mar14 ,b.month04*1000 Apr14 ,b.month05*1000 May14, b.month06*1000 Jun14 ,b.month07*1000 Jul14 ,b.month08*1000 Aug14 ,b.month09*1000 Sep14,b.month10*1000 Oct14 ,b.month11*1000 Nov14 ,b.month12*1000 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Affiliate marketing' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 122 seq,a.country,a.datatype,a.items items, 
a.month01 Jan15 ,a.month02 Feb15, a.month03 Mar15 ,a.month04 Apr15 ,a.month05 May15, a.month06 Jun15 ,a.month07 Jul15 ,a.month08 Aug15 ,a.month09 Sep15 ,a.month10 Oct15 ,a.month11 Nov15 ,a.month12 Dec15 ,
b.month01 Jan14 ,b.month02 Feb14, b.month03 Mar14 ,b.month04 Apr14 ,b.month05 May14, b.month06 Jun14 ,b.month07 Jul14 ,b.month08 Aug14 ,b.month09 Sep14,b.month10 Oct14 ,b.month11 Nov14 ,b.month12 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Affiliates Cost as % of NGW' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 123 seq,a.country,a.datatype,a.items items, 
a.month01*1000 Jan15 ,a.month02*1000 Feb15, a.month03*1000 Mar15 ,a.month04*1000 Apr15 ,a.month05*1000 May15, a.month06*1000 Jun15 ,a.month07*1000 Jul15 ,a.month08*1000 Aug15 ,a.month09*1000 Sep15,a.month10*1000 Oct15, a.month11*1000 Nov15 ,a.month12*1000 Dec15 ,
b.month01*1000 Jan14 ,b.month02*1000 Feb14, b.month03*1000 Mar14 ,b.month04*1000 Apr14 ,b.month05*1000 May14, b.month06*1000 Jun14 ,b.month07*1000 Jul14 ,b.month08*1000 Aug14 ,b.month09*1000 Sep14,b.month10*1000 Oct14, b.month11*1000 Nov14 ,b.month12*1000 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - TOTAL BUSINESS' and a.items ='Average cost per acquisition (CPA)' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 124 seq,'--','ACTUALS - TOTAL BUSINESS','PV to CPA ratio (24 months value)', 
null Jan15 ,null Feb15, null Mar15 ,null Apr15 ,null May15, null Jun15 ,null Jul15 ,null Aug15 ,null Sep15,null Oct15 ,null Nov15 ,null Dec15 ,
null Jan14 ,null Feb14, null Mar14 ,null Apr14 ,null May14, null Jun14 ,null Jul14 ,null Aug14 ,null Sep14,null Oct14 ,null Nov14 ,null Dec14 
union
select 125 seq,'--','ACTUALS - TOTAL BUSINESS','Player Value M1', 
null Jan15 ,null Feb15, null Mar15 ,null Apr15 ,null May15, null Jun15 ,null Jul15 ,null Aug15 ,null Sep15,null Oct15 ,null Nov15 ,null Dec15 ,
null Jan14 ,null Feb14, null Mar14 ,null Apr14 ,null May14, null Jun14 ,null Jul14 ,null Aug14 ,null Sep14,null Oct14 ,null Nov14 ,null Dec14 
union
select 126 seq,'--','ACTUALS - TOTAL BUSINESS','Player Value M3', 
null Jan15 ,null Feb15, null Mar15 ,null Apr15 ,null May15, null Jun15 ,null Jul15 ,null Aug15 ,null Sep15,null Oct15 ,null Nov15 ,null Dec15 ,
null Jan14 ,null Feb14, null Mar14 ,null Apr14 ,null May14, null Jun14 ,null Jul14 ,null Aug14 ,null Sep14,null Oct14 ,null Nov14 ,null Dec14 
union
select 127 seq,'--','ACTUALS - TOTAL BUSINESS','Player Value M6', 
null Jan15 ,null Feb15, null Mar15 ,null Apr15 ,null May15, null Jun15 ,null Jul15 ,null Aug15 ,null Sep15,null Oct15 ,null Nov15 ,null Dec15 ,
null Jan14 ,null Feb14, null Mar14 ,null Apr14 ,null May14, null Jun14 ,null Jul14 ,null Aug14 ,null Sep14,null Oct14 ,null Nov14 ,null Dec14 
union
select 128 seq,'--','ACTUALS - TOTAL BUSINESS','Player Value M12', 
null Jan15 ,null Feb15, null Mar15 ,null Apr15 ,null May15, null Jun15 ,null Jul15 ,null Aug15 ,null Sep15,null Oct15 ,null Nov15 ,null Dec15 ,
null Jan14 ,null Feb14, null Mar14 ,null Apr14 ,null May14, null Jun14 ,null Jul14 ,null Aug14 ,null Sep14,null Oct14 ,null Nov14 ,null Dec14 
union
select 129 seq,'--','ACTUALS - TOTAL BUSINESS','Player Value M24', 
null Jan15 ,null Feb15, null Mar15 ,null Apr15 ,null May15, null Jun15 ,null Jul15 ,null Aug15 ,null Sep15,null Oct15 ,null Nov15 ,null Dec15 ,
null Jan14 ,null Feb14, null Mar14 ,null Apr14 ,null May14, null Jun14 ,null Jul14 ,null Aug14 ,null Sep14,null Oct14 ,null Nov14 ,null Dec14 
union
select 130 seq,'--','ACTUALS - TOTAL BUSINESS','M3 Retention Rate', 
null Jan15 ,null Feb15, null Mar15 ,null Apr15 ,null May15, null Jun15 ,null Jul15 ,null Aug15 ,null Sep15,null Oct15 ,null Nov15 ,null Dec15 ,
null Jan14 ,null Feb14, null Mar14 ,null Apr14 ,null May14, null Jun14 ,null Jul14 ,null Aug14 ,null Sep14,null Oct14 ,null Nov14 ,null Dec14 
union
select 131 seq,'--','ACTUALS - TOTAL BUSINESS','M6 Retention Rate', 
null Jan15 ,null Feb15, null Mar15 ,null Apr15 ,null May15, null Jun15 ,null Jul15 ,null Aug15 ,null Sep15,null Oct15 ,null Nov15 ,null Dec15 ,
null Jan14 ,null Feb14, null Mar14 ,null Apr14 ,null May14, null Jun14 ,null Jul14 ,null Aug14 ,null Sep14,null Oct14 ,null Nov14 ,null Dec14 
union
select 132 seq,'--','ACTUALS - TOTAL BUSINESS','M12 Retention Rate', 
null Jan15 ,null Feb15, null Mar15 ,null Apr15 ,null May15, null Jun15 ,null Jul15 ,null Aug15 ,null Sep15,null Oct15 ,null Nov15 ,null Dec15 ,
null Jan14 ,null Feb14, null Mar14 ,null Apr14 ,null May14, null Jun14 ,null Jul14 ,null Aug14 ,null Sep14,null Oct14 ,null Nov14 ,null Dec14 
union
select 133 seq,'--','ACTUALS - TOTAL BUSINESS','M24 Retention Rate', 
null Jan15 ,null Feb15, null Mar15 ,null Apr15 ,null May15, null Jun15 ,null Jul15 ,null Aug15 ,null Sep15,null Oct15 ,null Nov15 ,null Dec15 ,
null Jan14 ,null Feb14, null Mar14 ,null Apr14 ,null May14, null Jun14 ,null Jul14 ,null Aug14 ,null Sep14,null Oct14 ,null Nov14 ,null Dec14 

union
select 201 seq,a.country,a.datatype,a.items items, 
a.month01*1000 Jan15 ,a.month02*1000 Feb15, a.month03*1000 Mar15 ,a.month04*1000 Apr15 ,a.month05*1000 May15, a.month06*1000 Jun15 ,a.month07*1000 Jul15 ,a.month08*1000 Aug15 ,a.month09*1000 Sep15, a.month10*1000 Oct15 ,a.month11*1000 Nov15 ,a.month12*1000 Dec15 ,
b.month01*1000 Jan14 ,b.month02*1000 Feb14, b.month03*1000 Mar14 ,b.month04*1000 Apr14 ,b.month05*1000 May14, b.month06*1000 Jun14 ,b.month07*1000 Jul14 ,b.month08*1000 Aug14 ,b.month09*1000 Sep14, b.month10*1000 Oct14 ,b.month11*1000 Nov14 ,b.month12*1000 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - RETAIL' and a.items ='Stake amount' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 202 seq,a.country,a.datatype,a.items items, 
a.month01*1000 Jan15 ,a.month02*1000 Feb15, a.month03*1000 Mar15 ,a.month04*1000 Apr15 ,a.month05*1000 May15, a.month06*1000 Jun15 ,a.month07*1000 Jul15 ,a.month08*1000 Aug15 ,a.month09*1000 Sep15, a.month10*1000 Oct15 ,a.month11*1000 Nov15 ,a.month12*1000 Dec15 ,
b.month01*1000 Jan14 ,b.month02*1000 Feb14, b.month03*1000 Mar14 ,b.month04*1000 Apr14 ,b.month05*1000 May14, b.month06*1000 Jun14 ,b.month07*1000 Jul14 ,b.month08*1000 Aug14 ,b.month09*1000 Sep14, b.month10*1000 Oct14 ,b.month11*1000 Nov14 ,b.month12*1000 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - RETAIL' and a.items ='Net Gross Win' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 203 seq,a.country,a.datatype,a.items items, 
a.month01 Jan15 ,a.month02 Feb15, a.month03 Mar15 ,a.month04 Apr15 ,a.month05 May15, a.month06 Jun15 ,a.month07 Jul15 ,a.month08 Aug15 ,a.month09 Sep15 ,a.month10 Oct15 ,a.month11 Nov15 ,a.month12 Dec15 ,
b.month01 Jan14 ,b.month02 Feb14, b.month03 Mar14 ,b.month04 Apr14 ,b.month05 May14, b.month06 Jun14 ,b.month07 Jul14 ,b.month08 Aug14 ,b.month09 Sep14,b.month10 Oct14 ,b.month11 Nov14 ,b.month12 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - RETAIL' and a.items ='UAP' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 204 seq,a.country,a.datatype,a.items items, 
a.month01 Jan15 ,a.month02 Feb15, a.month03 Mar15 ,a.month04 Apr15 ,a.month05 May15, a.month06 Jun15 ,a.month07 Jul15 ,a.month08 Aug15 ,a.month09 Sep15 ,a.month10 Oct15 ,a.month11 Nov15 ,a.month12 Dec15 ,
b.month01 Jan14 ,b.month02 Feb14, b.month03 Mar14 ,b.month04 Apr14 ,b.month05 May14, b.month06 Jun14 ,b.month07 Jul14 ,b.month08 Aug14 ,b.month09 Sep14,b.month10 Oct14 ,b.month11 Nov14 ,b.month12 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - RETAIL' and a.items ='Database' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 205 seq,a.country,a.datatype,'Retail First Time Depositors' items, 
a.month01 Jan15 ,a.month02 Feb15, a.month03 Mar15 ,a.month04 Apr15 ,a.month05 May15, a.month06 Jun15 ,a.month07 Jul15 ,a.month08 Aug15 ,a.month09 Sep15 ,a.month10 Oct15 ,a.month11 Nov15 ,a.month12 Dec15 ,
b.month01 Jan14 ,b.month02 Feb14, b.month03 Mar14 ,b.month04 Apr14 ,b.month05 May14, b.month06 Jun14 ,b.month07 Jul14 ,b.month08 Aug14 ,b.month09 Sep14,b.month10 Oct14 ,b.month11 Nov14 ,b.month12 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - RETAIL' and a.items ='FTD' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 206 seq,a.country,a.datatype,'Retail Active Player Days' items, 
a.month01 Jan15 ,a.month02 Feb15, a.month03 Mar15 ,a.month04 Apr15 ,a.month05 May15, a.month06 Jun15 ,a.month07 Jul15 ,a.month08 Aug15 ,a.month09 Sep15 ,a.month10 Oct15 ,a.month11 Nov15 ,a.month12 Dec15 ,
b.month01 Jan14 ,b.month02 Feb14, b.month03 Mar14 ,b.month04 Apr14 ,b.month05 May14, b.month06 Jun14 ,b.month07 Jul14 ,b.month08 Aug14 ,b.month09 Sep14,b.month10 Oct14 ,b.month11 Nov14 ,b.month12 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - RETAIL' and a.items ='APD' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 207 seq,a.country,a.datatype,a.items items, 
a.month01*1000 Jan15 ,a.month02*1000 Feb15, a.month03*1000 Mar15 ,a.month04*1000 Apr15 ,a.month05*1000 May15, a.month06*1000 Jun15 ,a.month07*1000 Jul15 ,a.month08*1000 Aug15 ,a.month09*1000 Sep15 ,a.month10*1000 Oct15 ,a.month11*1000 Nov15 ,a.month12*1000 Dec15 ,
b.month01*1000 Jan14 ,b.month02*1000 Feb14, b.month03*1000 Mar14 ,b.month04*1000 Apr14 ,b.month05*1000 May14, b.month06*1000 Jun14 ,b.month07*1000 Jul14 ,b.month08*1000 Aug14 ,b.month09*1000 Sep14,b.month10*1000 Oct14 ,b.month11*1000 Nov14 ,b.month12*1000 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - RETAIL' and a.items ='Retail Net Gross Win per Unique active customer/player' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 208 seq,a.country,a.datatype,a.items items, 
a.month01*1000 Jan15 ,a.month02*1000 Feb15, a.month03*1000 Mar15 ,a.month04*1000 Apr15 ,a.month05*1000 May15, a.month06*1000 Jun15 ,a.month07*1000 Jul15 ,a.month08*1000 Aug15 ,a.month09*1000 Sep15 ,a.month10*1000 Oct15 ,a.month11*1000 Nov15 ,a.month12*1000 Dec15 ,
b.month01*1000 Jan14 ,b.month02*1000 Feb14, b.month03*1000 Mar14 ,b.month04*1000 Apr14 ,b.month05*1000 May14, b.month06*1000 Jun14 ,b.month07*1000 Jul14 ,b.month08*1000 Aug14 ,b.month09*1000 Sep14, b.month10*1000 Oct14 ,b.month11*1000 Nov14 ,b.month12*1000 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - RETAIL' and a.items ='Retail Stake amount per active player days' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 209 seq,a.country,a.datatype, 'Retail Net gross win margin' items, 
a.month01 Jan15 ,a.month02 Feb15, a.month03 Mar15 ,a.month04 Apr15 ,a.month05 May15, a.month06 Jun15 ,a.month07 Jul15 ,a.month08 Aug15 ,a.month09 Sep15,a.month10 Oct15 ,a.month11 Nov15 ,a.month12 Dec15 ,
b.month01 Jan14 ,b.month02 Feb14, b.month03 Mar14 ,b.month04 Apr14 ,b.month05 May14, b.month06 Jun14 ,b.month07 Jul14 ,b.month08 Aug14 ,b.month09 Sep14,b.month10 Oct14 ,b.month11 Nov14 ,b.month12 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - RETAIL' and a.items ='Retail NGW Margin' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 210 seq,a.country,a.datatype,'Retail Player Yield per Active Player' items, 
a.month01*1000 Jan15 ,a.month02*1000 Feb15, a.month03*1000 Mar15 ,a.month04*1000 Apr15 ,a.month05*1000 May15, a.month06*1000 Jun15 ,a.month07*1000 Jul15 ,a.month08*1000 Aug15 ,a.month09*1000 Sep15 ,a.month10*1000 Oct15 ,a.month11*1000 Nov15 ,a.month12*1000 Dec15 ,
b.month01*1000 Jan14 ,b.month02*1000 Feb14, b.month03*1000 Mar14 ,b.month04*1000 Apr14 ,b.month05*1000 May14, b.month06*1000 Jun14 ,b.month07*1000 Jul14 ,b.month08*1000 Aug14 ,b.month09*1000 Sep14, b.month10*1000 Oct14 ,b.month11*1000 Nov14 ,b.month12*1000 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - RETAIL' and a.items ='Player Yeild per UAP' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 211 seq,a.country,a.datatype,'Retail Player Churn Rate' items, 
a.month01 Jan15 ,a.month02 Feb15, a.month03 Mar15 ,a.month04 Apr15 ,a.month05 May15, a.month06 Jun15 ,a.month07 Jul15 ,a.month08 Aug15 ,a.month09 Sep15 ,a.month10 Oct15 ,a.month11 Nov15 ,a.month12 Dec15 ,
b.month01 Jan14 ,b.month02 Feb14, b.month03 Mar14 ,b.month04 Apr14 ,b.month05 May14, b.month06 Jun14 ,b.month07 Jul14 ,b.month08 Aug14 ,b.month09 Sep14,b.month10 Oct14 ,b.month11 Nov14 ,b.month12 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - RETAIL' and a.items ='Player Churn Rate' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 212 seq,a.country,a.datatype,'Retail Stake amount anonymous customers' items, 
a.month01*1000 Jan15 ,a.month02*1000 Feb15, a.month03*1000 Mar15 ,a.month04*1000 Apr15 ,a.month05*1000 May15, a.month06*1000 Jun15 ,a.month07*1000 Jul15 ,a.month08*1000 Aug15 ,a.month09*1000 Sep15, a.month10*1000 Oct15 ,a.month11*1000 Nov15 ,a.month12*1000 Dec15 ,
b.month01*1000 Jan14 ,b.month02*1000 Feb14, b.month03*1000 Mar14 ,b.month04*1000 Apr14 ,b.month05*1000 May14, b.month06*1000 Jun14 ,b.month07*1000 Jul14 ,b.month08*1000 Aug14 ,b.month09*1000 Sep14, b.month10*1000 Oct14 ,b.month11*1000 Nov14 ,b.month12*1000 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - RETAIL' and a.items ='Stake amount anonymous customers' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 213 seq,a.country,a.datatype,'Retail Stake amount known customers' items, 
a.month01*1000 Jan15 ,a.month02*1000 Feb15, a.month03*1000 Mar15 ,a.month04*1000 Apr15 ,a.month05*1000 May15, a.month06*1000 Jun15 ,a.month07*1000 Jul15 ,a.month08*1000 Aug15 ,a.month09*1000 Sep15 ,a.month10*1000 Oct15 ,a.month11*1000 Nov15 ,a.month12*1000 Dec15 ,
b.month01*1000 Jan14 ,b.month02*1000 Feb14, b.month03*1000 Mar14 ,b.month04*1000 Apr14 ,b.month05*1000 May14, b.month06*1000 Jun14 ,b.month07*1000 Jul14 ,b.month08*1000 Aug14 ,b.month09*1000 Sep14,b.month10*1000 Oct14 ,b.month11*1000 Nov14 ,b.month12*1000 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - RETAIL' and a.items ='Stake amount known customers' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 214 seq,a.country,a.datatype, 'Retail Stake Amount Share' items, 
a.month01 Jan15 ,a.month02 Feb15, a.month03 Mar15 ,a.month04 Apr15 ,a.month05 May15, a.month06 Jun15 ,a.month07 Jul15 ,a.month08 Aug15 ,a.month09 Sep15,a.month10 Oct15 ,a.month11 Nov15 ,a.month12 Dec15 ,
b.month01 Jan14 ,b.month02 Feb14, b.month03 Mar14 ,b.month04 Apr14 ,b.month05 May14, b.month06 Jun14 ,b.month07 Jul14 ,b.month08 Aug14 ,b.month09 Sep14,b.month10 Oct14 ,b.month11 Nov14 ,b.month12 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - RETAIL' and a.items ='Retail Stake Share' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 215 seq,a.country,a.datatype, 'Retail Anonymous player stake share' items, 
a.month01 Jan15 ,a.month02 Feb15, a.month03 Mar15 ,a.month04 Apr15 ,a.month05 May15, a.month06 Jun15 ,a.month07 Jul15 ,a.month08 Aug15 ,a.month09 Sep15,a.month10 Oct15 ,a.month11 Nov15 ,a.month12 Dec15 ,
b.month01 Jan14 ,b.month02 Feb14, b.month03 Mar14 ,b.month04 Apr14 ,b.month05 May14, b.month06 Jun14 ,b.month07 Jul14 ,b.month08 Aug14 ,b.month09 Sep14,b.month10 Oct14 ,b.month11 Nov14 ,b.month12 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - RETAIL' and a.items ='Retail Annonymous Stake Share' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 216 seq,a.country,a.datatype, 'Retail Known player stake share' items, 
a.month01 Jan15 ,a.month02 Feb15, a.month03 Mar15 ,a.month04 Apr15 ,a.month05 May15, a.month06 Jun15 ,a.month07 Jul15 ,a.month08 Aug15 ,a.month09 Sep15,a.month10 Oct15 ,a.month11 Nov15 ,a.month12 Dec15 ,
b.month01 Jan14 ,b.month02 Feb14, b.month03 Mar14 ,b.month04 Apr14 ,b.month05 May14, b.month06 Jun14 ,b.month07 Jul14 ,b.month08 Aug14 ,b.month09 Sep14,b.month10 Oct14 ,b.month11 Nov14 ,b.month12 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - RETAIL' and a.items ='Retail Known Stake Share' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 217 seq,'--','ACTUALS - RETAIL','Retail Channel Player values', 
null Jan15 ,null Feb15, null Mar15 ,null Apr15 ,null May15, null Jun15 ,null Jul15 ,null Aug15 ,null Sep15,null Oct15 ,null Nov15 ,null Dec15 ,
null Jan14 ,null Feb14, null Mar14 ,null Apr14 ,null May14, null Jun14 ,null Jul14 ,null Aug14 ,null Sep14,null Oct14 ,null Nov14 ,null Dec14 
union
select 218 seq,a.country,a.datatype, a.items, 
a.month01*1000 Jan15 ,a.month02*1000 Feb15, a.month03*1000 Mar15 ,a.month04*1000 Apr15 ,a.month05*1000 May15, a.month06*1000 Jun15 ,a.month07*1000 Jul15 ,a.month08*1000 Aug15 ,a.month09*1000 Sep15,a.month10*1000 Oct15 ,a.month11*1000 Nov15 ,a.month12*1000 Dec15 ,
b.month01*1000 Jan14 ,b.month02*1000 Feb14, b.month03*1000 Mar14 ,b.month04*1000 Apr14 ,b.month05*1000 May14, b.month06*1000 Jun14 ,b.month07*1000 Jul14 ,b.month08*1000 Aug14 ,b.month09*1000 Sep14,b.month10*1000 Oct14 ,b.month11*1000 Nov14 ,b.month12*1000 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - RETAIL' and a.items ='Retail Marketing Spend' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 219 seq,a.country,a.datatype, a.items, 
a.month01*1000 Jan15 ,a.month02*1000 Feb15, a.month03*1000 Mar15 ,a.month04*1000 Apr15 ,a.month05*1000 May15, a.month06*1000 Jun15 ,a.month07*1000 Jul15 ,a.month08*1000 Aug15 ,a.month09*1000 Sep15,a.month10*1000 Oct15 ,a.month11*1000 Nov15 ,a.month12*1000 Dec15 ,
b.month01*1000 Jan14 ,b.month02*1000 Feb14, b.month03*1000 Mar14 ,b.month04*1000 Apr14 ,b.month05*1000 May14, b.month06*1000 Jun14 ,b.month07*1000 Jul14 ,b.month08*1000 Aug14 ,b.month09*1000 Sep14,b.month10*1000 Oct14 ,b.month11*1000 Nov14 ,b.month12*1000 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - RETAIL' and a.items ='Retail Bonus Cost' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 220 seq,a.country,a.datatype,'Retail Anonymous player gross win amount' items, 
a.month01*1000 Jan15 ,a.month02*1000 Feb15, a.month03*1000 Mar15 ,a.month04*1000 Apr15 ,a.month05*1000 May15, a.month06*1000 Jun15 ,a.month07*1000 Jul15 ,a.month08*1000 Aug15 ,a.month09*1000 Sep15, a.month10*1000 Oct15 ,a.month11*1000 Nov15 ,a.month12*1000 Dec15 ,
b.month01*1000 Jan14 ,b.month02*1000 Feb14, b.month03*1000 Mar14 ,b.month04*1000 Apr14 ,b.month05*1000 May14, b.month06*1000 Jun14 ,b.month07*1000 Jul14 ,b.month08*1000 Aug14 ,b.month09*1000 Sep14, b.month10*1000 Oct14 ,b.month11*1000 Nov14 ,b.month12*1000 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - RETAIL' and a.items ='Gross win anonymous players' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 221 seq,a.country,a.datatype,a.items, 
a.month01*1000 Jan15 ,a.month02*1000 Feb15, a.month03*1000 Mar15 ,a.month04*1000 Apr15 ,a.month05*1000 May15, a.month06*1000 Jun15 ,a.month07*1000 Jul15 ,a.month08*1000 Aug15 ,a.month09*1000 Sep15,a.month10*1000 Oct15 ,a.month11*1000  Nov15 ,a.month12*1000 Dec15 ,
b.month01*1000 Jan14 ,b.month02*1000 Feb14, b.month03*1000 Mar14 ,b.month04*1000 Apr14 ,b.month05*1000 May14, b.month06*1000 Jun14 ,b.month07*1000 Jul14 ,b.month08*1000 Aug14 ,b.month09*1000 Sep14,b.month10*1000 Oct14 ,b.month11*1000  Nov14 ,b.month12*1000 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - RETAIL' and a.items ='Retail Anonymous player Net gross win amount' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 222 seq,a.country,a.datatype,a.items, 
a.month01*1000 Jan15 ,a.month02*1000 Feb15, a.month03*1000 Mar15 ,a.month04*1000 Apr15 ,a.month05*1000 May15, a.month06*1000 Jun15 ,a.month07*1000 Jul15 ,a.month08*1000 Aug15 ,a.month09*1000 Sep15,a.month10*1000 Oct15 ,a.month11*1000  Nov15 ,a.month12*1000 Dec15 ,
b.month01*1000 Jan14 ,b.month02*1000 Feb14, b.month03*1000 Mar14 ,b.month04*1000 Apr14 ,b.month05*1000 May14, b.month06*1000 Jun14 ,b.month07*1000 Jul14 ,b.month08*1000 Aug14 ,b.month09*1000 Sep14,b.month10*1000 Oct14 ,b.month11*1000  Nov14 ,b.month12*1000 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - RETAIL' and a.items ='Retail Known player Net gross win amount' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014

/*union
select 307 seq,a.country,a.datatype, a.items, 
a.month01*1000 Jan15 ,a.month02*1000 Feb15, a.month03*1000 Mar15 ,a.month04*1000 Apr15 ,a.month05*1000 May15, a.month06*1000 Jun15 ,a.month07*1000 Jul15 ,a.month08*1000 Aug15 ,a.month09*1000 Sep15,a.month10*1000 Oct15 ,a.month11*1000 Nov15 ,a.month12*1000 Dec15 ,
b.month01*1000 Jan14 ,b.month02*1000 Feb14, b.month03*1000 Mar14 ,b.month04*1000 Apr14 ,b.month05*1000 May14, b.month06*1000 Jun14 ,b.month07*1000 Jul14 ,b.month08*1000 Aug14 ,b.month09*1000 Sep14,b.month10*1000 Oct14 ,b.month11*1000 Nov14 ,b.month12*1000 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - ONLINE' and a.items ='Net Gross Win' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 308 seq,a.country,a.datatype, a.items, 
a.month01*1000 Jan15 ,a.month02*1000 Feb15, a.month03*1000 Mar15 ,a.month04*1000 Apr15 ,a.month05*1000 May15, a.month06*1000 Jun15 ,a.month07*1000 Jul15 ,a.month08*1000 Aug15 ,a.month09*1000 Sep15,a.month10*1000 Oct15 ,a.month11*1000 Nov15 ,a.month12*1000 Dec15 ,
b.month01*1000 Jan14 ,b.month02*1000 Feb14, b.month03*1000 Mar14 ,b.month04*1000 Apr14 ,b.month05*1000 May14, b.month06*1000 Jun14 ,b.month07*1000 Jul14 ,b.month08*1000 Aug14 ,b.month09*1000 Sep14,b.month10*1000 Oct14 ,b.month11*1000 Nov14 ,b.month12*1000 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - ONLINE' and a.items ='Web NGW' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014

union
select 309 seq,a.country,a.datatype, a.items, 
a.month01*1000 Jan15 ,a.month02*1000 Feb15, a.month03*1000 Mar15 ,a.month04*1000 Apr15 ,a.month05*1000 May15, a.month06*1000 Jun15 ,a.month07*1000 Jul15 ,a.month08*1000 Aug15 ,a.month09*1000 Sep15,a.month10*1000 Oct15 ,a.month11*1000 Nov15 ,a.month12*1000 Dec15 ,
b.month01*1000 Jan14 ,b.month02*1000 Feb14, b.month03*1000 Mar14 ,b.month04*1000 Apr14 ,b.month05*1000 May14, b.month06*1000 Jun14 ,b.month07*1000 Jul14 ,b.month08*1000 Aug14 ,b.month09*1000 Sep14,b.month10*1000 Oct14 ,b.month11*1000 Nov14 ,b.month12*1000 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - ONLINE' and a.items ='Mobile NGW' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
*/

union
select 301 seq,a.country,a.datatype, 'Online Stake Amount' items, 
a.month01*1000 Jan15 ,a.month02*1000 Feb15, a.month03*1000 Mar15 ,a.month04*1000 Apr15 ,a.month05*1000 May15, a.month06*1000 Jun15 ,a.month07*1000 Jul15 ,a.month08*1000 Aug15 ,a.month09*1000 Sep15,a.month10*1000 Oct15 ,a.month11*1000 Nov15 ,a.month12*1000 Dec15 ,
b.month01*1000 Jan14 ,b.month02*1000 Feb14, b.month03*1000 Mar14 ,b.month04*1000 Apr14 ,b.month05*1000 May14, b.month06*1000 Jun14 ,b.month07*1000 Jul14 ,b.month08*1000 Aug14 ,b.month09*1000 Sep14,b.month10*1000 Oct14 ,b.month11*1000 Nov14 ,b.month12*1000 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - ONLINE' and a.items ='Stake amount' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 302 seq,a.country,a.datatype, 'Web Stake amount' items, 
a.month01 Jan15 ,a.month02 Feb15, a.month03 Mar15 ,a.month04 Apr15 ,a.month05  May15, a.month06  Jun15 ,a.month07 Jul15 ,a.month08 Aug15 ,a.month09 Sep15,a.month10 Oct15 ,a.month11 Nov15 ,a.month12 Dec15 ,
b.month01 Jan14 ,b.month02 Feb14, b.month03 Mar14 ,b.month04 Apr14 ,b.month05  May14, b.month06  Jun14 ,b.month07 Jul14 ,b.month08 Aug14 ,b.month09 Sep14,b.month10 Oct14 ,b.month11 Nov14 ,b.month12 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - ONLINE' and a.items ='Web Stake' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 303 seq,a.country,a.datatype, 'Mobile Stake amount' items, 
a.month01 Jan15 ,a.month02 Feb15, a.month03 Mar15 ,a.month04 Apr15 ,a.month05 May15, a.month06 Jun15 ,a.month07 Jul15 ,a.month08 Aug15 ,a.month09 Sep15,a.month10 Oct15 ,a.month11 Nov15 ,a.month12 Dec15 ,
b.month01 Jan14 ,b.month02 Feb14, b.month03 Mar14 ,b.month04 Apr14 ,b.month05 May14, b.month06 Jun14 ,b.month07 Jul14 ,b.month08 Aug14 ,b.month09 Sep14,b.month10 Oct14 ,b.month11 Nov14 ,b.month12 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - ONLINE' and a.items ='Mobile Stake' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 304 seq,a.country,a.datatype, 'Online Stake amount Share' items, 
a.month01 Jan15 ,a.month02 Feb15, a.month03 Mar15 ,a.month04 Apr15 ,a.month05 May15, a.month06 Jun15 ,a.month07 Jul15 ,a.month08 Aug15 ,a.month09 Sep15,a.month10 Oct15 ,a.month11 Nov15 ,a.month12 Dec15 ,
b.month01 Jan14 ,b.month02 Feb14, b.month03 Mar14 ,b.month04 Apr14 ,b.month05 May14, b.month06 Jun14 ,b.month07 Jul14 ,b.month08 Aug14 ,b.month09 Sep14,b.month10 Oct14 ,b.month11 Nov14 ,b.month12 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - ONLINE' and a.items ='Online Stake Share' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014

union
select 305 seq,a.country,a.datatype, 'Web stake amount share' items, 
a.month01/1000 Jan15 ,a.month02/1000 Feb15, a.month03/1000 Mar15 ,a.month04/1000 Apr15 ,a.month05/1000 May15, a.month06/1000 Jun15 ,a.month07/1000 Jul15 ,a.month08/1000 Aug15 ,a.month09/1000 Sep15,a.month10/1000 Oct15 ,a.month11/1000 Nov15 ,a.month12/1000 Dec15 ,
b.month01/1000 Jan14 ,b.month02/1000 Feb14, b.month03/1000 Mar14 ,b.month04/1000 Apr14 ,b.month05/1000 May14, b.month06/1000 Jun14 ,b.month07/1000 Jul14 ,b.month08/1000 Aug14 ,b.month09/1000 Sep14,b.month10/1000 Oct14 ,b.month11/1000 Nov14 ,b.month12/1000 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - ONLINE' and a.items ='Web Stake Share' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014

union
select 306 seq,a.country,a.datatype, 'Mobile Stake amount Share' items, 
a.month01/1000 Jan15 ,a.month02/1000 Feb15, a.month03/1000 Mar15 ,a.month04/1000 Apr15 ,a.month05/1000 May15, a.month06/1000 Jun15 ,a.month07/1000 Jul15 ,a.month08/1000 Aug15 ,a.month09/1000 Sep15,a.month10/1000 Oct15 ,a.month11/1000 Nov15 ,a.month12/1000 Dec15 ,
b.month01/1000 Jan14 ,b.month02/1000 Feb14, b.month03/1000 Mar14 ,b.month04/1000 Apr14 ,b.month05/1000 May14, b.month06/1000 Jun14 ,b.month07/1000 Jul14 ,b.month08/1000 Aug14 ,b.month09/1000 Sep14,b.month10/1000 Oct14 ,b.month11/1000 Nov14 ,b.month12/1000 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - ONLINE' and a.items ='Mobile Stake Share' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014

union
select 307 seq,a.country,a.datatype, 'Online Net Gross Win' items, 
a.month01*1000 Jan15 ,a.month02*1000 Feb15, a.month03*1000 Mar15 ,a.month04*1000 Apr15 ,a.month05*1000 May15, a.month06*1000 Jun15 ,a.month07*1000 Jul15 ,a.month08*1000 Aug15 ,a.month09*1000 Sep15,a.month10*1000 Oct15 ,a.month11*1000 Nov15 ,a.month12*1000 Dec15 ,
b.month01*1000 Jan14 ,b.month02*1000 Feb14, b.month03*1000 Mar14 ,b.month04*1000 Apr14 ,b.month05*1000 May14, b.month06*1000 Jun14 ,b.month07*1000 Jul14 ,b.month08*1000 Aug14 ,b.month09*1000 Sep14,b.month10*1000 Oct14 ,b.month11*1000 Nov14 ,b.month12*1000 Dec14 
from executive_summary a,executive_summary b 
where a.datatype='ACTUALS - ONLINE' and a.items='Net Gross Win' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014

union
select 308 seq,a.country,a.datatype, 'Web Net Gross Win' items, 
a.month01 Jan15 ,a.month02 Feb15, a.month03 Mar15 ,a.month04 Apr15 ,a.month05 May15, a.month06 Jun15 ,a.month07 Jul15 ,a.month08 Aug15 ,a.month09 Sep15,a.month10 Oct15 ,a.month11 Nov15 ,a.month12 Dec15 ,
b.month01 Jan14 ,b.month02 Feb14, b.month03 Mar14 ,b.month04 Apr14 ,b.month05 May14, b.month06 Jun14 ,b.month07 Jul14 ,b.month08 Aug14 ,b.month09 Sep14,b.month10 Oct14 ,b.month11 Nov14 ,b.month12 Dec14 
from executive_summary a,executive_summary b 
where a.datatype='ACTUALS - ONLINE' and a.items='Web NGW' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 309 seq,a.country,a.datatype, 'Mobile Net Gross Win' items, 
a.month01 Jan15 ,a.month02 Feb15, a.month03 Mar15 ,a.month04 Apr15 ,a.month05 May15, a.month06 Jun15 ,a.month07 Jul15 ,a.month08 Aug15 ,a.month09 Sep15,a.month10 Oct15 ,a.month11 Nov15 ,a.month12 Dec15 ,
b.month01 Jan14 ,b.month02 Feb14, b.month03 Mar14 ,b.month04 Apr14 ,b.month05 May14, b.month06 Jun14 ,b.month07 Jul14 ,b.month08 Aug14 ,b.month09 Sep14,b.month10 Oct14 ,b.month11 Nov14 ,b.month12 Dec14 
from executive_summary a,executive_summary b 
where a.datatype='ACTUALS - ONLINE' and a.items='Mobile NGW' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014

union
select 310 seq,a.country,a.datatype, 'Online Active Customers' items, 
a.month01 Jan15 ,a.month02 Feb15, a.month03 Mar15 ,a.month04 Apr15 ,a.month05 May15, a.month06 Jun15 ,a.month07 Jul15 ,a.month08 Aug15 ,a.month09 Sep15,a.month10 Oct15 ,a.month11 Nov15 ,a.month12 Dec15 ,
b.month01 Jan14 ,b.month02 Feb14, b.month03 Mar14 ,b.month04 Apr14 ,b.month05 May14, b.month06 Jun14 ,b.month07 Jul14 ,b.month08 Aug14 ,b.month09 Sep14,b.month10 Oct14 ,b.month11 Nov14 ,b.month12 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - ONLINE' and a.items ='Online UAP' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014


union
select 311 seq,a.country,a.datatype, 'Web Active Customers' items, 
a.month01 Jan15 ,a.month02 Feb15, a.month03 Mar15 ,a.month04 Apr15 ,a.month05 May15, a.month06 Jun15 ,a.month07 Jul15 ,a.month08 Aug15 ,a.month09 Sep15,a.month10 Oct15 ,a.month11 Nov15 ,a.month12 Dec15 ,
b.month01 Jan14 ,b.month02 Feb14, b.month03 Mar14 ,b.month04 Apr14 ,b.month05 May14, b.month06 Jun14 ,b.month07 Jul14 ,b.month08 Aug14 ,b.month09 Sep14,b.month10 Oct14 ,b.month11 Nov14 ,b.month12 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - ONLINE' and a.items ='Web UAP' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014

union
select 312 seq,a.country,a.datatype, 'Mobile Active Customers' items, 
a.month01 Jan15 ,a.month02 Feb15, a.month03 Mar15 ,a.month04 Apr15 ,a.month05 May15, a.month06 Jun15 ,a.month07 Jul15 ,a.month08 Aug15 ,a.month09 Sep15,a.month10 Oct15 ,a.month11 Nov15 ,a.month12 Dec15 ,
b.month01 Jan14 ,b.month02 Feb14, b.month03 Mar14 ,b.month04 Apr14 ,b.month05 May14, b.month06 Jun14 ,b.month07 Jul14 ,b.month08 Aug14 ,b.month09 Sep14,b.month10 Oct14 ,b.month11 Nov14 ,b.month12 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - ONLINE' and a.items ='Mobile UAP' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014

union
select 313 seq,a.country,a.datatype, 'Online Database' items, 
a.month01 Jan15 ,a.month02 Feb15, a.month03 Mar15 ,a.month04 Apr15 ,a.month05 May15, a.month06 Jun15 ,a.month07 Jul15 ,a.month08 Aug15 ,a.month09 Sep15,a.month10 Oct15 ,a.month11 Nov15 ,a.month12 Dec15 ,
b.month01 Jan14 ,b.month02 Feb14, b.month03 Mar14 ,b.month04 Apr14 ,b.month05 May14, b.month06 Jun14 ,b.month07 Jul14 ,b.month08 Aug14 ,b.month09 Sep14,b.month10 Oct14 ,b.month11 Nov14 ,b.month12 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - ONLINE' and a.items ='Database' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 314 seq,a.country,a.datatype,'Online First Time Depositors' items, 
a.month01 Jan15 ,a.month02 Feb15, a.month03 Mar15 ,a.month04 Apr15 ,a.month05 May15, a.month06 Jun15 ,a.month07 Jul15 ,a.month08 Aug15 ,a.month09 Sep15 ,a.month10 Oct15 ,a.month11 Nov15 ,a.month12 Dec15 ,
b.month01 Jan14 ,b.month02 Feb14, b.month03 Mar14 ,b.month04 Apr14 ,b.month05 May14, b.month06 Jun14 ,b.month07 Jul14 ,b.month08 Aug14 ,b.month09 Sep14,b.month10 Oct14 ,b.month11 Nov14 ,b.month12 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - ONLINE' and a.items ='FTD' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 315 seq,'--','ACTUALS - ONLINE','Web First Time Depositors' items, 
null Jan15 ,null Feb15, null Mar15 ,null Apr15 ,null May15, null Jun15 ,null Jul15 ,null Aug15 ,null Sep15 ,null Oct15 ,null Nov15 ,null Dec15 ,
null Jan14 ,null Feb14, null Mar14 ,null Apr14 ,null May14, null Jun14 ,null Jul14 ,null Aug14 ,null Sep14 ,null Oct14 ,null Nov14 ,null Dec14 
union
select 316 seq,'--','ACTUALS - ONLINE','Mobile First Time Depositors' items, 
null Jan15 ,null Feb15, null Mar15 ,null Apr15 ,null May15, null Jun15 ,null Jul15 ,null Aug15 ,null Sep15 ,null Oct15 ,null Nov15 ,null Dec15 ,
null Jan14 ,null Feb14, null Mar14 ,null Apr14 ,null May14, null Jun14 ,null Jul14 ,null Aug14 ,null Sep14 ,null Oct14 ,null Nov14 ,null Dec14 

union
select 317 seq,a.country,a.datatype,'Online Active Player Days' items, 
a.month01 Jan15 ,a.month02 Feb15, a.month03 Mar15 ,a.month04 Apr15 ,a.month05 May15, a.month06 Jun15 ,a.month07 Jul15 ,a.month08 Aug15 ,a.month09 Sep15 ,a.month10 Oct15 ,a.month11 Nov15 ,a.month12 Dec15 ,
b.month01 Jan14 ,b.month02 Feb14, b.month03 Mar14 ,b.month04 Apr14 ,b.month05 May14, b.month06 Jun14 ,b.month07 Jul14 ,b.month08 Aug14 ,b.month09 Sep14,b.month10 Oct14 ,b.month11 Nov14 ,b.month12 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - ONLINE' and a.items ='APD' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014

union
select 318 seq,a.country,a.datatype,'Web Active Player Days' items, 
a.month01 Jan15 ,a.month02 Feb15, a.month03 Mar15 ,a.month04 Apr15 ,a.month05 May15, a.month06 Jun15 ,a.month07 Jul15 ,a.month08 Aug15 ,a.month09 Sep15 ,a.month10 Oct15 ,a.month11 Nov15 ,a.month12 Dec15 ,
b.month01 Jan14 ,b.month02 Feb14, b.month03 Mar14 ,b.month04 Apr14 ,b.month05 May14, b.month06 Jun14 ,b.month07 Jul14 ,b.month08 Aug14 ,b.month09 Sep14,b.month10 Oct14 ,b.month11 Nov14 ,b.month12 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - ONLINE' and a.items ='Web APD' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014

union
select 319 seq,a.country,a.datatype, 'Mobile Acitve Player Days' items, 
a.month01 Jan15 ,a.month02 Feb15, a.month03 Mar15 ,a.month04 Apr15 ,a.month05 May15, a.month06 Jun15 ,a.month07 Jul15 ,a.month08 Aug15 ,a.month09 Sep15 ,a.month10 Oct15 ,a.month11 Nov15 ,a.month12 Dec15 ,
b.month01 Jan14 ,b.month02 Feb14, b.month03 Mar14 ,b.month04 Apr14 ,b.month05 May14, b.month06 Jun14 ,b.month07 Jul14 ,b.month08 Aug14 ,b.month09 Sep14,b.month10 Oct14 ,b.month11 Nov14 ,b.month12 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - ONLINE' and a.items ='Mobile APD' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014

union
select 320 seq,a.country,a.datatype,'Online Net Gross Win per Unique active customer/player' items, 
a.month01*1000 Jan15 ,a.month02*1000 Feb15, a.month03*1000 Mar15 ,a.month04*1000 Apr15 ,a.month05*1000 May15, a.month06*1000 Jun15 ,a.month07*1000 Jul15 ,a.month08*1000 Aug15 ,a.month09*1000 Sep15,a.month10*1000 Oct15 ,a.month11*1000  Nov15 ,a.month12*1000 Dec15 ,
b.month01*1000 Jan14 ,b.month02*1000 Feb14, b.month03*1000 Mar14 ,b.month04*1000 Apr14 ,b.month05*1000 May14, b.month06*1000 Jun14 ,b.month07*1000 Jul14 ,b.month08*1000 Aug14 ,b.month09*1000 Sep14,b.month10*1000 Oct14 ,b.month11*1000  Nov14 ,b.month12*1000 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - ONLINE' and a.items ='NGW per UAP' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 321 seq,a.country,a.datatype,'Online Stake amount per active player days' items, 
a.month01*1000 Jan15 ,a.month02*1000 Feb15, a.month03*1000 Mar15 ,a.month04*1000 Apr15 ,a.month05*1000 May15, a.month06*1000 Jun15 ,a.month07*1000 Jul15 ,a.month08*1000 Aug15 ,a.month09*1000 Sep15,a.month10*1000 Oct15 ,a.month11*1000  Nov15 ,a.month12*1000 Dec15 ,
b.month01*1000 Jan14 ,b.month02*1000 Feb14, b.month03*1000 Mar14 ,b.month04*1000 Apr14 ,b.month05*1000 May14, b.month06*1000 Jun14 ,b.month07*1000 Jul14 ,b.month08*1000 Aug14 ,b.month09*1000 Sep14,b.month10*1000 Oct14 ,b.month11*1000  Nov14 ,b.month12*1000 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - ONLINE' and a.items ='Stake per APD' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 322 seq,a.country,a.datatype,'Online Net gross win margin' items, 
a.month01 Jan15 ,a.month02 Feb15, a.month03 Mar15 ,a.month04 Apr15 ,a.month05 May15, a.month06 Jun15 ,a.month07 Jul15 ,a.month08 Aug15 ,a.month09 Sep15,a.month10 Oct15 ,a.month11  Nov15 ,a.month12 Dec15 ,
b.month01 Jan14 ,b.month02 Feb14, b.month03 Mar14 ,b.month04 Apr14 ,b.month05 May14, b.month06 Jun14 ,b.month07 Jul14 ,b.month08 Aug14 ,b.month09 Sep14,b.month10 Oct14 ,b.month11  Nov14 ,b.month12 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - ONLINE' and a.items ='Online NGW Margin' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 323 seq,a.country,a.datatype,a.items items, 
a.month01 Jan15 ,a.month02 Feb15, a.month03 Mar15 ,a.month04 Apr15 ,a.month05 May15, a.month06 Jun15 ,a.month07 Jul15 ,a.month08 Aug15 ,a.month09 Sep15,a.month10 Oct15 ,a.month11  Nov15 ,a.month12 Dec15 ,
b.month01 Jan14 ,b.month02 Feb14, b.month03 Mar14 ,b.month04 Apr14 ,b.month05 May14, b.month06 Jun14 ,b.month07 Jul14 ,b.month08 Aug14 ,b.month09 Sep14,b.month10 Oct14 ,b.month11  Nov14 ,b.month12 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - ONLINE' and a.items ='Web Net Gross Win Margins' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 324 seq,a.country,a.datatype,a.items items, 
a.month01 Jan15 ,a.month02 Feb15, a.month03 Mar15 ,a.month04 Apr15 ,a.month05 May15, a.month06 Jun15 ,a.month07 Jul15 ,a.month08 Aug15 ,a.month09 Sep15,a.month10 Oct15 ,a.month11  Nov15 ,a.month12 Dec15 ,
b.month01 Jan14 ,b.month02 Feb14, b.month03 Mar14 ,b.month04 Apr14 ,b.month05 May14, b.month06 Jun14 ,b.month07 Jul14 ,b.month08 Aug14 ,b.month09 Sep14,b.month10 Oct14 ,b.month11  Nov14 ,b.month12 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - ONLINE' and a.items ='Mobile Net Gross Win Margins' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 325 seq,a.country,a.datatype,'Online Player Yield per Active Player' items, 
a.month01*1000 Jan15 ,a.month02*1000 Feb15, a.month03*1000 Mar15 ,a.month04*1000 Apr15 ,a.month05*1000 May15, a.month06*1000 Jun15 ,a.month07*1000 Jul15 ,a.month08*1000 Aug15 ,a.month09*1000 Sep15,a.month10*1000 Oct15 ,a.month11*1000  Nov15 ,a.month12*1000 Dec15 ,
b.month01*1000 Jan14 ,b.month02*1000 Feb14, b.month03*1000 Mar14 ,b.month04*1000 Apr14 ,b.month05*1000 May14, b.month06*1000 Jun14 ,b.month07*1000 Jul14 ,b.month08*1000 Aug14 ,b.month09*1000 Sep14,b.month10*1000 Oct14 ,b.month11*1000  Nov14 ,b.month12*1000 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - ONLINE' and a.items ='Player Yeild per UAP' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 326 seq,a.country,a.datatype,'Online Player Churn Rate' items, 
a.month01 Jan15 ,a.month02 Feb15, a.month03 Mar15 ,a.month04 Apr15 ,a.month05 May15, a.month06 Jun15 ,a.month07 Jul15 ,a.month08 Aug15 ,a.month09 Sep15,a.month10 Oct15 ,a.month11  Nov15 ,a.month12 Dec15 ,
b.month01 Jan14 ,b.month02 Feb14, b.month03 Mar14 ,b.month04 Apr14 ,b.month05 May14, b.month06 Jun14 ,b.month07 Jul14 ,b.month08 Aug14 ,b.month09 Sep14,b.month10 Oct14 ,b.month11  Nov14 ,b.month12 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - ONLINE' and a.items ='Player Churn Rate' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 327 seq,'--','ACTUALS - ONLINE','Online channel Player values' items, 
null Jan15 ,null Feb15, null Mar15 ,null Apr15 ,null May15, null Jun15 ,null Jul15 ,null Aug15 ,null Sep15 ,null Oct15 ,null Nov15 ,null Dec15 ,
null Jan14 ,null Feb14, null Mar14 ,null Apr14 ,null May14, null Jun14 ,null Jul14 ,null Aug14 ,null Sep14 ,null Oct14 ,null Nov14 ,null Dec14 
union
select 328 seq,a.country,a.datatype,a.items, 
a.month01*1000 Jan15 ,a.month02*1000 Feb15, a.month03*1000 Mar15 ,a.month04*1000 Apr15 ,a.month05*1000 May15, a.month06*1000 Jun15 ,a.month07*1000 Jul15 ,a.month08*1000 Aug15 ,a.month09*1000 Sep15,a.month10*1000 Oct15 ,a.month11*1000  Nov15 ,a.month12*1000 Dec15 ,
b.month01*1000 Jan14 ,b.month02*1000 Feb14, b.month03*1000 Mar14 ,b.month04*1000 Apr14 ,b.month05*1000 May14, b.month06*1000 Jun14 ,b.month07*1000 Jul14 ,b.month08*1000 Aug14 ,b.month09*1000 Sep14,b.month10*1000 Oct14 ,b.month11*1000  Nov14 ,b.month12*1000 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - ONLINE' and a.items ='Online Bonus Cost' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014
union
select 329 seq,a.country,a.datatype, a.items, 
a.month01*1000 Jan15 ,a.month02*1000 Feb15, a.month03*1000 Mar15 ,a.month04*1000 Apr15 ,a.month05*1000 May15, a.month06*1000 Jun15 ,a.month07*1000 Jul15 ,a.month08*1000 Aug15 ,a.month09*1000 Sep15,a.month10*1000 Oct15 ,a.month11*1000 Nov15 ,a.month12*1000 Dec15 ,
b.month01*1000 Jan14 ,b.month02*1000 Feb14, b.month03*1000 Mar14 ,b.month04*1000 Apr14 ,b.month05*1000 May14, b.month06*1000 Jun14 ,b.month07*1000 Jul14 ,b.month08*1000 Aug14 ,b.month09*1000 Sep14,b.month10*1000 Oct14 ,b.month11*1000 Nov14 ,b.month12*1000 Dec14 
from executive_summary a,executive_summary b 
where a.datatype = 'ACTUALS - ONLINE' and a.items ='Online Marketing Spend' and a.datatype = b.datatype and a.items = b.items and a.datayear = 2015 and b.datayear = 2014

order by seq) ab;
