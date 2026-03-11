# Module 2: Basic Operations

> **Duration**: 45 minutes
> **Format**: Hands-on exercises
> **Prerequisites**: Module 1 completed

## Learning Objectives

After completing this module, you will be able to:
- Use complete glyph command syntax
- Navigate efficiently with keyboard shortcuts
- Perform file operations with visual feedback
- Interpret visual output correctly

---

## 2.1 Glyph Command Syntax

### Basic Syntax

Glyph commands follow a simple pattern:

```
<operation> <arguments> <glyph> <more_arguments>
```

### Arithmetic Operations

```bash
# Addition
>>> calc 10 ⊕ 5
15

# Subtraction
>>> calc 10 ⊖ 3
7

# Multiplication
>>> calc 4 ⊗ 7
28

# Division
>>> calc 20 ⊘ 4
5

# Chained operations (left to right)
>>> calc 10 ⊕ 5 ⊗ 2
30  # (10 + 5) * 2 = 30

# Use parentheses for explicit order
>>> calc (10 ⊕ 5) ⊗ 2
30
>>> calc 10 ⊕ (5 ⊗ 2)
20
```

### Memory Operations

```bash
# Store value at address
>>> 42 → 0x1000
OK: Stored 42 at 0x1000
[Visual: Blue dot appears at (16, 0)]

# Load value from address
>>> ← 0x1000
42
[Visual: Blue dot pulses]

# Store multiple values
>>> [1, 2, 3, 4] → 0x2000
OK: Stored 4 values starting at 0x2000
[Visual: Four colored dots appear in sequence]

# Load range
>>> ← 0x2000:4
[1, 2, 3, 4]
[Visual: Four dots pulse in sequence]
```

### Stack Operations

```bash
# Push to stack
>>> 100 ⇒ stack
OK: Pushed 100
[Visual: Stack grows by one unit]

# Pop from stack
>>> ⇐ stack
100
[Visual: Stack shrinks by one unit]

# Push multiple
>>> [10, 20, 30] ⇒ stack
OK: Pushed 3 values

# View stack
>>> stack peek
[10, 20, 30, 100]
```

### Control Flow

```bash
# Loop
>>> ↻ 5 { calc @ ⊕ 1 }
1, 2, 3, 4, 5
[Visual: Counter increments visibly]

# Conditional
>>> if (← 0x1000 > 40) { "Large!" } else { "Small!" }
"Large!"
[Visual: Branch path highlighted]

# Function definition
>>> fn double(x) { x ⊗ 2 }
OK: Function 'double' defined

>>> double(21)
42
```

---

## 2.2 Navigation Techniques

### Filesystem Navigation

```bash
# Current directory
>>> pwd
/home/user/geometry_os

# List contents
>>> ls
docs/  systems/  tests/  config.yaml

# List with details
>>> ls -la
drwxr-xr-x  docs/
drwxr-xr-x  systems/
drwxr-xr-x  tests/
-rw-r--r--  config.yaml (1.2KB)

# Change directory
>>> cd systems
>>> pwd
/home/user/geometry_os/systems

# Go up
>>> cd ..
>>> pwd
/home/user/geometry_os

# Go home
>>> cd ~
>>> pwd
/home/user

# Jump to previous
>>> cd -
>>> pwd
/home/user/geometry_os
```

### Visual Navigation

```bash
# Enable visual mode
>>> visual on

# Navigate to address
>>> visual goto 0x1000
Centered on 0x1000

# Navigate by region
>>> visual goto SHELL
Centered on SHELL region (0x0800 - 0x17FF)

# Zoom controls
>>> visual zoom in
Zoom: 2x
>>> visual zoom out
Zoom: 1x
>>> visual zoom 4
Zoom: 4x

# Pan with arrow keys or:
>>> visual pan up 100
>>> visual pan down 100
>>> visual pan left 100
>>> visual pan right 100

# Follow mode (auto-track activity)
>>> visual follow on
Following active processes
>>> visual follow off
Follow disabled
```

### Keyboard Navigation Shortcuts

| Keys | Action |
|------|--------|
| `h/j/k/l` | Pan left/down/up/right (vim-style) |
| `w/a/s/d` | Pan up/left/down/right (gaming-style) |
| `+/-` | Zoom in/out |
| `g` | Go to address (prompt) |
| `f` | Toggle follow mode |
| `Home` | Go to origin (0x0000) |
| `End` | Go to end of memory |
| `Page Up/Down` | Page through memory regions |

---

## 2.3 File Operations

### Reading Files

```bash
# Display file contents
>>> cat config.yaml
debug_mode: false
log_level: INFO
evolution:
  check_interval_seconds: 60

# Read with line numbers
>>> cat -n config.yaml
1: debug_mode: false
2: log_level: INFO
3: evolution:
4:   check_interval_seconds: 60

# Read specific lines
>>> cat config.yaml:1-3
1: debug_mode: false
2: log_level: INFO
3: evolution:

# Read binary as hex
>>> hexdump my_program.spv | head
0000000: 03 02 23 07 00 00 01 00 0a 00 08 00 14 00 ...
```

### Writing Files

```bash
# Write string to file
>>> "Hello, World!" > hello.txt
OK: Written 13 bytes to hello.txt

# Append to file
>>> "\nGoodbye!" >> hello.txt
OK: Appended 10 bytes

# Write data to file
>>> [1, 2, 3, 4, 5] > numbers.bin
OK: Written 5 values to numbers.bin

# Create directory
>>> mkdir my_project
OK: Created directory my_project

# Copy file
>>> cp config.yaml config.yaml.bak
OK: Copied config.yaml to config.yaml.bak

# Move/rename file
>>> mv config.yaml.bak config.backup.yaml
OK: Moved config.yaml.bak to config.backup.yaml

# Delete file
>>> rm hello.txt
OK: Removed hello.txt
```

### Visual File Operations

```bash
# Visualize file as pixels
>>> visual file my_program.spv
[Visual: File contents rendered as pixel grid]
Size: 4.2KB (1078 pixels)
Regions: Header, Code, Data

# Compare files visually
>>> visual diff file1.bin file2.bin
[Visual: Side-by-side comparison with differences highlighted]
Match: 95.2%
Differences: 52 bytes

# Watch file changes
>>> visual watch config.yaml
Watching config.yaml for changes...
[Visual: File updates appear in real-time]
```

---

## 2.4 Output Interpretation

### Text Output

The shell uses color coding for different output types:

| Color | Meaning | Example |
|-------|---------|---------|
| Green | Success | `OK: File saved` |
| Red | Error | `ERROR: File not found` |
| Yellow | Warning | `WARNING: Low memory` |
| Cyan | Info | `INFO: Process started` |
| White | Data | `42` or `[1, 2, 3]` |
| Gray | Metadata | `bytes: 1024` |

### Visual Output

Visual changes indicate operations:

| Visual Effect | Meaning |
|---------------|---------|
| Blue dot | Data stored |
| Yellow glow | Data accessed |
| Red flash | Error/exception |
| Green pulse | Success |
| Purple wave | Process activity |
| Gray fade | Data deleted |

### Status Indicators

The status bar shows system state:

```
[Glyph Shell v1.0] [CPU: 23%] [MEM: 4.2GB] [●] [net: ✓]
```

| Indicator | Values | Meaning |
|-----------|--------|---------|
| CPU | 0-100% | Processor usage |
| MEM | X.XGB | Memory usage |
| Status | ●/◐/○ | Health (good/warn/error) |
| net | ✓/✗ | Network connectivity |

### Memory Region Colors

| Region | Color | Address Range |
|--------|-------|---------------|
| KERNEL | Blue | 0x0000 - 0x03FF |
| MAILBOX | Yellow | 0x0400 - 0x05FF |
| SHELL | Green | 0x0800 - 0x17FF |
| FILES | Cyan | 0x2000 - 0x5FFF |
| MEMORY | Magenta | 0x8000 - 0xFFFF |
| AGENTS | Orange | 0x10000+ |

---

## 2.5 Practical Exercises

### Exercise 2.5.1: Calculator

Create a simple calculator using glyphs:

```bash
# 1. Calculate 15 + 27
>>> calc 15 ⊕ 27
42

# 2. Calculate 100 - 37
>>> calc 100 ⊖ 37
63

# 3. Calculate 12 * 8
>>> calc 12 ⊗ 8
96

# 4. Calculate 144 / 12
>>> calc 144 ⊘ 12
12

# 5. Complex: (10 + 5) * (20 - 8) / 3
>>> calc (10 ⊕ 5) ⊗ (20 ⊖ 8) ⊘ 3
60
```

### Exercise 2.5.2: Memory Game

Store and retrieve values:

```bash
# 1. Store your age at 0x1000
>>> 35 → 0x1000
OK: Stored 35 at 0x1000

# 2. Store the year at 0x1001
>>> 2026 → 0x1001
OK: Stored 2026 at 0x1001

# 3. Calculate birth year
>>> calc ← 0x1001 ⊖ ← 0x1000
1991

# 4. Store result at 0x1002
>>> calc ← 0x1001 ⊖ ← 0x1000 → 0x1002
OK: Stored 1991 at 0x1002

# 5. Verify all three values
>>> ← 0x1000:3
[35, 2026, 1991]
```

### Exercise 2.5.3: File Explorer

Navigate and explore:

```bash
# 1. Go to geometry_os root
>>> cd ~/geometry_os

# 2. List all directories
>>> ls -d */
docs/  systems/  tests/  examples/  web/

# 3. Check README
>>> cat README.md | head -10
# Geometry OS...

# 4. Find all Python files
>>> find . -name "*.py" | wc -l
156

# 5. Visualize a binary file
>>> visual file gpt_neo_125m_brain.rts.png
[Visual: Neural network weights as colorful image]
```

---

## 2.6 Module Summary

### What You Learned

- ✅ Complete glyph command syntax
- ✅ Efficient navigation techniques
- ✅ File operations with visual feedback
- ✅ Output interpretation

### Key Takeaways

1. **Glyphs**: Use ⊕⊖⊗⊘ for math, →← for memory, ↻ for loops
2. **Navigation**: Combine keyboard shortcuts with visual mode
3. **Files**: All file operations have visual representations
4. **Colors**: Learn the color coding for faster comprehension

### Common Pitfalls

| Issue | Solution |
|-------|----------|
| Glyph not displaying | Ensure UTF-8 terminal support |
| Memory address invalid | Check hex format (0x...) |
| File not found | Use `ls` to verify path |
| Visual mode slow | Reduce zoom level |

### Next Steps

Proceed to [Module 3: Process Management](module_03_process_management.md) to learn:
- Process lifecycle and states
- Visual process monitoring
- Resource management
- Process interactions

---

## Self-Assessment

Before moving on, verify you can:

- [ ] Perform arithmetic with glyphs
- [ ] Store and load values from memory
- [ ] Navigate filesystem and visual space
- [ ] Read and write files
- [ ] Interpret colored output correctly
- [ ] Use at least 5 keyboard shortcuts

### Quick Quiz

1. What glyph stores a value to memory?
2. How do you zoom in visual mode?
3. What color indicates a warning?
4. How do you append to a file?

<details>
<summary>Answers</summary>

1. → (Store glyph)
2. Press `+` or use `visual zoom in`
3. Yellow
4. Use `>>` operator: `"text" >> file.txt`

</details>

---

*[Continue to Module 3: Process Management →](module_03_process_management.md)*
