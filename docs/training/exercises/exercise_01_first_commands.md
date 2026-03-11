# Exercise 1: First Commands

> **Module**: Module 1 - Introduction
> **Duration**: 15 minutes
> **Difficulty**: Beginner

---

## Objectives

By completing this exercise, you will:
- Start the Native Glyph Shell
- Execute basic commands
- Use the help system
- Navigate the interface

---

## Prerequisites

- Geometry OS installed
- Terminal access
- UTF-8 terminal support

---

## Part 1: Starting the Shell

### Task 1.1: Launch the Shell

```bash
# Navigate to Geometry OS directory
cd ~/geometry_os

# Start the Enhanced Glyph Shell
python3 systems/visual_shell/enhanced_glyph_shell.py
```

**Expected Result:**
```
┌─────────────────────────────────────────────────────────────┐
│ [Glyph Shell v1.0] [CPU: 2%] [MEM: 1.2GB] [●]              │
├─────────────────────────────────────────────────────────────┤
│ Welcome to the Native Glyph Shell                           │
│ Type 'help' for available commands, '?' for shortcuts       │
│                                                             │
│ >>> _                                                       │
└─────────────────────────────────────────────────────────────┘
```

### Verification

- [ ] Shell prompt appears (>>>)
- [ ] Status bar is visible
- [ ] No error messages

---

## Part 2: Basic Commands

### Task 2.1: Display Help

```bash
>>> help
```

**Questions:**
1. List 5 commands shown: _____________
2. What command shows processes? _____________

### Task 2.2: Check Identity

```bash
>>> whoami
```

**Expected Result:** Your username is displayed.

### Task 2.3: Navigate Filesystem

```bash
>>> pwd
>>> ls
>>> cd systems
>>> ls
>>> cd ..
>>> pwd
```

**Questions:**
1. What directory did you start in? _____________
2. What subdirectories are in `systems/`? _____________
3. After `cd ..`, where are you? _____________

---

## Part 3: Interface Navigation

### Task 3.1: Use Keyboard Shortcuts

Press each key and observe the result:

| Key | Action | What happened? |
|-----|--------|----------------|
| `?` | Help overlay | |
| `Esc` | Close overlay | |
| `Ctrl+H` | History panel | |
| `Ctrl+L` | Clear screen | |

### Task 3.2: Command History

```bash
>>> echo "first"
>>> echo "second"
>>> echo "third"
```

Now press `↑` three times.

**Question:** What command appears? _____________

### Task 3.3: Autocomplete

```bash
>>> vis<Tab>
```

**Question:** What completions appear? _____________

---

## Part 4: Visual Mode

### Task 4.1: Enable Visual Mode

```bash
>>> visual on
```

**Expected Result:** Visual substrate appears.

### Task 4.2: Navigate Visual Space

```bash
>>> visual goto 0x1000
>>> visual zoom 2
>>> visual zoom 1
```

**Questions:**
1. What do you see at address 0x1000? _____________
2. What changes when you zoom? _____________

### Task 4.3: Disable Visual Mode

```bash
>>> visual off
```

---

## Completion Checklist

- [ ] Started the shell successfully
- [ ] Used `help` command
- [ ] Navigated filesystem with `ls`, `cd`, `pwd`
- [ ] Used keyboard shortcuts (?, Ctrl+H, Ctrl+L)
- [ ] Navigated command history
- [ ] Used autocomplete
- [ ] Enabled and disabled visual mode

---

## Challenge (Optional)

### Challenge 1: Find the Config

Without using `find`, locate the main configuration file.

**Hint:** It's usually named `config.yaml`.

**Answer:**
```bash
>>> _____________
```

### Challenge 2: Create a Screenshot

Take a screenshot of the visual substrate.

```bash
>>> visual on
>>> _____________ screenshot.png
```

---

## Common Issues

| Issue | Solution |
|-------|----------|
| Shell won't start | Check Python version (3.10+) |
| Glyphs display as boxes | Install Nerd Font |
| Visual mode not available | Check GPU support |

---

## Next Steps

After completing this exercise, proceed to:
- [Exercise 2: Navigation](exercise_02_navigation.md)

---

*Exercise 1.0*
