# Practical Exam: Native Glyph Shell

> **Purpose**: Demonstrate your skills with hands-on tasks
> **Time**: 30 minutes
> **Passing Score**: 80% (24/30 points)
> **Instructions**: Complete all tasks in order. Record your answers.

---

## Setup

Before starting, ensure you have:

```bash
# Start a fresh shell session
>>> training exam start
Exam mode activated. All actions are logged.

# Verify environment
>>> pwd
/home/user/geometry_os
```

---

## Task 1: Navigation (5 points)

### 1.1 Filesystem Navigation (2 points)

Navigate to the correct location and verify:

```bash
# Task: Navigate to the systems directory and list its contents
# Expected: Show all subdirectories in systems/

Your commands:
>>> ____________
>>> ____________

# Verification
>>> training verify 1.1
```

### 1.2 Visual Navigation (3 points)

Navigate the visual substrate:

```bash
# Task: Enable visual mode, go to address 0x1000, zoom to 2x
# Expected: Visual enabled, centered on 0x1000, 2x zoom

Your commands:
>>> ____________
>>> ____________
>>> ____________

# Verification
>>> training verify 1.2
```

---

## Task 2: Glyph Operations (5 points)

### 2.1 Arithmetic (2 points)

Perform calculations using glyphs:

```bash
# Task: Calculate (15 ⊕ 7) ⊗ 3
# Expected result: 66

Your command:
>>> ____________

Result: _______

# Verification
>>> training verify 2.1
```

### 2.2 Memory Operations (3 points)

Store and retrieve values:

```bash
# Task: 
# 1. Store 100 at address 0x2000
# 2. Store 200 at address 0x2001
# 3. Load both values and calculate their sum
# Expected: Sum = 300

Your commands:
>>> ____________
>>> ____________
>>> ____________

Result: _______

# Verification
>>> training verify 2.2
```

---

## Task 3: Process Management (5 points)

### 3.1 Process Creation (2 points)

Start and manage a process:

```bash
# Task: Run the demo script in background and find its PID
# Script: examples/cli_preview.py

Your commands:
>>> ____________
>>> ____________

PID: _______

# Verification
>>> training verify 3.1
```

### 3.2 Process Monitoring (3 points)

Monitor and control the process:

```bash
# Task: 
# 1. Show the process's memory usage
# 2. Limit its CPU to 50%
# 3. Terminate it gracefully

Your commands:
>>> ____________
>>> ____________
>>> ____________

# Verification
>>> training verify 3.2
```

---

## Task 4: Scripting (5 points)

### 4.1 Script Creation (3 points)

Create a script that performs a task:

```bash
# Task: Create a script at ~/test_script.gs that:
# 1. Defines a function "cube" that returns x ⊗ x ⊗ x
# 2. Calls cube(5) and prints the result
# Expected output: 125

Your script:
```geometry
# Write your script here
```
```

# Run and verify
>>> run ~/test_script.gs
Output: _______

>>> training verify 4.1
```

### 4.2 Script Execution (2 points)

Run the script with error handling:

```bash
# Task: Run the script and capture any errors
# Expected: Clean execution, no errors

Your command:
>>> ____________

Exit code: _______

# Verification
>>> training verify 4.2
```

---

## Task 5: Integration (5 points)

### 5.1 File Operations (2 points)

Work with files:

```bash
# Task: 
# 1. Create a file ~/exam_test.txt with content "Hello, Exam!"
# 2. Append "Line 2" to the file
# 3. Display the file contents

Your commands:
>>> ____________
>>> ____________
>>> ____________

Contents:
_______

# Verification
>>> training verify 5.1
```

### 5.2 Configuration (3 points)

Configure the environment:

```bash
# Task:
# 1. Set the visual default zoom to 1.5
# 2. Create an alias "lx" for "ls -la"
# 3. Save the alias permanently

Your commands:
>>> ____________
>>> ____________
>>> ____________

# Verification
>>> training verify 5.2
```

---

## Task 6: Troubleshooting (5 points)

### 6.1 Debug a Problem (3 points)

A command is failing. Diagnose and fix:

```bash
# Scenario: The following command fails
>>> calc 10 ⊕ "five"
Error: Type mismatch

# Task: Identify the issue and provide the correct command
# Expected: Correct calculation resulting in 15

Issue identified: _______________________

Correct command:
>>> ____________

Result: _______

# Verification
>>> training verify 6.1
```

### 6.2 Resource Issue (2 points)

Diagnose a performance issue:

```bash
# Scenario: System is running slowly
# Task: Identify the top CPU-consuming process

Your commands:
>>> ____________

Top process: _______
CPU usage: _______

# Verification
>>> training verify 6.2
```

---

## Grading Rubric

| Task | Points | Criteria |
|------|--------|----------|
| 1.1 | 2 | Correct navigation and listing |
| 1.2 | 3 | All three visual operations correct |
| 2.1 | 2 | Correct calculation with glyphs |
| 2.2 | 3 | Store, load, and sum correct |
| 3.1 | 2 | Process started, PID identified |
| 3.2 | 3 | Monitor, limit, and terminate |
| 4.1 | 3 | Script works correctly |
| 4.2 | 2 | Clean execution with exit code |
| 5.1 | 2 | File operations complete |
| 5.2 | 3 | Configuration saved |
| 6.1 | 3 | Issue identified and fixed |
| 6.2 | 2 | Top process identified |
| **Total** | **30** | |

---

## Results

### Score Calculation

| Task | Score | Max |
|------|-------|-----|
| 1. Navigation | ___ | 5 |
| 2. Glyph Operations | ___ | 5 |
| 3. Process Management | ___ | 5 |
| 4. Scripting | ___ | 5 |
| 5. Integration | ___ | 5 |
| 6. Troubleshooting | ___ | 5 |
| **Total** | ___ | 30 |

### Pass/Fail

- **Pass**: 24+ points (80%+)
- **Partial**: 21-23 points (70-79%)
- **Fail**: <21 points (<70%)

### Recording Results

```bash
# Record your exam results
>>> training record exam --score <your_score>

# Generate certificate if passed
>>> training certificate generate
```

---

## Retake Policy

If you didn't pass:

1. **Review**: Go back to modules for weak areas
2. **Practice**: Complete additional exercises
3. **Wait**: 24 hours before retaking
4. **Retake**: Start fresh exam session

```bash
# Reset exam
>>> training exam reset

# Retake after 24 hours
>>> training exam start
```

---

## Completion

After passing:

```bash
# End exam mode
>>> training exam end
Exam mode deactivated.

# Proceed to post-assessment
>>> training post-assessment start
```

---

*Good luck! Remember: This exam tests practical skills, not memorization.*
