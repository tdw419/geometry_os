# Exercise 4: Scripting

> **Module**: Module 4 - Advanced Features
> **Duration**: 30 minutes
> **Difficulty**: Intermediate

---

## Objectives

By completing this exercise, you will:
- Write Geometry Script files
- Use variables and functions
- Implement control flow
- Handle errors

---

## Prerequisites

- Completed Exercises 1-3
- Shell running
- Text editor available

---

## Part 1: Script Basics

### Task 1.1: Create Your First Script

```bash
>>> edit hello.gs
```

Enter the following:

```geometry
# hello.gs - My first script
print("Hello, Geometry Script!")

# Variables
name = "World"
print("Hello, " + name + "!")

# Simple calculation
result = 10 ⊕ 5
print("10 + 5 = " + result)
```

Save and run:

```bash
>>> run hello.gs
```

**Expected Output:**
```
Hello, Geometry Script!
Hello, World!
10 + 5 = 15
```

### Task 1.2: Modify the Script

Change `name` to your name and add another calculation.

**Your modified script:**
```geometry
# Your changes here
```

---

## Part 2: Variables and Types

### Task 2.1: Type Exploration

Create `types.gs`:

```geometry
# types.gs - Variable types

# Numbers
integer = 42
float = 3.14159
print("Integer: " + integer)
print("Float: " + float)

# Strings
text = "Hello, Geometry OS!"
print("Text: " + text)

# Arrays
numbers = [1, 2, 3, 4, 5]
print("Numbers: " + numbers)
print("First: " + numbers[0])
print("Last: " + numbers[-1])

# Dictionaries
config = {
    "name": "training",
    "version": 1.0,
    "enabled": true
}
print("Name: " + config["name"])
print("Version: " + config["version"])
```

Run and record the output:

```
Integer: _____________
Float: _____________
Text: _____________
Numbers: _____________
First: _____________
Last: _____________
Name: _____________
Version: _____________
```

---

## Part 3: Control Flow

### Task 3.1: Conditionals

Create `conditionals.gs`:

```geometry
# conditionals.gs - If/else

value = 75

if (value > 90) {
    print("Excellent!")
} else if (value > 70) {
    print("Good!")
} else if (value > 50) {
    print("Pass")
} else {
    print("Fail")
}

# With glyphs
if (value ⊕ 10 > 80) {
    print("Value + 10 > 80")
}
```

**Output:** _____________

### Task 3.2: Loops

Create `loops.gs`:

```geometry
# loops.gs - Loop examples

# For loop
print("Counting to 5:")
↻ 5 with i {
    print("  " + i)
}

# While loop
print("While loop:")
count = 3
while (count > 0) {
    print("  Count: " + count)
    count = count ⊖ 1
}
print("  Blastoff!")

# For-each
fruits = ["apple", "banana", "cherry"]
print("Fruits:")
foreach fruit in fruits {
    print("  " + fruit)
}
```

**Output:**
```
_____________
_____________
_____________
_____________
```

---

## Part 4: Functions

### Task 4.1: Basic Functions

Create `functions.gs`:

```geometry
# functions.gs - Function examples

# Simple function
fn greet(name) {
    return "Hello, " + name + "!"
}

print(greet("Alice"))
print(greet("Bob"))

# Function with default parameter
fn power(base, exp = 2) {
    result = 1
    ↻ exp {
        result = result ⊗ base
    }
    return result
}

print("2^2 = " + power(2))
print("2^3 = " + power(2, 3))
print("3^4 = " + power(3, 4))

# Recursive function
fn factorial(n) {
    if (n <= 1) {
        return 1
    }
    return n ⊗ factorial(n ⊖ 1)
}

print("5! = " + factorial(5))
print("10! = " + factorial(10))
```

**Record outputs:**
```
greet("Alice"): _____________
power(2): _____________
power(2, 3): _____________
factorial(5): _____________
factorial(10): _____________
```

### Task 4.2: Higher-Order Functions

```geometry
# Higher-order functions
fn apply_twice(func, value) {
    return func(func(value))
}

fn double(x) { return x ⊗ 2 }

result = apply_twice(double, 5)
print("apply_twice(double, 5) = " + result)
```

**Output:** _____________

---

## Part 5: File Operations

### Task 5.1: Read and Write

Create `file_ops.gs`:

```geometry
# file_ops.gs - File operations

# Write to file
write("test_output.txt", "Line 1\n")
append("test_output.txt", "Line 2\n")
append("test_output.txt", "Line 3\n")

# Read from file
content = read("test_output.txt")
print("File contents:")
print(content)

# Check file exists
if (exists("test_output.txt")) {
    size = file_size("test_output.txt")
    print("File size: " + size + " bytes")
}

# Clean up
rm("test_output.txt")
```

---

## Part 6: Error Handling

### Task 6.1: Try/Catch

Create `errors.gs`:

```geometry
# errors.gs - Error handling

fn safe_divide(a, b) {
    try {
        if (b == 0) {
            throw "Division by zero"
        }
        return a ⊘ b
    } catch (e) {
        print("Error: " + e)
        return null
    }
}

print("10 / 2 = " + safe_divide(10, 2))
print("10 / 0 = " + safe_divide(10, 0))

# File error handling
try {
    content = read("nonexistent.txt")
} catch (e) {
    print("Could not read file: " + e)
}
```

**Output:**
```
10 / 2 = _____________
10 / 0 = _____________
Could not read file: _____________
```

---

## Completion Checklist

- [ ] Created and ran a Geometry Script
- [ ] Used variables and types
- [ ] Implemented conditionals
- [ ] Used loops (for, while, foreach)
- [ ] Defined and called functions
- [ ] Read and wrote files
- [ ] Handled errors with try/catch

---

## Challenge (Optional)

### Challenge 1: Fibonacci Generator

Write a script that generates the first 20 Fibonacci numbers.

```geometry
# fibonacci.gs
# Your implementation here
```

### Challenge 2: File Processor

Write a script that:
1. Reads a file
2. Processes each line
3. Writes results to a new file

```geometry
# processor.gs
# Your implementation here
```

### Challenge 3: Calculator Script

Create an interactive calculator that:
1. Accepts expressions
2. Evaluates them
3. Prints results

```geometry
# calculator.gs
# Your implementation here
```

---

## Common Issues

| Issue | Solution |
|-------|----------|
| Script not found | Check path and extension |
| Syntax error | Check for missing braces |
| Variable undefined | Check scope and spelling |
| File not found | Use absolute path |

---

## Next Steps

After completing this exercise, proceed to:
- [Exercise 5: Integration](exercise_05_integration.md)

---

*Exercise 4.0*
