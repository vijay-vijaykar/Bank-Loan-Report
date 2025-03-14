SELECT * 
FROM bank_loan_data;

-- Total Loan Applications
SELECT count(id) AS Total_applications
FROM bank_loan_data;


-- MTD Loan Applications
SELECT count(id) AS MTD_Total_applications
FROM bank_loan_data
WHERE MONTH(issue_date)=12 AND YEAR(issue_date)=2021;

-- PMTD Loan Applications
SELECT COUNT(id) AS PMTD_Total_Applications FROM bank_loan_data
WHERE MONTH(issue_date) = 11;


-- Total Funded Amount
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM bank_loan_data;


-- MTD Total Funded Amount
SELECT SUM(loan_amount) AS MTD_Total_funded_amount
FROM bank_loan_data
WHERE MONTH(issue_date)=12 AND YEAR(issue_date)=2021;


-- PMTD Total Funded Amount
SELECT SUM(loan_amount) AS PMTD_Total_funded_amount
FROM bank_loan_data
WHERE MONTH(issue_date)=11 AND YEAR(issue_date)=2021;


-- Total Amount Received
SELECT SUM(total_payment) AS Total_amount_recieved
FROM bank_loan_data;


-- MTD Total Amount Received
SELECT SUM(total_payment) AS MTD_Total_amount_recieved
FROM bank_loan_data
WHERE MONTH(issue_date)=12 AND YEAR(issue_date)=2021;


-- PMTD Total Amount Received
SELECT SUM(total_payment) AS PMTD_Total_amount_recieved
FROM bank_loan_data
WHERE MONTH(issue_date)=11 AND YEAR(issue_date)=2021;


-- Average Interest Rate
SELECT ROUND(AVG(int_rate),4)*100 AS Avg_Interest_Rate
FROM bank_loan_data;

-- MTD Average Interest
SELECT ROUND(AVG(int_rate),4)*100 AS MTD_Avg_Interest_Rate
FROM bank_loan_data
WHERE MONTH(issue_date)=12 AND YEAR(issue_date)=2021;


-- PMTD Average Interest
SELECT ROUND(AVG(int_rate),4)*100 AS PMTD_Avg_Interest_Rate
FROM bank_loan_data
WHERE MONTH(issue_date)=11 AND YEAR(issue_date)=2021;


-- Avg DTI
SELECT ROUND(AVG(dti),4)*100 AS Avg_DTI 
FROM bank_loan_data;


-- MTD Avg DTI
SELECT ROUND(AVG(dti),4)*100 AS MTD_Avg_DTI 
FROM bank_loan_data
WHERE MONTH(issue_date)=12 AND YEAR(issue_date)=2021;


-- PMTD Avg DTI
SELECT ROUND(AVG(dti),4)*100 AS PMTD_Avg_DTI 
FROM bank_loan_data
WHERE MONTH(issue_date)=11 AND YEAR(issue_date)=2021;



-- GOOD LOAN ISSUED


-- Good Loan Percentage
SELECT (
        COUNT(CASE WHEN loan_status='Fully Paid' OR loan_status='Current'THEN id END)*100)
        /
       COUNT(id) AS Good_loan_percentage
FROM bank_loan_data;


-- Good Loan Applications
SELECT COUNT(id) AS Good_loan_applications
FROM bank_loan_data
WHERE loan_status='Fully Paid' OR loan_status='Current';

-- Good Loan Funded Amount
SELECT SUM(loan_amount) AS Good_loan_funded_amount
FROM bank_loan_data
WHERE loan_status='Fully Paid' OR loan_status='Current';


-- Good Loan Amount Received
SELECT SUM(total_payment) AS Good_loan_amount_received
FROM bank_loan_data
WHERE loan_status='Fully Paid' OR loan_status='Current';


-- Bad Loan Percentage
SELECT (
        COUNT(CASE WHEN loan_status='Charged Off' THEN id END)*100)
        /
       COUNT(id) AS Bad_loan_percentage
FROM bank_loan_data;


-- Bad Loan Applications
SELECT COUNT(id) AS Bad_Loan_applications
FROM bank_loan_data
WHERE loan_status='Charged Off';


-- Bad Loan Funded Amount
SELECT SUM(loan_amount) AS Bad_loan_amount
FROM bank_loan_data
WHERE loan_status='Charged Off';


-- Bad Loan Amount Received
SELECT SUM(total_payment) AS Bad_loan_amount_received
FROM bank_loan_data
WHERE loan_status='Charged Off';



-- LOAN STATUS
SELECT 
      loan_status,
	  COUNT(id) AS Total_loan_applications,
	  SUM(total_payment) AS Total_amount_received,
	  SUM(loan_amount) AS Total_Funded_amount,
	  AVG(int_rate*100) AS Interest_rate,
	  AVG(dti*100) AS DTI
  FROM bank_loan_data
  GROUP BY loan_status;


  -- -- LOAN STATUS
  SELECT 
        loan_status,
		SUM(total_payment) AS MTD_Total_amount_received,
		SUM(loan_amount) AS MTD_Total_funded_amount
	FROM bank_loan_data
	WHERE MONTH(issue_date)=12
	GROUP BY loan_status;


	-- B.	BANK LOAN REPORT | OVERVIEW

	SELECT 
	      MONTH(issue_date) AS Month_number,
		  DATENAME(MONTH,issue_date) AS Month_name,
		  COUNT(id) AS Total_loan_applications,
		  SUM(loan_amount) AS Total_funded_amount,
		  SUM(total_payment) AS Total_received_amount
	FROM bank_loan_data
	GROUP BY MONTH(issue_date),DATENAME(MONTH,issue_date)
	ORDER BY MONTH (issue_date);


-- STATE
SELECT 
	      address_state,
		  COUNT(id) AS Total_loan_applications,
		  SUM(loan_amount) AS Total_funded_amount,
		  SUM(total_payment) AS Total_received_amount
	FROM bank_loan_data
	GROUP BY address_state
	ORDER BY COUNT(id) DESC;


-- TERM
SELECT 
	      term,
		  COUNT(id) AS Total_loan_applications,
		  SUM(loan_amount) AS Total_funded_amount,
		  SUM(total_payment) AS Total_received_amount
	FROM bank_loan_data
	GROUP BY term
	ORDER BY term;


-- EMPLOYEE LENGTH
SELECT 
	emp_length AS Employee_length,
	COUNT(id) AS Total_loan_applications,
	SUM(loan_amount) AS Total_funded_amount,
	SUM(total_payment) AS Total_received_amount
FROM bank_loan_data
GROUP BY emp_length
ORDER BY emp_length;



-- PURPOSE
SELECT 
	purpose,
	COUNT(id) AS Total_loan_applications,
	SUM(loan_amount) AS Total_funded_amount,
	SUM(total_payment) AS Total_received_amount
FROM bank_loan_data
GROUP BY purpose
ORDER BY purpose;


-- HOME OWNERSHIP
SELECT 
	home_ownership AS Home_Ownership,
	COUNT(id) AS Total_loan_applications,
	SUM(loan_amount) AS Total_funded_amount,
	SUM(total_payment) AS Total_received_amount
FROM bank_loan_data
GROUP BY home_ownership
ORDER BY home_ownership;


-- Note: We have applied multiple Filters on all the dashboards. You can check the results for the filters as well by modifying the query 
-- and comparing the results.
-- For e.g
-- See the results when we hit the Grade A in the filters for dashboards.
SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
WHERE grade = 'A'
GROUP BY purpose
ORDER BY purpose;






