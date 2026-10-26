select*from customers;
select*from orders;
select*from employees ;
show tables ;

-- QUES - 1 .
select
c.CustomerName,
o.orderid,
o.OrderAmount

from orders  o
inner join customers c
on 
o.customerid=o.customerid
order by orderamount desc limit 5;

-- QUES 2 .
SELECT CustomerName from customers 
where left(CustomerName, 1) in ( 'A','R','S');

-- QUES 3.
SELECT 
c.customername,
o.orderid,
o.orderamount,
o. Status

from orders o
inner join customers c
on
o.customerid= c.customerid
 where o.orderamount>10000 and o.Status ='pending';

-- QUES -4 .

select
customerid, customername, joindate ,
DATEDIFF(CURDATE() , joindate) as DaysAssociated
from customers
where DATEDIFF(CURDATE() , joindate) > 365;

-- QUES 5 .

select
orderid , orderamount as CurrentAmount ,
round(orderamount * 0.18 ,2 ) as '18% GST',
round(orderamount * 1.18 , 2 ) as Total_Amount_After_GST ,
DATE_ADD(orderdate , interval 15 day ) as Expected_collection_date 
from orders;

-- QUES 6 .

select
c.customerid, c.customername ,o.orderid , o.orderamount 
from customers  c
inner join orders o
on
c.customerid=o.customerid 
order by orderamount desc 
limit 10
offset 10 ;

-- QUES 7 .

select c.customerid , c.customername, c.joindate,
DATEDIFF(CURDATE() , c.joindate) as NumberOfDaysSinceRegistration
from customers  c
left join orders  o
on c.customerid= o.customerid
where orderid is null;

-- QUES 8 .

select
e. employeename , m. employeename as managername , e.department
from employees e
left join employees m
on e.managerid = m.employeeid ;

-- QUES 9 .

select
c.customername, c.joindate , o.orderdate ,
DATEDIFF(o.orderdate , c.joindate) as Days_Taken_To_Place_First_Order
from customers c
inner join orders o
on 
c.customerid = o.customerid
 where DATEDIFF(o.orderdate , c.joindate) between 0 and 30 ;

-- QUES 10 .

select
c.customername , sum(o.orderamount) as total_purchase_amount,
case 
when sum(o.orderamount) > 50000 then 'premium'
when sum(o.orderamount) < 20000 then 'silver' else 'gold'
end as SpendingCategory ,
case 
when year(c.joindate) < 2024 then 'loyalcustomer' 
else 'newcustomer'
end as LoyaltyStatus
from customers c 
left join orders o 
on c.customerid = o. customerid
group by c.customerid,
c.customername,
c.joindate;

-- QUES 11 .

select
c.customername , o.orderid, o.orderamount 
from customers c 
inner join orders o 
on c.customerid = o.customerid
where o.orderamount> (select avg(orderamount) from orders);

-- QUES 12  .

select
c.customername , o.orderid , o.orderamount 
from customers c
inner join orders o 
on c.customerid= o.customerid
order by orderamount desc 
limit 5 offset 1 ;




