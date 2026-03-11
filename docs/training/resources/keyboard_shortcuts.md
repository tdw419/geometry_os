# Keyboard Shortcuts: Native Glyph Shell

> Complete reference for all keyboard shortcuts

---

## Global Shortcuts

### Essential

| Keys | Action | Context |
|------|--------|---------|
| `Ctrl+P` | Open command palette | Any |
| `Ctrl+H` | Toggle history panel | Any |
| `Ctrl+L` | Clear screen | Any |
| `Ctrl+C` | Cancel current command | Any |
| `Ctrl+D` | Exit shell | Any |
| `?` | Show help overlay | Any |
| `Esc` | Close overlay/panel | Any |

### Line Editing

| Keys | Action | Description |
|------|--------|-------------|
| `Ctrl+A` | Start of line | Move cursor to beginning |
| `Ctrl+E` | End of line | Move cursor to end |
| `Ctrl+B` | Back one char | Move cursor left |
| `Ctrl+F` | Forward one char | Move cursor right |
| `Ctrl+U` | Clear before cursor | Delete to start |
| `Ctrl+K` | Clear after cursor | Delete to end |
| `Ctrl+W` | Delete word | Delete word before cursor |
| `Ctrl+Y` | Yank | Paste last deleted |
| `Backspace` | Delete char | Delete before cursor |
| `Delete` | Delete char | Delete at cursor |

### History Navigation

| Keys | Action | Description |
|------|--------|-------------|
| `↑` | Previous command | Go back in history |
| `↓` | Next command | Go forward in history |
| `Ctrl+R` | Search history | Reverse incremental search |
| `Ctrl+S` | Search forward | Forward incremental search |
| `Ctrl+O` | Execute and next | Run command, show next |
| `Ctrl+G` | Exit search | Cancel history search |
| `Alt+<` | First command | Go to oldest history |
| `Alt+>` | Last command | Go to newest history |

### Completion

| Keys | Action | Description |
|------|--------|-------------|
| `Tab` | Complete | Autocomplete |
| `Shift+Tab` | Complete backward | Cycle completions reverse |
| `Alt+/` | Complete filename | Filename completion |
| `Alt+$` | Complete variable | Variable completion |
| `Alt+@` | Complete command | Command completion |

---

## Visual Mode Shortcuts

### Navigation

| Keys | Action | Description |
|------|--------|-------------|
| `h` | Pan left | Move view left |
| `j` | Pan down | Move view down |
| `k` | Pan up | Move view up |
| `l` | Pan right | Move view right |
| `w/a/s/d` | Pan | Alternative navigation |
| `Home` | Go to origin | Jump to 0x0000 |
| `End` | Go to end | Jump to end of memory |
| `Page Up` | Page up | Scroll up one page |
| `Page Down` | Page down | Scroll down one page |

### Zoom

| Keys | Action | Description |
|------|--------|-------------|
| `+` | Zoom in | Increase zoom level |
| `-` | Zoom out | Decrease zoom level |
| `0` | Reset zoom | Set zoom to 1.0 |
| `Ctrl+0` | Fit to view | Fit content to window |

### Focus

| Keys | Action | Description |
|------|--------|-------------|
| `g` | Go to address | Prompt for address |
| `f` | Toggle follow | Enable/disable follow mode |
| `p` | Focus process | Focus on process |
| `r` | Focus region | Focus on memory region |

### Display

| Keys | Action | Description |
|------|--------|-------------|
| `v` | Toggle view | Switch view modes |
| `c` | Toggle colors | Change color scheme |
| `i` | Toggle info | Show/hide info overlay |
| `m` | Toggle marks | Show/hide bookmarks |

---

## Command Palette Shortcuts

| Keys | Action | Description |
|------|--------|-------------|
| `Ctrl+P` | Open palette | Open command palette |
| `↑/↓` | Navigate | Select command |
| `Enter` | Execute | Run selected command |
| `Shift+Enter` | Edit | Edit command before running |
| `Tab` | Complete | Complete command name |
| `Esc` | Close | Close palette |

---

## Process Monitor Shortcuts

| Keys | Action | Description |
|------|--------|-------------|
| `t` | Sort by CPU | Sort by CPU usage |
| `m` | Sort by memory | Sort by memory usage |
| `p` | Sort by PID | Sort by process ID |
| `n` | Sort by name | Sort by name |
| `k` | Kill process | Kill selected process |
| `Space` | Tag process | Mark/unmark process |
| `u` | Untag all | Clear all marks |

---

## Editor Shortcuts

| Keys | Action | Description |
|------|--------|-------------|
| `Ctrl+S` | Save | Save file |
| `Ctrl+O` | Open | Open file |
| `Ctrl+W` | Close | Close file |
| `Ctrl+Z` | Undo | Undo last change |
| `Ctrl+Y` | Redo | Redo last undo |
| `Ctrl+F` | Find | Find in file |
| `Ctrl+G` | Go to line | Jump to line number |
| `Ctrl+/` | Comment | Toggle comment |

---

## Panel Shortcuts

| Keys | Action | Description |
|------|--------|-------------|
| `Ctrl+1` | Panel 1 | Focus panel 1 |
| `Ctrl+2` | Panel 2 | Focus panel 2 |
| `Ctrl+3` | Panel 3 | Focus panel 3 |
| `Ctrl+Shift+←/→` | Resize | Resize panel |
| `Ctrl+W` | Close panel | Close current panel |

---

## Custom Shortcuts

### Viewing Custom Shortcuts

```bash
>>> keys list
```

### Creating Custom Shortcuts

```bash
# Add binding
>>> keys bind "Ctrl+Shift+S" "save all"

# Add with mode
>>> keys bind "v:Space" "toggle visual" --mode visual

# Remove binding
>>> keys unbind "Ctrl+Shift+S"
```

### Shortcut Format

```
[Modifier+]Key

Modifiers:
  Ctrl, Shift, Alt, Meta

Keys:
  Letters: A-Z
  Numbers: 0-9
  Special: F1-F12, Space, Enter, Tab, Esc
  Arrows: Up, Down, Left, Right
  Symbols: Plus, Minus, Equal, etc.

Examples:
  Ctrl+P
  Shift+Tab
  Alt+Enter
  Ctrl+Shift+F5
```

---

## Platform Differences

### Linux

| Standard | Alternative |
|----------|-------------|
| `Ctrl` | Works as expected |
| `Alt` | May conflict with window manager |
| `Super` | Usually available |

### macOS

| Standard | macOS |
|----------|-------|
| `Ctrl` | `⌃` (Control) |
| `Alt` | `⌥` (Option) |
| `Shift` | `⇧` (Shift) |
| `Meta` | `⌘` (Command) |

### Windows (WSL)

| Standard | Notes |
|----------|-------|
| `Ctrl` | Works as expected |
| `Alt` | May need configuration |
| `Shift+Insert` | Paste |

---

## Accessibility

### One-Handed Mode

For users who prefer single-hand operation:

```yaml
# ~/.glyph_shell/keybindings.yaml
accessibility:
  one_handed:
    "j": "up"
    "k": "down"
    "l": "left"
    ";": "right"
    "i": "enter"
    "u": "backspace"
```

### Sticky Keys

Enable sticky modifiers:

```bash
>>> config set accessibility.sticky_keys true
```

### Reduced Motion

Disable animations:

```bash
>>> config set effects.transitions false
>>> config set effects.glow false
```

---

## Quick Reference Card

Print this card for your desk:

```
┌─────────────────────────────────────────┐
│  NATIVE GLYPH SHELL - SHORTCUTS         │
├─────────────────────────────────────────┤
│  Ctrl+P  Command Palette                │
│  Ctrl+H  History Panel                  │
│  Ctrl+L  Clear Screen                   │
│  Ctrl+C  Cancel                         │
│  Tab     Autocomplete                   │
│  ?       Help                           │
├─────────────────────────────────────────┤
│  VISUAL MODE                            │
│  h/j/k/l  Pan                           │
│  +/-      Zoom                          │
│  g        Go to address                 │
│  f        Toggle follow                 │
├─────────────────────────────────────────┤
│  HISTORY                                │
│  ↑/↓      Navigate                      │
│  Ctrl+R   Search                        │
└─────────────────────────────────────────┘
```

---

*Keyboard Shortcuts v1.0*
