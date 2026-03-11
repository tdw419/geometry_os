# Module 1: Introduction to Native Glyph Shell

> **Duration**: 30 minutes
> **Format**: Interactive reading + hands-on exploration
> **Prerequisites**: Geometry OS installed

## Learning Objectives

After completing this module, you will be able to:
- Explain what the Native Glyph Shell is and why it exists
- Describe core concepts: glyphs, visual state, and spatial memory
- Navigate the shell interface
- Execute your first commands

---

## 1.1 What is the Native Glyph Shell?

The Native Glyph Shell is a revolutionary command-line interface that combines traditional terminal operations with visual computing. Unlike conventional terminals that only display text, the Native Glyph Shell renders computation as visual geometry.

### Key Differentiators

| Feature | Traditional Terminal | Native Glyph Shell |
|---------|---------------------|-------------------|
| Output | Text only | Text + Visual geometry |
| Memory | Abstract addresses | Spatial (Hilbert curve) |
| Processes | Text listings | Visual representations |
| Navigation | Linear commands | Spatial exploration |
| Feedback | Text messages | Visual state changes |

### Why Visual Computing?

**Problem**: Traditional terminals hide system state behind text, requiring users to run multiple commands to understand what's happening.

**Solution**: The Native Glyph Shell makes state visible. You can see:
- Memory usage as colored regions
- Process activity as animated patterns
- System health as visual indicators
- Data flow as connecting lines

### The Philosophy

> "The screen IS the hard drive. State as visual geometry. Computation as pixels."

In Geometry OS, every computation is a visual transformation. The shell is your window into this visual world.

---

## 1.2 Core Concepts

### Glyphs: Visual Operators

Glyphs are visual symbols that represent operations. Instead of typing `add`, you use `⊕`.

#### Arithmetic Glyphs

| Glyph | Name | Operation | Example |
|-------|------|-----------|---------|
| ⊕ | Plus | Addition | `5 ⊕ 3` = 8 |
| ⊖ | Minus | Subtraction | `5 ⊖ 3` = 2 |
| ⊗ | Times | Multiplication | `5 ⊗ 3` = 15 |
| ⊘ | Divide | Division | `6 ⊘ 3` = 2 |

#### Memory Glyphs

| Glyph | Name | Operation | Example |
|-------|------|-----------|---------|
| → | Store | Write to memory | `value → address` |
| ← | Load | Read from memory | `address ← value` |
| ⇒ | Push | Stack write | `value ⇒ stack` |
| ⇐ | Pop | Stack read | `stack ⇐ value` |

#### Control Glyphs

| Glyph | Name | Operation | Example |
|-------|------|-----------|---------|
| ↻ | Loop | Iteration | `↻ n { body }` |
| ↺ | Return | Exit function | `↺ value` |
| ⤻ | Jump | Unconditional branch | `⤻ label` |

### Visual State

Every operation affects visual state. When you store a value, you see it appear as a colored region. When you load, you see the color flow to your output.

**Example Visual Feedback**:
```
>>> 42 → 0x1000
```
Result: A blue region appears at position (16, 0) on the visual substrate.

### Spatial Memory (Hilbert Layout)

Memory is organized using Hilbert curves - fractal patterns that keep related data visually close.

```
Traditional Memory: 0→1→2→3→4→5→6→7 (linear)
Hilbert Memory:     0→1→3→2→6→7→5→4 (fractal)
```

**Visual Layout**:
```
┌───┬───┐
│ 0 │ 1 │
├───┼───┤     Traditional: 0,1,2,3 are adjacent
│ 3 │ 2 │     Hilbert: 0,1,3,2 form a path
└───┴───┘
```

---

## 1.3 Interface Overview

### Starting the Shell

```bash
# Start the Enhanced Glyph Shell
python3 systems/visual_shell/enhanced_glyph_shell.py

# Or use the native terminal
python3 systems/visual_shell/geos_terminal.py
```

### Interface Components

```
┌─────────────────────────────────────────────────────────────────┐
│ Status Bar: [Glyph Shell v1.0] [CPU: 23%] [MEM: 4.2GB] [●]     │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  Output Region                                                  │
│  ─────────────────────────────────────────────────────         │
│  >>> help                                                       │
│  Available commands: ls, cd, cat, run, glyph, help, exit       │
│  >>>                                                            │
│                                                                 │
├─────────────────────────────────────────────────────────────────┤
│ Input: >>> _                                                    │
└─────────────────────────────────────────────────────────────────┘
│ History Panel (Ctrl+H to toggle)                                │
│ ────────────────────────────────────────────────────────────── │
│ 1. help                                                         │
│ 2. ls -la                                                       │
│ 3. glyph list                                                   │
└─────────────────────────────────────────────────────────────────┘
```

### Status Bar Indicators

| Indicator | Meaning |
|-----------|---------|
| `[●]` | System healthy (green) |
| `[◐]` | Warning state (yellow) |
| `[○]` | Error state (red) |
| `CPU: X%` | Current CPU usage |
| `MEM: X.XGB` | Current memory usage |

### Keyboard Shortcuts

Press `?` at any time to see available shortcuts:

| Key | Action |
|-----|--------|
| `Ctrl+P` | Open command palette |
| `Ctrl+H` | Toggle history panel |
| `Ctrl+L` | Clear screen |
| `?` | Show help overlay |
| `Esc` | Close overlays |
| `Tab` | Autocomplete |
| `↑/↓` | Command history |

---

## 1.4 Your First Commands

### Exercise 1.4.1: Basic Interaction

Let's run some basic commands:

```bash
# 1. Check you're in the shell
>>> whoami
geometry_os_user

# 2. List available commands
>>> help
Available commands:
  help     - Show this help message
  ls       - List files and directories
  cd       - Change directory
  cat      - Display file contents
  run      - Execute a program
  glyph    - Glyph operations
  ps       - Process status
  exit     - Exit the shell

# 3. Navigate filesystem
>>> ls
docs/  systems/  tests/  config.yaml

>>> cd systems
>>> ls
visual_shell/  evolution_daemon/  hypervisor/

# 4. Return home
>>> cd ~
```

### Exercise 1.4.2: Using Glyphs

Try glyph operations:

```bash
# List available glyphs
>>> glyph list
Arithmetic: ⊕ ⊖ ⊗ ⊘
Memory: → ← ⇒ ⇐
Control: ↻ ↺ ⤻

# Perform a calculation
>>> calc 5 ⊕ 3
Result: 8

# Store a value
>>> store 42 → 0x1000
Stored 42 at 0x1000
[Visual: Blue region appears at (16,0)]

# Load a value
>>> load 0x1000
Value: 42
[Visual: Blue region glows briefly]
```

### Exercise 1.4.3: Visual Exploration

Explore the visual substrate:

```bash
# Open visual view
>>> visual on
Visual substrate enabled

# Navigate the visual space
>>> visual goto 0x1000
Centered on address 0x1000

# See memory regions
>>> visual regions
KERNEL  : 0x0000 - 0x03FF (blue)
MAILBOX : 0x0400 - 0x05FF (yellow)
SHELL   : 0x0800 - 0x17FF (green)
FILES   : 0x2000 - 0x5FFF (cyan)
MEMORY  : 0x8000 - 0xFFFF (magenta)

# Disable visual view
>>> visual off
Visual substrate disabled
```

---

## 1.5 Module Summary

### What You Learned

- ✅ What the Native Glyph Shell is and why it's different
- ✅ Core concepts: glyphs, visual state, spatial memory
- ✅ Interface components and navigation
- ✅ Basic commands and first interactions

### Key Takeaways

1. **Visual Computing**: Everything you do creates visual feedback
2. **Glyphs**: Use visual symbols for operations
3. **Spatial Memory**: Memory is organized as a fractal pattern
4. **Immediate Feedback**: You see results as visual changes

### Next Steps

Proceed to [Module 2: Basic Operations](module_02_basic_operations.md) to learn:
- Complete glyph command syntax
- Navigation techniques
- File operations with visual feedback
- Output interpretation

---

## Self-Assessment

Before moving on, verify you can:

- [ ] Start the Native Glyph Shell
- [ ] Navigate the interface (input, output, status bar)
- [ ] Use basic commands (help, ls, cd)
- [ ] Execute a glyph operation
- [ ] Enable/disable visual view
- [ ] Use keyboard shortcuts (Ctrl+P, Ctrl+H, ?)

### Quick Quiz

1. What glyph represents addition?
2. How is memory organized in Geometry OS?
3. What does pressing `?` do?
4. What color indicates a healthy system?

<details>
<summary>Answers</summary>

1. ⊕ (Plus glyph)
2. Using Hilbert curves (fractal/spatial pattern)
3. Shows the help overlay with keyboard shortcuts
4. Green (●)

</details>

---

*[Continue to Module 2: Basic Operations →](module_02_basic_operations.md)*
