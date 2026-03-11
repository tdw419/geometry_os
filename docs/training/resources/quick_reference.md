# Quick Reference: Native Glyph Shell

> Keep this handy for daily use

---

## Essential Commands

### Navigation

| Command | Description |
|---------|-------------|
| `ls` | List directory contents |
| `ls -la` | List with details |
| `cd <dir>` | Change directory |
| `cd ~` | Go home |
| `cd ..` | Go up |
| `pwd` | Print working directory |

### Files

| Command | Description |
|---------|-------------|
| `cat <file>` | Display file |
| `head <file>` | First 10 lines |
| `tail <file>` | Last 10 lines |
| `write <file> <content>` | Write to file |
| `append <file> <content>` | Append to file |
| `cp <src> <dest>` | Copy file |
| `mv <src> <dest>` | Move/rename |
| `rm <file>` | Remove file |
| `mkdir <dir>` | Create directory |

### Processes

| Command | Description |
|---------|-------------|
| `ps` | List processes |
| `ps -a` | All processes |
| `top` | Real-time monitor |
| `run <program>` | Run program |
| `run <program> &` | Run in background |
| `kill <pid>` | Terminate process |
| `kill -9 <pid>` | Force kill |
| `killall <name>` | Kill by name |

### Visual

| Command | Description |
|---------|-------------|
| `visual on` | Enable visual mode |
| `visual off` | Disable visual mode |
| `visual goto <addr>` | Go to address |
| `visual zoom <level>` | Set zoom |
| `visual follow on/off` | Toggle follow |

---

## Glyph Reference

### Arithmetic

| Glyph | Name | Example | Result |
|-------|------|---------|--------|
| ⊕ | Add | `5 ⊕ 3` | 8 |
| ⊖ | Subtract | `5 ⊖ 3` | 2 |
| ⊗ | Multiply | `5 ⊗ 3` | 15 |
| ⊘ | Divide | `6 ⊘ 3` | 2 |

### Memory

| Glyph | Name | Example | Description |
|-------|------|---------|-------------|
| → | Store | `42 → 0x1000` | Write to address |
| ← | Load | `← 0x1000` | Read from address |
| ⇒ | Push | `val ⇒ stack` | Push to stack |
| ⇐ | Pop | `⇐ stack` | Pop from stack |

### Control

| Glyph | Name | Example | Description |
|-------|------|---------|-------------|
| ↻ | Loop | `↻ 5 { ... }` | Repeat N times |
| ↺ | Return | `↺ value` | Return from function |
| ⤻ | Jump | `⤻ label` | Jump to label |

---

## Keyboard Shortcuts

### Essential

| Keys | Action |
|------|--------|
| `Ctrl+P` | Command palette |
| `Ctrl+H` | History panel |
| `Ctrl+L` | Clear screen |
| `Ctrl+C` | Cancel command |
| `Ctrl+D` | Exit shell |
| `Tab` | Autocomplete |
| `?` | Help overlay |
| `Esc` | Close overlay |

### Navigation

| Keys | Action |
|------|--------|
| `↑/↓` | Command history |
| `Ctrl+R` | Search history |
| `Ctrl+A` | Start of line |
| `Ctrl+E` | End of line |
| `h/j/k/l` | Pan (visual mode) |
| `+/-` | Zoom (visual mode) |

---

## Memory Regions

| Region | Address Range | Color |
|--------|---------------|-------|
| KERNEL | 0x0000 - 0x03FF | Blue |
| MAILBOX | 0x0400 - 0x05FF | Yellow |
| SHELL | 0x0800 - 0x17FF | Green |
| FILES | 0x2000 - 0x5FFF | Cyan |
| MEMORY | 0x8000 - 0xFFFF | Magenta |
| AGENTS | 0x10000+ | Orange |

---

## Process States

| State | Visual | Meaning |
|-------|--------|---------|
| CREATED | Yellow pulse | Initializing |
| RUNNING | Green glow | Active |
| WAITING | Blue dim | Blocked |
| DONE | Gray static | Completed |
| ERROR | Red flash | Failed |

---

## Output Colors

| Color | Meaning |
|-------|---------|
| Green | Success |
| Red | Error |
| Yellow | Warning |
| Cyan | Info |
| White | Data |
| Gray | Metadata |

---

## Common Patterns

### Store and Calculate

```bash
>>> 10 → 0x1000
>>> 20 → 0x1001
>>> calc ← 0x1000 ⊕ ← 0x1001
30
```

### Loop Example

```bash
>>> ↻ 5 with i { print(i) }
0
1
2
3
4
```

### File Processing

```bash
>>> files = find_files(".")
>>> foreach f in files { print(f) }
```

### Process Management

```bash
>>> run ./program.spv &
>>> ps | grep program
>>> kill <pid>
```

---

## Configuration

### Set Config

```bash
>>> config set visual.default_zoom 2.0
```

### Create Alias

```bash
>>> alias ll "ls -la"
>>> alias save
```

### Custom Shortcut

```bash
>>> keys bind "F5" "clear"
```

---

## Troubleshooting

| Problem | Solution |
|---------|----------|
| Glyphs not showing | Check UTF-8 terminal |
| Command not found | Check PATH, install command |
| Process won't die | Use `kill -9` |
| High memory | Check with `memory` |
| Slow performance | Enable foveated rendering |

---

## Getting Help

| Method | Command |
|--------|---------|
| In-shell help | `?` or `help` |
| Command help | `help <command>` |
| Documentation | `docs` |
| Version | `version` |

---

*Quick Reference v1.0*
