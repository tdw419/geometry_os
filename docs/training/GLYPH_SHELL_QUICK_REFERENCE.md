# Native Glyph Shell Quick Reference Card

**Version:** 1.0 | **Last Updated:** 2026-03-11

---

## Launching G-Shell

```bash
# Recommended method
python3 geometry_os_cli.py shell

# Direct execution
python3 systems/visual_shell/geos_terminal.py

# Enhanced UI version
python3 systems/visual_shell/enhanced_glyph_shell.py
```

---

## Keyboard Shortcuts

### Essential Shortcuts

| Shortcut | Action |
|----------|--------|
| `Ctrl+P` | Open command palette |
| `Ctrl+H` | Toggle history panel |
| `Ctrl+L` | Clear screen |
| `?` | Show help overlay |
| `Esc` | Close any overlay |
| `Tab` | Autocomplete |

### Navigation

| Shortcut | Action |
|----------|--------|
| `Ctrl+R` | Search history |
| `Ctrl+A` | Line start |
| `Ctrl+E` | Line end |
| `Ctrl+U` | Clear before cursor |
| `Ctrl+K` | Clear after cursor |
| `Alt+B` | Word back |
| `Alt+F` | Word forward |

---

## Geometry OS Commands (`g` prefix)

### Core Commands

| Command | Description | Example |
|---------|-------------|---------|
| `g help` | Show help | `g help` |
| `g version` | Show version | `g version` |
| `g status` | System status | `g status` |

### Map Navigation

| Command | Description | Example |
|---------|-------------|---------|
| `g map <x> <y>` | Navigate to coordinates | `g map 2048 2048` |
| `g spawn` | Create terminal tile | `g spawn` |
| `g tiles` | List active tiles | `g tiles` |

### File Operations

| Command | Description | Example |
|---------|-------------|---------|
| `g gls [path]` | Geometric ls with entropy | `g gls /home` |

### AI Integration

| Command | Description | Example |
|---------|-------------|---------|
| `g ai <prompt>` | Write AI intent | `g ai "optimize this"` |
| `gemini "<prompt>"` | Ask Gemini with context | `gemini "why did this fail?"` |
| `claude "<prompt>"` | Ask Claude with context | `claude "debug this"` |

---

## GNB (Geometric Neural Buffer)

### Location
```
.geometry/gnb_state.ascii
```

### Update Frequency
- Default: Every 0.5 seconds
- Configurable in `~/.gshell/config.yaml`

### View State
```bash
cat .geometry/gnb_state.ascii
watch -n 0.5 cat .geometry/gnb_state.ascii  # Real-time
```

### AI Intent File
```
.geometry/intent/last_ai_request.json
```

---

## Configuration

### Config File Location
```
~/.gshell/config.yaml
```

### Example Configuration
```yaml
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

## Troubleshooting

### Quick Diagnostics

```bash
# Check status
g status --verbose

# Verify GNB sync
ls -la .geometry/gnb_state.ascii

# Check Python version
python3 --version  # Needs 3.10+

# View logs
tail -f ~/.gshell/logs/gshell.log
```

### Common Issues

| Issue | Solution |
|-------|----------|
| Won't start | Check Python 3.10+ |
| GNB not updating | Verify `.geometry/` exists |
| AI commands fail | Install `gemini` or `claude` CLI |
| Commands not found | Use `g` prefix |
| Wrong terminal size | Run `stty size`, resize window |

---

## Color Coding

| Color | Meaning |
|-------|---------|
| 🟢 Green | Success |
| 🟡 Yellow | Warning |
| 🔴 Red | Error |
| 🔵 Blue | Information |
| 🟣 Purple | AI-related |

---

## Workflow Examples

### Debug with AI Context
```bash
$ ./run_script.sh
ERROR: Connection refused on port 8767
$ gemini "why did this fail?"
# AI sees the error automatically
```

### Navigate Infinite Map
```bash
$ g map 1024 1024    # Go to coordinates
$ g spawn            # Create tile
$ g status           # Check position
```

### File Analysis with Entropy
```bash
$ g gls              # Current directory
$ g gls /var/log     # Specific path
```

---

## Getting Help

| Method | Command/Location |
|--------|------------------|
| In-shell | Press `?` or `g help` |
| Docs | `docs/training/NATIVE_GLYPH_SHELL_TRAINING_PROGRAM.md` |
| Tutorial | `python3 scripts/glyph_shell_tutorial.py` |
| Feedback | `python3 scripts/training_feedback_survey.py` |
| Community | Discord: `discord.gg/geometry-os` |

---

## Training Resources

| Resource | Location |
|----------|----------|
| Full Training Program | `docs/training/NATIVE_GLYPH_SHELL_TRAINING_PROGRAM.md` |
| Interactive Tutorial | `scripts/glyph_shell_tutorial.py` |
| Feedback Survey | `scripts/training_feedback_survey.py` |
| This Quick Reference | `docs/training/GLYPH_SHELL_QUICK_REFERENCE.md` |

---

**Print this card:** `cat docs/training/GLYPH_SHELL_QUICK_REFERENCE.md | lp`

**Keep it handy while learning!**
