# Proposal: Intuitive Native Glyph Shell UI

## Problem Statement

The current Native Glyph Shell (`native_geos_terminal.py`) provides core functionality but lacks intuitive user experience features:

1. **No visual feedback**: Users can't see what commands are available
2. **No command discovery**: Commands like `g map`, `g spawn` are hidden
3. **No status indicators**: Users don't know if operations succeeded/failed
4. **No progress feedback**: Long-running operations have no visual cue
5. **Poor error handling**: Errors are printed but not visually distinguished
6. **No keyboard shortcuts help**: Users must memorize or guess shortcuts
7. **No command history**: Can't recall or search previous commands

## Proposed Solution

Create an enhanced Native Glyph Shell with:

### 1. Visual Command Palette (Ctrl+P / F1)
- Fuzzy search for commands
- Preview command effects
- Category-based organization

### 2. Real-time Status Bar
- Current directory
- Active tile count
- Connection status
- Performance metrics

### 3. Rich Command Output
- Syntax highlighted output
- Progress bars for long operations
- Error highlighting with suggestions

### 4. Interactive Help System
- Context-sensitive help
- Keyboard shortcut overlay
- Tutorial mode for new users

### 5. Command History Panel
- Searchable history
- Favorite commands
- Command categories

## Architecture

```
┌──────────────────────────────────────────────────────────────┐
│                    Enhanced Glyph Shell                       │
├──────────────────────────────────────────────────────────────┤
│  ┌────────────────────────────────────────────────────────┐  │
│  │                    Main Terminal                        │  │
│  │  - PTY output with syntax highlighting                  │  │
│  │  - ANSI color support                                   │  │
│  │  - Inline error/success indicators                      │  │
│  └────────────────────────────────────────────────────────┘  │
├──────────────────────────────────────────────────────────────┤
│  ┌──────────────────┐  ┌──────────────────────────────────┐  │
│  │ Command Palette  │  │       Status Bar                  │  │
│  │ (Ctrl+P to open) │  │ 📁 /home/user │ 🟢 3 tiles │ 60fps│  │
│  └──────────────────┘  └──────────────────────────────────┘  │
├──────────────────────────────────────────────────────────────┤
│  ┌──────────────────────────────────────────────────────────┐│
│  │ Help Overlay (? to toggle)                               ││
│  │ ┌─────────────────────┬────────────────────────────────┐ ││
│  │ │ Navigation          │ Commands                       │ ││
│  │ │ Ctrl+P  Command Pal │ g map <x> <y> - Pan map        │ ││
│  │ │ Ctrl+H  History     │ g spawn       - New tile       │ ││
│  │ │ Ctrl+L  Clear       │ g gls [path]  - Spatial ls     │ ││
│  │ │ ?        Help       │ g ai [prompt] - AI analysis    │ ││
│  │ └─────────────────────┴────────────────────────────────┘ ││
│  └──────────────────────────────────────────────────────────┘│
└──────────────────────────────────────────────────────────────┘
```

## Implementation Phases

### Phase 1: Core UI Components (Week 1)
- Status bar with real-time updates
- Command palette infrastructure
- Enhanced output formatting

### Phase 2: Command Discovery (Week 2)
- Fuzzy command search
- Command preview system
- Category organization

### Phase 3: Help System (Week 3)
- Keyboard shortcut overlay
- Context-sensitive help
- Interactive tutorial

### Phase 4: Polish & Testing (Week 4)
- User testing with target audience
- Feedback collection
- Iteration based on results

## Success Criteria

- [ ] 90% of users can discover `g spawn` within 30 seconds
- [ ] Average command discovery time < 5 seconds
- [ ] User satisfaction score > 4/5
- [ ] Zero regression in terminal performance
- [ ] All existing commands still work

## Dependencies

- Existing: `geometric_terminal_bridge.py`, `geos_commands.py`
- New: `enhanced_ui.py`, `command_palette.py`, `status_bar.py`

## Risk Mitigation

| Risk | Mitigation |
|------|------------|
| Performance overhead | Lazy loading, async updates |
| Learning curve | Tutorial mode, progressive disclosure |
| Backward compatibility | Feature flags, graceful fallback |
