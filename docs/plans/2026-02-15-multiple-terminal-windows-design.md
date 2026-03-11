# Multiple Terminal Windows Design

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:writing-plans to create implementation plan from this design.

**Goal:** Enable multiple independent terminal windows on the Geometry OS map with proper focus management.

**Architecture:** Refactor map_terminal.py to introduce a TerminalManager that coordinates multiple MapTerminal instances. A single InputServer WebSocket routes keystrokes to the active terminal. Browser-side terminalRegistry mirrors state and handles hit-testing for click-to-focus.

**Tech Stack:** Python asyncio, WebSocket, Chrome DevTools Protocol, PixiJS

---

## Design Decisions

### 1. Terminal Creation: Both Keyboard + Button
- Keyboard shortcut (Ctrl+Shift+T) for power users
- Visible "New Terminal" button for discoverability
- Both send `{ type: 'new_terminal' }` to Python backend

### 2. Terminal Identification: Working Directory
- Title shows current working directory (e.g., "Terminal: /home/user/projects")
- Automatic context, no user effort required
- Future: add custom naming as enhancement

### 3. Input Routing: Click-to-Focus + Visual Indicator
- Click on terminal to make it active (receives keystrokes)
- Prominent visual indicator (glowing green border) shows active terminal
- Classic windowing behavior, familiar to all users

---

## Architecture

### Backend (map_terminal.py)

```
TerminalManager
├── terminals: Dict[int, MapTerminal]
├── active_terminal_id: int
├── next_id: int
├── create_terminal(x, y) → MapTerminal
├── destroy_terminal(id)
├── focus_terminal(id)
└── get_active() → MapTerminal

MapTerminal (enhanced)
├── id: int
├── working_dir: str
├── focused: bool
└── ...existing methods...

InputServer (enhanced)
├── Routes to TerminalManager.get_active()
└── Handles: key, focus_change, new_terminal, close_terminal
```

### Frontend (JavaScript)

```javascript
window.terminalRegistry = {
    terminals: Map<id, {x, y, width, height, workingDir, focused}>,
    activeId: int,

    register(id, x, y, width, height),
    update(id, props),
    unregister(id),
    setActive(id),
    hitTest(x, y) → terminalId
};
```

## Message Protocol

### Browser → Python

| Type | Fields | Description |
|------|--------|-------------|
| `key` | `key`, `code`, `ctrlKey`, etc. | Keystroke to active terminal |
| `focus_change` | `fromId`, `toId` | User clicked different terminal |
| `new_terminal` | (none) | Request to create new terminal |
| `close_terminal` | `id` | Request to close terminal |

### Python → Browser

| Type | Fields | Description |
|------|--------|-------------|
| `terminal_created` | `id`, `x`, `y`, `workingDir` | New terminal registered |
| `terminal_focused` | `id` | Focus changed |
| `terminal_closed` | `id` | Terminal removed |
| `render` | `id`, `lines`, `inputBuffer` | Terminal content update |

## Visual Design

### Active Terminal
- Green border (0x00FF00)
- Solid cursor (█)
- Title: "Terminal: /path/to/dir ●"

### Inactive Terminal
- Gray border (0x444444)
- Underscore cursor (_)
- Title: "Terminal: /path/to/dir"

### New Terminal Button
- Small "+" button in corner of canvas
- Or right-click context menu option

## Workflow

1. **Startup**: TerminalManager creates first terminal at default position
2. **User presses Ctrl+Shift+T**: Browser sends `new_terminal` message
3. **Backend**: TerminalManager creates new MapTerminal at offset position
4. **Backend**: Sends `terminal_created` to browser
5. **Browser**: Registers in terminalRegistry, renders new terminal
6. **User clicks terminal**: Browser sends `focus_change`
7. **Backend**: Updates active_terminal_id, renders focus indicators
8. **User types**: InputServer routes to active terminal only

## Usage

```bash
# Start multi-terminal manager
python3 map_terminal.py

# In browser:
# - Press Ctrl+Shift+T to create new terminal
# - Click on any terminal to focus it
# - Type in focused terminal
```
