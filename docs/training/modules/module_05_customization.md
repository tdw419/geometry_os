# Module 5: Customization

> **Duration**: 30 minutes
> **Format**: Self-paced exploration
> **Prerequisites**: Module 4 completed

## Learning Objectives

After completing this module, you will be able to:
- Configure the shell environment
- Create and apply custom themes
- Define keyboard shortcuts
- Optimize your workflow

---

## 5.1 Environment Configuration

### Configuration Files

The Native Glyph Shell uses several configuration files:

```
~/.glyph_shell/
├── config.yaml         # Main configuration
├── aliases.yaml        # Saved aliases
├── theme.yaml          # Custom theme
├── keybindings.yaml    # Custom keybindings
├── history             # Command history
└── commands/           # Custom commands
    └── *.gs
```

### Main Configuration

```yaml
# ~/.glyph_shell/config.yaml

# Shell behavior
shell:
  prompt: ">>> "
  continuation_prompt: "... "
  history_size: 10000
  auto_save_history: true
  completion_style: "fuzzy"  # exact, fuzzy, prefix
  
# Visual settings
visual:
  enabled: true
  default_zoom: 1.0
  foveated_rendering: true
  foveal_radius: 200
  fps_target: 60
  
# Memory settings
memory:
  default_region: "SHELL"
  auto_expand: true
  max_size: 1GB
  
# Editor
editor:
  default: "vim"
  line_numbers: true
  syntax_highlight: true
  
# Paths
paths:
  commands: ["~/.glyph_shell/commands", "./scripts"]
  scripts: ["~/.glyph_shell/scripts"]
  
# Logging
logging:
  level: "INFO"
  file: "~/.glyph_shell/shell.log"
  max_size: 10MB
  backup_count: 5
```

### Environment Variables

```bash
# Set environment variables
>>> export GEOMETRY_OS_DEBUG=1
>>> export LM_STUDIO_URL=http://localhost:1234/v1

# View environment
>>> env
GEOMETRY_OS_DEBUG=1
LM_STUDIO_URL=http://localhost:1234/v1
HOME=/home/user
PATH=/usr/local/bin:/usr/bin:/bin

# Use in scripts
>>> print($LM_STUDIO_URL)
http://localhost:1234/v1
```

### Runtime Configuration

```bash
# Change settings at runtime
>>> config set visual.default_zoom 2.0
>>> config set shell.prompt "$ "

# View current settings
>>> config get visual
visual:
  enabled: true
  default_zoom: 2.0
  foveated_rendering: true
  foveal_radius: 200
  fps_target: 60

# Reset to defaults
>>> config reset visual
```

---

## 5.2 Custom Themes

### Theme Structure

```yaml
# ~/.glyph_shell/theme.yaml

# Color palette
colors:
  # Primary colors
  background: "#0a0a0a"
  foreground: "#e0e0e0"
  primary: "#00ff88"
  secondary: "#0088ff"
  accent: "#ff8800"
  
  # Semantic colors
  success: "#00ff00"
  warning: "#ffff00"
  error: "#ff0000"
  info: "#00ffff"
  
  # UI elements
  border: "#333333"
  highlight: "#444444"
  selection: "#00ff8844"
  
  # Memory regions
  kernel: "#0066ff"
  mailbox: "#ffff00"
  shell: "#00ff00"
  files: "#00ffff"
  memory: "#ff00ff"
  agents: "#ff8800"

# Typography
fonts:
  main: "Fira Code"
  size: 14
  line_height: 1.4
  
# Visual effects
effects:
  glow: true
  glow_intensity: 0.5
  pulse: true
  pulse_speed: 1.0
  transitions: true
  transition_duration: 200
  
# UI layout
layout:
  status_bar: top
  history_panel: bottom
  panel_height: 200
  margin: 10
```

### Built-in Themes

```bash
# List available themes
>>> theme list
default      - Default dark theme
light        - Light theme for bright environments
high-contrast - High contrast accessibility theme
matrix       - Green on black, Matrix-style
ocean        - Blue oceanic theme
sunset       - Warm sunset colors

# Apply theme
>>> theme apply matrix
Theme 'matrix' applied

# Preview theme
>>> theme preview ocean
[Visual: Preview of ocean theme]

# Export current theme
>>> theme export my_theme
Theme exported to ~/.glyph_shell/themes/my_theme.yaml
```

### Creating Custom Themes

```bash
# Create new theme interactively
>>> theme create
Theme name: my_custom
Background color (#rrggbb): #1a1a2e
Foreground color (#rrggbb): #eaeaea
Primary color (#rrggbb): #00d9ff
...
Theme 'my_custom' created

# Or create manually
>>> edit ~/.glyph_shell/themes/my_theme.yaml
```

```yaml
# my_theme.yaml - Cyberpunk theme
colors:
  background: "#1a1a2e"
  foreground: "#eaeaea"
  primary: "#00d9ff"
  secondary: "#ff00ff"
  accent: "#ffff00"
  
effects:
  glow: true
  glow_intensity: 0.7
```

```bash
# Apply custom theme
>>> theme apply my_custom
```

---

## 5.3 Keyboard Shortcuts

### Default Shortcuts

| Key | Action |
|-----|--------|
| `Ctrl+P` | Open command palette |
| `Ctrl+H` | Toggle history panel |
| `Ctrl+L` | Clear screen |
| `Ctrl+C` | Cancel current command |
| `Ctrl+D` | Exit shell |
| `Ctrl+R` | Search history |
| `Ctrl+A` | Move to line start |
| `Ctrl+E` | Move to line end |
| `Ctrl+U` | Clear line before cursor |
| `Ctrl+K` | Clear line after cursor |
| `Ctrl+W` | Delete word before cursor |
| `Tab` | Autocomplete |
| `Shift+Tab` | Reverse autocomplete |
| `↑/↓` | Navigate history |
| `?` | Show help overlay |
| `Esc` | Close overlays |

### Custom Shortcuts

```yaml
# ~/.glyph_shell/keybindings.yaml

# Custom keybindings
bindings:
  # Navigation
  "Ctrl+F": "visual goto"
  "Ctrl+G": "visual focus next"
  
  # Process management
  "Ctrl+Shift+P": "ps"
  "Ctrl+Shift+K": "kill prompt"
  
  # Quick actions
  "F1": "help"
  "F2": "rename"
  "F5": "refresh"
  "F12": "debug toggle"
  
  # Custom commands
  "Ctrl+Shift+B": "run backup.gs"
  "Ctrl+Shift+M": "run monitor.gs"

# Mode-specific bindings
modes:
  visual:
    "h": "pan left"
    "j": "pan down"
    "k": "pan up"
    "l": "pan right"
    "+": "zoom in"
    "-": "zoom out"
    
  insert:
    "Ctrl+Space": "autocomplete"
```

### Managing Shortcuts

```bash
# List all shortcuts
>>> keys list
[Shows all current keybindings]

# Add shortcut
>>> keys bind "Ctrl+Shift+S" "save all"

# Remove shortcut
>>> keys unbind "Ctrl+Shift+S"

# Reset to defaults
>>> keys reset
Keybindings reset to defaults

# Export shortcuts
>>> keys export my_keys
Exported to ~/.glyph_shell/keybindings/my_keys.yaml
```

---

## 5.4 Workflow Optimization

### Command Palette

Press `Ctrl+P` to open the command palette:

```
┌─────────────────────────────────────────┐
│ > _                                     │
├─────────────────────────────────────────┤
│ Recent:                                 │
│   ps                                    │
│   visual on                             │
│   config get visual                     │
├─────────────────────────────────────────┤
│ Commands:                               │
│   File: New File                        │
│   File: Open File                       │
│   Process: List All                     │
│   Visual: Enable                        │
│   Theme: Apply                          │
│   ...                                   │
└─────────────────────────────────────────┘
```

Type to fuzzy-search commands, `↑/↓` to select, `Enter` to execute.

### Autocomplete

```bash
# Tab completion
>>> vis<Tab>
visual     visgrep    vispy

>>> visual <Tab>
on         off        goto       zoom       follow     regions

# Context-aware completion
>>> cd sys<Tab>
systems/

>>> kill <Tab>
1    42    43    101    102

# Fuzzy completion (if enabled)
>>> vshl<Tab>
# Matches: visual_shell
```

### History Search

```bash
# Ctrl+R for reverse search
>>> (Ctrl+R)
search: evol
# Shows: evolution_daemon status

# Navigate history with arrows
>>> (↑)  # Previous command
>>> (↓)  # Next command

# Search history
>>> history search "visual"
42: visual on
38: visual goto 0x1000
25: visual zoom 2

# Clear history
>>> history clear
History cleared
```

### Snippets

Create reusable code snippets:

```yaml
# ~/.glyph_shell/snippets.yaml

snippets:
  # Quick loops
  loop:
    trigger: "loop"
    body: |
      ↻ ${count} with i {
          ${cursor}
      }
      
  # Function template
  func:
    trigger: "fn"
    body: |
      fn ${name}(${params}) {
          ${cursor}
      }
      
  # Error handling
  try:
    trigger: "try"
    body: |
      try {
          ${cursor}
      } catch (e) {
          print("Error: " + e)
      }
```

```bash
# Use snippets
>>> loop<Tab>
# Expands to loop template with placeholders
```

### Workspace Profiles

Save and restore workspace states:

```bash
# Save current workspace
>>> workspace save "development"
Workspace 'development' saved
  - Current directory: ~/geometry_os
  - Open visualizations: 2
  - Background processes: 3

# List workspaces
>>> workspace list
development   - Saved 2 hours ago
debugging     - Saved yesterday
demo          - Saved last week

# Load workspace
>>> workspace load "development"
Workspace 'development' loaded
  - Changed to ~/geometry_os
  - Restored 2 visualizations
  - Found 3 background processes

# Delete workspace
>>> workspace delete "demo"
Workspace 'demo' deleted
```

---

## 5.5 Practical Exercises

### Exercise 5.5.1: Personal Configuration

Create your personalized setup:

```bash
# 1. Create custom config
>>> config set shell.prompt "[$USER@geometry] $ "
>>> config set visual.default_zoom 1.5

# 2. Create aliases for common tasks
>>> alias ck "config get"
>>> alias vs "visual on"
>>> alias psa "ps -a"

# 3. Save aliases
>>> alias save

# 4. Create custom theme
>>> theme create
# Follow prompts...

# 5. Save workspace
>>> workspace save "my_setup"
```

### Exercise 5.5.2: Efficiency Shortcuts

Set up keyboard shortcuts for efficiency:

```bash
# 1. Bind frequent commands
>>> keys bind "F5" "clear"
>>> keys bind "Ctrl+P" "ps"
>>> keys bind "F1" "help"

# 2. Create command snippets
# Edit ~/.glyph_shell/snippets.yaml

# 3. Test shortcuts
# Press F5 - should clear screen
# Press Ctrl+P - should show ps output

# 4. Export configuration
>>> keys export my_shortcuts
```

### Exercise 5.5.3: Workflow Automation

Create a workflow profile:

```bash
# 1. Set up your ideal workspace
>>> cd ~/geometry_os
>>> visual on
>>> visual goto SHELL
>>> run monitor.gs &

# 2. Save as profile
>>> workspace save "monitoring"

# 3. Test by loading
>>> workspace load "monitoring"

# 4. Create startup script
>>> edit ~/.glyph_shell/startup.gs
```

```geometry
# startup.gs - Run on shell start
print("Welcome to Geometry OS!")
print("Loading workspace...")

# Load default workspace
workspace_load("default")

# Start common services
run monitor.gs &

print("Ready!")
```

---

## 5.6 Module Summary

### What You Learned

- ✅ Environment configuration
- ✅ Creating and applying themes
- ✅ Defining keyboard shortcuts
- ✅ Workflow optimization techniques

### Key Takeaways

1. **Configuration**: Use `config.yaml` for persistent settings
2. **Themes**: Create visual environments that work for you
3. **Shortcuts**: Bind frequent actions to quick keys
4. **Workspaces**: Save and restore complete states

### Configuration Checklist

After completing this module, you should have:

- [ ] Custom prompt configured
- [ ] Preferred theme applied
- [ ] 5+ aliases created
- [ ] 3+ keyboard shortcuts defined
- [ ] At least one workspace saved
- [ ] Startup script configured

---

## Training Complete!

Congratulations! You've completed all five modules of the Native Glyph Shell training program.

### Next Steps

1. **Take the Assessment**: [assessments/practical_exam.md](../assessments/practical_exam.md)
2. **Provide Feedback**: [Feedback Survey](../README.md#feedback-survey)
3. **Explore Advanced Topics**: [ADVANCED_FEATURES.md](../../ADVANCED_FEATURES.md)
4. **Join the Community**: [CONTRIBUTING.md](../../CONTRIBUTING.md)

### Quick Reference

Keep these resources handy:

- [Quick Reference Card](../resources/quick_reference.md)
- [Keyboard Shortcuts](../resources/keyboard_shortcuts.md)
- [Troubleshooting Guide](../resources/troubleshooting_guide.md)
- [Glossary](../resources/glossary.md)

---

*Thank you for completing the Native Glyph Shell Training Program!*
