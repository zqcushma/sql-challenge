--0 aka view tables columns
select * from employees

--1
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary from employees e join salaries s on (e.emp_no = s.emp_no)

--2
SELECT first_name, last_name, hire_date FROM employees WHERE EXTRACT(YEAR FROM hire_date) = 1986

--3
SELECT
    dm.dept_no,
    d.dept_name,
    dm.emp_no AS manager_employee_number,
    e.last_name AS manager_first_name,
    e.first_name AS manager_last_name
FROM
    dept_manager dm
JOIN
    departments d ON dm.dept_no = d.dept_no
JOIN
    employees e ON dm.emp_no = e.emp_no;

--4
SELECT
    de.emp_no,
    e.first_name,
    e.last_name,
    de.dept_no,
    d.dept_name
FROM
    dept_emp de
JOIN
    employees e ON de.emp_no = e.emp_no
JOIN
    departments d ON de.dept_no = d.dept_no;

--5
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6
SELECT
    e.emp_no AS employee_number,
    e.last_name,
    e.first_name
FROM
    employees e
JOIN
    dept_emp de ON e.emp_no = de.emp_no
JOIN
    departments d ON de.dept_no = d.dept_no
WHERE
    d.dept_name = 'Sales';

--7
SELECT
    e.emp_no AS employee_number,
    e.last_name,
    e.first_name,
    d.dept_name
FROM
    employees e
JOIN
    dept_emp de ON e.emp_no = de.emp_no
JOIN
    departments d ON de.dept_no = d.dept_no
WHERE
    d.dept_name IN ('Sales', 'Development');

--8
SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC, last_name;