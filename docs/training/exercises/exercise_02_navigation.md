# Exercise 2: Navigation

> **Module**: Module 2 - Basic Operations
> **Duration**: 20 minutes
> **Difficulty**: Beginner

---

## Objectives

By completing this exercise, you will:
- Navigate efficiently with keyboard shortcuts
- Use visual navigation features
- Create bookmarks and marks
- Use the command palette

---

## Prerequisites

- Completed Exercise 1
- Shell running

---

## Part 1: Filesystem Navigation

### Task 1.1: Directory Operations

```bash
>>> cd ~
>>> ls -la
>>> mkdir -p ~/training_test/subdir
>>> cd ~/training_test
>>> touch file1.txt file2.txt
>>> ls
>>> cd subdir
>>> pwd
>>> cd ../..
>>> rm -rf training_test
```

**Questions:**
1. What does `-la` do in `ls -la`? _____________
2. What does `-p` do in `mkdir -p`? _____________
3. After `cd ../..`, where are you? _____________

### Task 1.2: Quick Navigation

```bash
>>> cd /tmp
>>> cd -
>>> cd ~
>>> cd -
```

**Question:** What does `cd -` do? _____________

### Task 1.3: Find Files

```bash
>>> cd ~/geometry_os
>>> find . -name "*.py" -type f | head -5
>>> find . -name "config*" -type f
```

**Questions:**
1. How many Python files are in geometry_os? _____________
2. Where is config.yaml located? _____________

---

## Part 2: Visual Navigation

### Task 2.1: Visual Mode Basics

```bash
>>> visual on
```

Use keyboard navigation (h/j/k/l or arrow keys) to explore.

### Task 2.2: Address Navigation

```bash
>>> visual goto 0x0000
>>> visual goto 0x8000
>>> visual goto SHELL
>>> visual goto MEMORY
```

**Questions:**
1. What region is at 0x0000? _____________
2. What region is at 0x8000? _____________

### Task 2.3: Zoom Navigation

```bash
>>> visual zoom 4
>>> visual zoom 1
>>> visual zoom 0.5
>>> visual zoom 1
```

**Question:** How does zoom affect what you see? _____________

### Task 2.4: Follow Mode

```bash
>>> visual follow on
# Start a process to see following
>>> run examples/cli_preview.py &
# Watch the view follow the process
>>> visual follow off
>>> kill <pid>
```

---

## Part 3: Bookmarks and Marks

### Task 3.1: Create Bookmarks

```bash
>>> visual mark set kernel 0x0000
>>> visual mark set shell_start 0x0800
>>> visual mark set my_region 0x1000
>>> visual mark list
```

### Task 3.2: Use Bookmarks

```bash
>>> visual mark goto kernel
>>> visual mark goto my_region
```

### Task 3.3: Remove Bookmarks

```bash
>>> visual mark delete my_region
>>> visual mark list
```

---

## Part 4: Command Palette

### Task 4.1: Open Command Palette

Press `Ctrl+P`

**Task:** Find and execute the "Clear Screen" command.

### Task 4.2: Fuzzy Search

Press `Ctrl+P` and type "proc"

**Questions:**
1. How many commands match "proc"? _____________
2. What are they? _____________

### Task 4.3: Recent Commands

Press `Ctrl+P` and look at recent commands.

**Question:** What are your 3 most recent commands? _____________

---

## Part 5: History Navigation

### Task 5.1: Basic History

```bash
>>> echo "command 1"
>>> echo "command 2"
>>> echo "command 3"
```

Press `↑` repeatedly, then `↓`.

### Task 5.2: History Search

Press `Ctrl+R` and type "echo"

**Question:** What appears? _____________

### Task 5.3: History Commands

```bash
>>> history
>>> history search echo
>>> history clear
```

**Questions:**
1. How many commands were in history? _____________
2. What does `history search` do? _____________

---

## Completion Checklist

- [ ] Navigated filesystem with cd, ls, find
- [ ] Used visual navigation (goto, zoom, follow)
- [ ] Created and used bookmarks
- [ ] Used command palette (Ctrl+P)
- [ ] Navigated and searched history

---

## Challenge (Optional)

### Challenge 1: Memory Map

Create a complete map of memory regions with bookmarks.

```bash
>>> visual mark set kernel_start _____________
>>> visual mark set kernel_end _____________
>>> visual mark set shell_start _____________
>>> visual mark set shell_end _____________
>>> visual mark set files_start _____________
>>> visual mark set files_end _____________
```

### Challenge 2: Efficient Path

Navigate from 0x0000 to 0xFFFF using only keyboard shortcuts (no `visual goto`).

Time yourself: _____ seconds

---

## Common Issues

| Issue | Solution |
|-------|----------|
| Can't find file | Use `find` with correct pattern |
| Visual navigation slow | Enable foveated rendering |
| Bookmarks not saving | Check write permissions |

---

## Next Steps

After completing this exercise, proceed to:
- [Exercise 3: Process Management](exercise_03_process_mgmt.md)

---

*Exercise 2.0*
