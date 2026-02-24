# GUI Visual Bridge Integration

This document describes the integration between the ASCII GUI system and the Visual Bridge WebSocket server for real-time GUI state broadcasting to PixiJS clients and AI command processing.

## Overview

The GUI Visual Bridge integration enables:
1. **Real-time GUI state broadcasting** - PixiJS clients receive live updates of GUI fragments
2. **AI GUI command processing** - AI agents can send commands (focus, close, click) to control the visual shell
3. **GUI event forwarding** - PixiJS forwards events (window create/focus/close) to AI via the bridge

## Architecture

```
┌─────────────┐                      ┌──────────────────┐                      ┌─────────────┐
│   PixiJS    │                      │  VisualBridge    │                      │  AI Agent   │
│ Visual Shell│                      │  (WebSocket)     │                      │             │
└──────┬──────┘                      └────────┬─────────┘                      └──────┬──────┘
       │                                      │                                       │
       │  gui_event (window_create, etc.)     │                                       │
       │─────────────────────────────────────>│                                       │
       │                                      │                                       │
       │                                      │  GUIHookBroadcaster.on_window_create │
       │                                      │─────────────────────────────────────>│
       │                                      │                                       │
       │                                      │  GUIFragmentRenderer.write()          │
       │                                      │─────────────────────────────────────>│
       │                                      │                                       │
       │                                      │  Write to .geometry/gui/fragments/    │
       │                                      │──────────────────────────────────────>│
       │                                      │                                       │
       │  gui_scene_update (file change)      │                                       │
       │<─────────────────────────────────────│                                       │
       │                                      │                                       │
       │                                      │                                       │
       │  gui_command (click, focus, close)   │  Write command to pending/            │
       │<─────────────────────────────────────│<──────────────────────────────────────│
       │                                      │                                       │
```

## Directory Structure

```
.geometry/gui/
├── fragments/           # GUI state files (read by poller)
│   ├── windows.yaml     # Window definitions
│   ├── focus.ascii      # Focused window state
│   ├── mouse.ascii      # Mouse position/state
│   └── keyboard.ascii   # Keyboard input state
├── commands/
│   ├── pending/         # AI commands awaiting execution
│   └── completed/       # Processed commands with results
```

## WebSocket Protocol

### Client -> Server Messages

#### gui_scene_request

Request the current list of GUI fragment files.

```json
{
  "type": "gui_scene_request"
}
```

**Response**: The server broadcasts `gui_scene_list` and sends individual `gui_scene_update` messages for each cached file.

#### gui_scene_update

Send a GUI fragment update from the client.

```json
{
  "type": "gui_scene_update",
  "filename": "windows.yaml",
  "content": "windows:\n  - id: win-1\n    title: Terminal",
  "timestamp": 1708704000.0
}
```

**Behavior**: Updates the server cache and broadcasts to all connected clients.

#### gui_event

Send a GUI event (window lifecycle, input events).

```json
{
  "type": "gui_event",
  "event_type": "window_create",
  "data": {
    "id": "win-1",
    "title": "Terminal",
    "x": 100,
    "y": 100,
    "width": 800,
    "height": 600
  },
  "timestamp": 1708704000.0
}
```

**Event Types**:
| event_type | data fields | Description |
|------------|-------------|-------------|
| `window_create` | id, title, x, y, width, height | New window created |
| `window_close` | id | Window closed |
| `window_focus` | id | Focus changed to window |
| `component_update` | id, component, value | Component state changed |
| `mouse_move` | x, y | Mouse position updated |
| `key_press` | key, modifiers | Key pressed |

**Behavior**: Routes to `GUIHookBroadcaster` methods and broadcasts `GUI_EVENT` to all clients.

### Server -> Client Messages

#### gui_scene_list

Broadcast list of available GUI fragment files.

```json
{
  "type": "gui_scene_list",
  "files": ["windows.yaml", "focus.ascii", "mouse.ascii"],
  "timestamp": 1708704000.0
}
```

#### gui_scene_update

Broadcast a GUI fragment file update.

```json
{
  "type": "gui_scene_update",
  "filename": "windows.yaml",
  "content": "windows:\n  - id: win-1\n    title: Terminal",
  "timestamp": 1708704000.0
}
```

#### gui_command

Broadcast a command to be executed by the visual shell.

```json
{
  "type": "gui_command",
  "command_id": "cmd-001",
  "action": "click",
  "target": "button#submit",
  "position": [100, 200],
  "text": null,
  "keys": null,
  "timestamp": 1708704000.0
}
```

**Command Actions**:
| action | fields | Description |
|--------|--------|-------------|
| `click` | position, target | Click at position or on target element |
| `focus` | target | Focus a window or element |
| `close` | target | Close a window |
| `type` | text, target | Type text into input |
| `key` | keys | Send key combination |
| `scroll` | direction, delta | Scroll in direction |

#### GUI_EVENT

Broadcast a GUI event to all clients for synchronization.

```json
{
  "type": "GUI_EVENT",
  "event_type": "window_create",
  "data": {"id": "win-1", "title": "Terminal"},
  "timestamp": 1708704000.0
}
```

## AI Command Usage

AI agents can control the visual shell by writing command files to the pending directory.

### Writing Commands

```python
from pathlib import Path
from datetime import datetime, timezone
import yaml
import uuid

def send_gui_command(action: str, **kwargs):
    """Send a GUI command from an AI agent."""
    pending_dir = Path(".geometry/gui/commands/pending")
    pending_dir.mkdir(parents=True, exist_ok=True)

    command = {
        "command_id": str(uuid.uuid4())[:8],
        "action": action,
        "timestamp": datetime.now(timezone.utc).isoformat(),
        **kwargs
    }

    cmd_path = pending_dir / f"{command['command_id']}.yaml"
    cmd_path.write_text(yaml.dump(command))
    return command["command_id"]

# Example: Click a button
cmd_id = send_gui_command("click", target="button#submit", position=[100, 200])

# Example: Focus a window
cmd_id = send_gui_command("focus", target="window-terminal")

# Example: Type text
cmd_id = send_gui_command("type", target="input#search", text="hello world")

# Example: Close a window
cmd_id = send_gui_command("close", target="window-settings")
```

### Reading Command Results

```python
def get_command_result(command_id: str) -> dict:
    """Get the result of a processed command."""
    completed_dir = Path(".geometry/gui/commands/completed")
    result_path = completed_dir / f"{command_id}.yaml"

    if result_path.exists():
        return yaml.safe_load(result_path.read_text())
    return None

# Check result
result = get_command_result(cmd_id)
if result:
    print(f"Success: {result.get('success')}")
    print(f"Error: {result.get('error')}")
```

## Reading GUI State

AI agents can read GUI state by monitoring the fragments directory.

```python
from pathlib import Path
import yaml

def get_windows() -> list:
    """Get current window list."""
    windows_path = Path(".geometry/gui/fragments/windows.yaml")
    if windows_path.exists():
        data = yaml.safe_load(windows_path.read_text())
        return data.get("windows", [])
    return []

def get_focused_window() -> str:
    """Get currently focused window ID."""
    focus_path = Path(".geometry/gui/fragments/focus.ascii")
    if focus_path.exists():
        content = focus_path.read_text()
        # Parse: "FOCUS: window-1"
        for line in content.split("\n"):
            if line.startswith("FOCUS:"):
                return line.split(":", 1)[1].strip()
    return None

# Example usage
windows = get_windows()
for win in windows:
    print(f"Window: {win['id']} - {win['title']}")

focused = get_focused_window()
print(f"Focused: {focused}")
```

## VisualBridge API

### Initialization

The GUI integration is initialized automatically when VisualBridge starts:

```python
from systems.visual_shell.api.visual_bridge import VisualBridge

bridge = VisualBridge(ws_port=8768)
await bridge.start()
```

### Key Methods

| Method | Purpose |
|--------|---------|
| `register_gui_renderers()` | Create and wire GUIHookBroadcaster + GUIFragmentRenderer |
| `_setup_gui_scene_watcher()` | Start the async GUI scene file poller |
| `_setup_gui_command_processor()` | Create GUICommandProcessor with executor callback |
| `_execute_gui_command(cmd)` | Execute a validated command, broadcast to clients |
| `broadcast_gui_scene_list()` | Broadcast list of available GUI fragment files |

### State Variables

| Variable | Type | Description |
|----------|------|-------------|
| `gui_scene_dir` | `Path` | `.geometry/gui/fragments/` directory |
| `gui_scene_files` | `Dict[str, str]` | Cache of filename -> content |
| `_gui_renderers_registered` | `bool` | Guard flag for renderer registration |
| `_gui_command_processor` | `GUICommandProcessor` | Command processor instance |
| `_gui_broadcaster` | `GUIHookBroadcaster` | Event dispatcher |
| `_gui_renderer` | `GUIFragmentRenderer` | Fragment generator |

## Performance Characteristics

| Metric | Value | Notes |
|--------|-------|-------|
| Poll interval | 500ms | Faster than ASCII (1s) for UI responsiveness |
| Command processing | <50ms | Validation + execution + broadcast |
| File change broadcast | <100ms overhead | Content hash comparison |

## Error Handling

| Error | Behavior |
|-------|----------|
| GUI module import fails | Warning logged, GUI features disabled |
| Fragment dir missing | Created on renderer registration |
| Command validation fails | Command moved to completed/ with error message |
| Poller exception | Log, sleep 5s, continue |

## Related Documentation

- [ASCII GUI System](../systems/visual_shell/ascii_gui/) - Core GUI rendering and command processing
- [Visual Bridge](../systems/visual_shell/api/visual_bridge.py) - WebSocket server implementation
- [Swarm NEB Integration](./swarm-neb-integration.md) - Neural Event Bus for real-time events

## Testing

Integration tests are available in:
```
tests/systems/visual_shell/api/test_visual_bridge_gui.py
```

Run with:
```bash
python -m pytest tests/systems/visual_shell/api/test_visual_bridge_gui.py -v
```

Tests cover:
- GUI state variable initialization
- Renderer registration
- Scene poller file change detection
- Command processor execution
- WebSocket message handlers
- End-to-end command workflow
