# Native Glyph Shell Training Program

**Version:** 1.0.0  
**Last Updated:** 2026-03-11  
**Audience:** New users, developers, and AI practitioners

---

## Program Overview

This training program is designed to help new users quickly understand and utilize the Native Glyph Shell (G-Shell) - Geometry OS's AI-native terminal interface. The program includes:

- **Self-paced tutorials** with hands-on exercises
- **Quick reference guides** for daily use
- **Interactive exercises** for skill reinforcement
- **Feedback surveys** for continuous improvement

### Learning Objectives

After completing this training, users will be able to:

1. Navigate the G-Shell interface using keyboard shortcuts
2. Use the visual command palette for quick actions
3. Execute Geometry OS commands (`g` prefix)
4. Leverage AI context injection with `gemini` and `claude` commands
5. Understand the Geometric Neural Buffer (GNB) state synchronization
6. Troubleshoot common issues

---

## Module 1: Getting Started (15 minutes)

### Prerequisites

- Python 3.10+ installed
- Geometry OS repository cloned
- Terminal access

### 1.1 Launch the G-Shell

There are three ways to launch the Native Glyph Shell:

```bash
# Method 1: Using the CLI (recommended)
python3 geometry_os_cli.py shell

# Method 2: Direct execution
python3 systems/visual_shell/geos_terminal.py

# Method 3: Enhanced UI version
python3 systems/visual_shell/enhanced_glyph_shell.py
```

### 1.2 Understanding the Interface

When you launch G-Shell, you'll see:

```
--- GEOMETRY OS SHELL (G-Shell) ---
Starting /bin/bash with GNB sync...
Type 'g help' for Geometry OS commands.

user@host:~$ _
```

**Key Components:**

| Component | Description |
|-----------|-------------|
| **Terminal Buffer** | Standard bash interface with enhanced features |
| **GNB Sync** | Automatic state export to `.geometry/gnb_state.ascii` |
| **Status Bar** | Shows current mode, time, and system status |
| **Command Palette** | Quick access to commands (Ctrl+P) |

### 1.3 Your First Commands

Try these commands to verify your setup:

```bash
# Check G-Shell is working
g help

# View current GNB state
cat .geometry/gnb_state.ascii

# List available Geometry OS commands
g --list
```

---

## Module 2: Keyboard Navigation (20 minutes)

### 2.1 Essential Keyboard Shortcuts

The Enhanced Glyph Shell provides powerful keyboard navigation:

| Shortcut | Action | Description |
|----------|--------|-------------|
| `Ctrl+P` | Command Palette | Open visual command selector |
| `Ctrl+H` | History Panel | Toggle command history |
| `Ctrl+L` | Clear Screen | Clear terminal buffer |
| `?` | Help Overlay | Show all keyboard shortcuts |
| `Esc` | Close Overlay | Dismiss any open panel |
| `Tab` | Autocomplete | Complete commands and paths |

### 2.2 Navigation Exercise

Complete this exercise to build muscle memory:

```
Exercise 2.1: Keyboard Navigation Practice
===========================================

1. Press Ctrl+P to open the command palette
2. Type "map" to filter commands
3. Press Enter to execute "g map"
4. Press ? to view help
5. Press Esc to close help
6. Press Ctrl+H to view history
7. Navigate with arrow keys
8. Press Esc to close history
```

### 2.3 Advanced Navigation

For power users:

| Shortcut | Action |
|----------|--------|
| `Ctrl+R` | Reverse search history |
| `Ctrl+A` | Move to line start |
| `Ctrl+E` | Move to line end |
| `Ctrl+U` | Clear line before cursor |
| `Ctrl+K` | Clear line after cursor |
| `Alt+B` | Move back one word |
| `Alt+F` | Move forward one word |

---

## Module 3: Geometry OS Commands (30 minutes)

### 3.1 Command Structure

All Geometry OS commands use the `g` prefix:

```bash
g <command> [arguments] [options]
```

### 3.2 Core Commands Reference

| Command | Description | Example |
|---------|-------------|---------|
| `g help` | Show command help | `g help` |
| `g map <x> <y>` | Pan infinite map | `g map 2048 2048` |
| `g spawn` | Create terminal tile | `g spawn` |
| `g gls [path]` | Geometric ls with entropy | `g gls /home` |
| `g ai <prompt>` | Write to AI intent file | `g ai "optimize this"` |
| `g status` | Show system status | `g status` |
| `g version` | Show G-Shell version | `g version` |

### 3.3 Hands-On Exercises

```
Exercise 3.1: Map Navigation
============================

1. Navigate to coordinates (1024, 1024):
   $ g map 1024 1024

2. Check current position:
   $ g status

3. Navigate to origin:
   $ g map 0 0

Exercise 3.2: Geometric File Listing
====================================

1. List current directory with entropy:
   $ g gls

2. List a specific path:
   $ g gls /tmp

3. Compare with standard ls:
   $ ls -la
   $ g gls

Exercise 3.3: Terminal Tiles
============================

1. Spawn a terminal tile on the infinite map:
   $ g spawn

2. Check tile status:
   $ g status

3. List all active tiles:
   $ g tiles
```

---

## Module 4: AI Context Injection (25 minutes)

### 4.1 Understanding AI Context

G-Shell automatically provides terminal context to AI assistants:

```
Traditional Terminal:
  User → Copy error → Paste to AI → AI responds

G-Shell:
  User → Type question → AI sees screen → AI responds with context
```

### 4.2 Using AI Commands

The shell intercepts `gemini` and `claude` commands:

```bash
# Ask Gemini with automatic context
gemini "why did this fail?"

# Ask Claude with automatic context
claude "optimize this code"
```

**What the AI receives:**

```
CONTEXT (Terminal Screen):
$ ./run_broken_script.sh
ERROR: Connection refused on port 8767
$ _

USER REQUEST: why did this fail?
NOTE: You are inside G-Shell. Use the context above.
```

### 4.3 AI Workflow Exercise

```
Exercise 4.1: Debugging with AI Context
========================================

1. Run a failing command:
   $ ./some_failing_script.sh

2. Ask AI about the error:
   $ gemini "what's wrong with this error?"

3. Observe that AI receives the full context

Exercise 4.2: Code Optimization
===============================

1. Run a slow command:
   $ python3 slow_script.py

2. Ask for optimization:
   $ claude "how can I make this faster?"

3. Review AI's context-aware suggestions
```

### 4.4 Intent File System

For structured AI requests:

```bash
# Write an intent for the AI to process
g ai "analyze the memory usage in /tmp"

# View the intent file
cat .geometry/intent/last_ai_request.json
```

---

## Module 5: GNB State Synchronization (20 minutes)

### 5.1 What is GNB?

The **Geometric Neural Buffer (GNB)** is a state file that captures your terminal:

- Location: `.geometry/gnb_state.ascii`
- Update frequency: Every 0.5 seconds (configurable)
- Contains: Screen buffer, cursor position, metadata

### 5.2 Reading GNB State

```bash
# View current state
cat .geometry/gnb_state.ascii

# Watch state in real-time
watch -n 0.5 cat .geometry/gnb_state.ascii
```

**GNB File Format:**

```
--- GEOMETRIC NEURAL BUFFER (GNB) ---
Cursor: (5, 12) | Size: 24x80
Timestamp: 1710123456.789
-------------------------------------
user@host:~$ g help
Available commands:
  g map   - Navigate infinite map
  g spawn - Create terminal tile
...
```

### 5.3 GNB for External Tools

External AI tools can read GNB state:

```python
# Example: Python script reading GNB
from pathlib import Path

gnb_path = Path(".geometry/gnb_state.ascii")
state = gnb_path.read_text()
print(f"Terminal state:\n{state}")
```

### 5.4 GNB Exercise

```
Exercise 5.1: GNB Exploration
=============================

1. Open a new terminal
2. Run: watch -n 0.5 cat .geometry/gnb_state.ascii
3. Return to G-Shell
4. Type some commands
5. Observe the GNB updating in real-time
```

---

## Module 6: Advanced Features (30 minutes)

### 6.1 Visual Command Palette

Press `Ctrl+P` to access the visual command palette:

```
┌─────────────────────────────────────┐
│ > _                                 │
├─────────────────────────────────────┤
│ g map     - Navigate infinite map   │
│ g spawn   - Create terminal tile    │
│ g gls     - Geometric file listing  │
│ g ai      - AI intent command       │
│ g status  - Show system status      │
└─────────────────────────────────────┘
```

**Navigation:**
- Type to filter
- Arrow keys to select
- Enter to execute
- Esc to cancel

### 6.2 History Panel

Press `Ctrl+H` to view command history:

```
┌── Command History ──────────────────┐
│ 1. g map 1024 1024                  │
│ 2. g gls /home                      │
│ 3. gemini "debug this"              │
│ 4. g spawn                          │
└─────────────────────────────────────┘
```

### 6.3 Enhanced Output Formatting

The Enhanced Glyph Shell provides color-coded output:

| Color | Meaning |
|-------|---------|
| 🟢 Green | Success |
| 🟡 Yellow | Warning |
| 🔴 Red | Error |
| 🔵 Blue | Information |
| 🟣 Purple | AI-related |

### 6.4 Customization

Create a configuration file at `~/.gshell/config.yaml`:

```yaml
# G-Shell Configuration
terminal:
  rows: 36
  cols: 120
  font: "JetBrains Mono"
  font_size: 14

gnb:
  sync_interval: 0.5
  path: ".geometry/gnb_state.ascii"

ai:
  auto_context: true
  providers:
    - gemini
    - claude

shortcuts:
  command_palette: "ctrl+p"
  history: "ctrl+h"
  help: "?"
```

---

## Module 7: Troubleshooting (15 minutes)

### 7.1 Common Issues

| Issue | Solution |
|-------|----------|
| **G-Shell won't start** | Check Python version: `python3 --version` |
| **GNB not updating** | Verify `.geometry/` directory exists |
| **AI commands not working** | Ensure `gemini` or `claude` CLI is installed |
| **Commands not found** | Check `g` prefix: use `g help` not `help` |
| **Terminal size wrong** | Check `stty size` and resize window |

### 7.2 Diagnostic Commands

```bash
# Check G-Shell status
g status --verbose

# Verify GNB sync
ls -la .geometry/gnb_state.ascii

# Test AI integration
g ai "test connection"

# View logs
tail -f ~/.gshell/logs/gshell.log
```

### 7.3 Getting Help

- **In-shell help:** Press `?` or type `g help`
- **Documentation:** `docs/training/` directory
- **Community:** Geometry OS Discord/IRC
- **Issues:** GitHub Issues

---

## Assessment

### Knowledge Check Quiz

Complete this quiz to test your understanding:

1. What key combination opens the command palette?
   - [ ] Ctrl+H
   - [ ] Ctrl+P ✓
   - [ ] Ctrl+L
   - [ ] ?

2. What command navigates the infinite map?
   - [ ] g nav
   - [ ] g move
   - [ ] g map ✓
   - [ ] g go

3. What file contains the terminal state for AI?
   - [ ] .geometry/state.txt
   - [ ] .geometry/gnb_state.ascii ✓
   - [ ] .gshell/state.bin
   - [ ] /tmp/gnb.state

4. How often does GNB sync by default?
   - [ ] Every 1 second
   - [ ] Every 0.5 seconds ✓
   - [ ] Every 2 seconds
   - [ ] On every keystroke

5. What prefix do Geometry OS commands use?
   - [ ] geo
   - [ ] gos
   - [ ] g ✓
   - [ ] geometry

### Practical Assessment

Complete these tasks to demonstrate proficiency:

- [ ] Launch G-Shell successfully
- [ ] Navigate to map coordinates (500, 500)
- [ ] Use `g gls` to list files with entropy
- [ ] Open and close the command palette
- [ ] View command history
- [ ] Execute an AI context-aware command
- [ ] Read and understand GNB state file

---

## Feedback Survey

After completing the training, please fill out the feedback survey:

```bash
# Launch feedback survey
python3 scripts/training_feedback_survey.py
```

Or complete online at: `https://geometry.os/training/feedback`

**Survey Questions:**

1. How would you rate the overall training program? (1-5)
2. Which module was most helpful?
3. Which module needs improvement?
4. Were the exercises practical and relevant?
5. What additional topics should be covered?
6. How long did it take to complete the training?
7. Any suggestions for improvement?

---

## Additional Resources

### Documentation
- [README.md](../../README.md) - Project overview
- [QUICKSTART.md](../../QUICKSTART.md) - Quick start guide
- [API_REFERENCE.md](../API_REFERENCE.md) - API documentation

### Video Tutorials
- Introduction to G-Shell (5 min)
- Advanced Navigation Techniques (10 min)
- AI Context Integration Deep Dive (15 min)

### Community
- Discord: `discord.gg/geometry-os`
- IRC: `#geometry-os` on Libera.Chat
- GitHub Discussions: `github.com/geometry-os/discussions`

---

## Training Completion Certificate

Upon successful completion of all modules and the practical assessment, users can generate a completion certificate:

```bash
python3 scripts/generate_training_certificate.py --user "$USER" --completed
```

---

**Thank you for completing the Native Glyph Shell Training Program!**

*This training program is continuously improved based on user feedback. Please share your experience.*
