# Visual Bridge GUI Integration Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Integrate the ASCII GUI system with Visual Bridge WebSocket to enable real-time GUI state broadcasting and AI command processing.

**Architecture:** Add GUI fragment watching alongside ASCII Scene Graph, wire GUIFragmentRenderer to emit events, wire GUICommandProcessor to handle AI commands via WebSocket. Follow the existing pattern of `_ascii_scene_poller()` for consistency.

**Tech Stack:** Python 3.12, asyncio, websockets, pathlib

---

## Task 1: Add GUI State Variables to VisualBridge

**Files:**
- Modify: `systems/visual_shell/api/visual_bridge.py`

**Step 1: Add GUI state variables to __init__**

In the `VisualBridge.__init__` method, after the ASCII Scene Graph variables (around line 112), add:

```python
        # ASCII GUI Control Surface
        self.gui_scene_dir = Path(".geometry/gui/fragments")
        self.gui_scene_files: Dict[str, str] = {}  # filename -> content cache
        self._gui_renderers_registered = False

        # GUI Command Processor
        self._gui_command_processor: Optional[Any] = None
        self._gui_command_executor_enabled = True
```

**Step 2: Verify syntax is correct**

Run: `python -c "from systems.visual_shell.api.visual_bridge import VisualBridge; print('OK')"`
Expected: OK

**Step 3: Commit**

```bash
git add systems/visual_shell/api/visual_bridge.py
git commit -m "feat(visual-bridge): add GUI state variables"
```

---

## Task 2: Implement GUI Renderer Registration

**Files:**
- Modify: `systems/visual_shell/api/visual_bridge.py`

**Step 1: Add register_gui_renderers method**

After `register_ascii_renderers()` method (around line 1547), add:

```python
    def register_gui_renderers(self) -> None:
        """
        Register GUI ASCII renderers for dual-audience interface.

        This wires up the GUIFragmentRenderer to receive events and
        generate .ascii files in .geometry/gui/fragments/.
        """
        if self._gui_renderers_registered:
            return

        try:
            from systems.visual_shell.ascii_gui import (
                GUIFragmentRenderer,
                GUIHookBroadcaster,
            )

            # Create output directory
            self.gui_scene_dir.mkdir(parents=True, exist_ok=True)

            # Create broadcaster and renderer
            self._gui_broadcaster = GUIHookBroadcaster()
            self._gui_renderer = GUIFragmentRenderer(output_dir=self.gui_scene_dir)

            # Wire renderer to broadcaster
            self._gui_broadcaster.add_hook(self._gui_renderer)

            print(f"🖥️ GUI ASCII renderers registered")
            self._gui_renderers_registered = True

        except ImportError as e:
            print(f"⚠️ Could not register GUI renderers: {e}")
```

**Step 2: Verify import works**

Run: `python -c "from systems.visual_shell.ascii_gui import GUIFragmentRenderer, GUIHookBroadcaster; print('OK')"`
Expected: OK

**Step 3: Commit**

```bash
git add systems/visual_shell/api/visual_bridge.py
git commit -m "feat(visual-bridge): add GUI renderer registration"
```

---

## Task 3: Implement GUI Scene Watcher

**Files:**
- Modify: `systems/visual_shell/api/visual_bridge.py`

**Step 1: Add _setup_gui_scene_watcher method**

After `_setup_ascii_scene_watcher()` method (around line 1557), add:

```python
    def _setup_gui_scene_watcher(self) -> None:
        """
        Setup file watcher for GUI scene directory.

        This monitors .geometry/gui/fragments/ for changes and broadcasts
        updates to connected clients.
        """
        asyncio.create_task(self._gui_scene_poller())
```

**Step 2: Add _gui_scene_poller method**

After `_ascii_scene_poller()` method (around line 1587), add:

```python
    async def _gui_scene_poller(self) -> None:
        """Poll GUI scene directory for changes and broadcast updates."""
        while True:
            try:
                await asyncio.sleep(0.5)  # Poll every 500ms (faster than ASCII scene)

                if not self.gui_scene_dir.exists():
                    continue

                for filepath in self.gui_scene_dir.glob("*"):
                    if filepath.is_dir():
                        continue
                    filename = filepath.name
                    try:
                        content = filepath.read_text()
                        if filename not in self.gui_scene_files or \
                           self.gui_scene_files[filename] != content:
                            self.gui_scene_files[filename] = content
                            await self._broadcast({
                                "type": "gui_scene_update",
                                "filename": filename,
                                "content": content,
                                "timestamp": time.time()
                            })
                    except Exception:
                        pass
            except asyncio.CancelledError:
                break
            except Exception as e:
                print(f"⚠️ GUI scene poller error: {e}")
                await asyncio.sleep(5.0)  # Back off on error
```

**Step 3: Verify syntax**

Run: `python -c "from systems.visual_shell.api.visual_bridge import VisualBridge; print('OK')"`
Expected: OK

**Step 4: Commit**

```bash
git add systems/visual_shell/api/visual_bridge.py
git commit -m "feat(visual-bridge): add GUI scene poller"
```

---

## Task 4: Implement GUI Command Processor

**Files:**
- Modify: `systems/visual_shell/api/visual_bridge.py`

**Step 1: Add _setup_gui_command_processor method**

After `_setup_gui_scene_watcher()` method, add:

```python
    async def _setup_gui_command_processor(self) -> None:
        """
        Setup GUI command processor for AI-initiated GUI actions.

        This creates a GUICommandProcessor that watches for commands
        in .geometry/gui/commands/pending/ and executes them.
        """
        try:
            from systems.visual_shell.ascii_gui import GUICommandProcessor

            pending_dir = Path(".geometry/gui/commands/pending")
            completed_dir = Path(".geometry/gui/commands/completed")

            # Create directories
            pending_dir.mkdir(parents=True, exist_ok=True)
            completed_dir.mkdir(parents=True, exist_ok=True)

            # Create processor with executor
            self._gui_command_processor = GUICommandProcessor(
                pending_dir=pending_dir,
                completed_dir=completed_dir,
                executor=self._execute_gui_command,
            )

            # Start processing in background
            asyncio.create_task(self._gui_command_processor.start())

            print(f"🎯 GUI Command Processor started")

        except ImportError as e:
            print(f"⚠️ Could not start GUI command processor: {e}")
```

**Step 2: Add _execute_gui_command method**

```python
    async def _execute_gui_command(self, command: Any) -> None:
        """
        Execute a GUI command from the command queue.

        This is the callback for GUICommandProcessor. It handles
        different command types and dispatches to appropriate handlers.
        """
        action = command.action
        target = command.target
        params = command.params

        print(f"🎯 Executing GUI command: {action} -> {target}")

        # Broadcast command execution event
        await self._broadcast({
            "type": "gui_command",
            "command_id": command.command_id,
            "action": action,
            "target": target,
            "params": params,
            "source": command.source,
            "timestamp": time.time()
        })

        # Handle specific actions
        if action == "focus":
            # Focus a window by ID
            if self._gui_broadcaster:
                await self._gui_broadcaster.on_window_focus(target)

        elif action == "close":
            # Close a window by ID
            if self._gui_broadcaster:
                await self._gui_broadcaster.on_window_close(target)

        # Other actions are forwarded to visual shell via broadcast
        # The visual shell can listen and react accordingly
```

**Step 3: Verify syntax**

Run: `python -c "from systems.visual_shell.api.visual_bridge import VisualBridge; print('OK')"`
Expected: OK

**Step 4: Commit**

```bash
git add systems/visual_shell/api/visual_bridge.py
git commit -m "feat(visual-bridge): add GUI command processor integration"
```

---

## Task 5: Wire Up in start() Method

**Files:**
- Modify: `systems/visual_shell/api/visual_bridge.py`

**Step 1: Add GUI setup calls in start() method**

In the `start()` method, after the ASCII renderer registration (around line 1630), add:

```python
            # Register GUI renderers and start watcher
            self.register_gui_renderers()
            self._setup_gui_scene_watcher()

            # Start GUI command processor
            await self._setup_gui_command_processor()
```

**Step 2: Verify the changes integrate properly**

Run: `python -c "from systems.visual_shell.api.visual_bridge import VisualBridge; v = VisualBridge(); print('OK')"`
Expected: OK

**Step 3: Commit**

```bash
git add systems/visual_shell/api/visual_bridge.py
git commit -m "feat(visual-bridge): wire GUI integration in start()"
```

---

## Task 6: Add WebSocket Message Handlers

**Files:**
- Modify: `systems/visual_shell/api/visual_bridge.py`

**Step 1: Add GUI message handlers in _handle_client_message**

In the `_handle_client_message` method, after the `ascii_scene_request` handler (around line 991), add:

```python
                elif msg_type == 'gui_scene_request':
                    # Client requests GUI scene list
                    await self.broadcast_gui_scene_list()

                elif msg_type == 'gui_scene_update':
                    # Client (e.g., PixiJS) sends GUI state update
                    filename = data.get('filename')
                    content = data.get('content')
                    if filename and content:
                        filepath = self.gui_scene_dir / filename
                        filepath.parent.mkdir(parents=True, exist_ok=True)
                        filepath.write_text(content)
                        self.gui_scene_files[filename] = content
                        await self._broadcast({
                            "type": "gui_scene_update",
                            "filename": filename,
                            "content": content,
                            "timestamp": time.time()
                        })

                elif msg_type == 'gui_event':
                    # GUI event from visual shell (window create, focus, etc.)
                    event_type = data.get('event_type')
                    if self._gui_broadcaster:
                        if event_type == 'window_create':
                            await self._gui_broadcaster.on_window_create(
                                data.get('id'),
                                data.get('title'),
                                tuple(data.get('pos', (0, 0))),
                                tuple(data.get('size', (640, 480)))
                            )
                        elif event_type == 'window_focus':
                            await self._gui_broadcaster.on_window_focus(data.get('id'))
                        elif event_type == 'window_close':
                            await self._gui_broadcaster.on_window_close(data.get('id'))
                        elif event_type == 'mouse_move':
                            await self._gui_broadcaster.on_mouse_move(
                                data.get('x', 0),
                                data.get('y', 0)
                            )
                        elif event_type == 'key_press':
                            await self._gui_broadcaster.on_key_press(
                                data.get('key'),
                                data.get('modifiers', [])
                            )
```

**Step 2: Add broadcast_gui_scene_list method**

After `broadcast_ascii_scene_list()` method, add:

```python
    async def broadcast_gui_scene_list(self) -> None:
        """Broadcast list of available GUI scene files to all clients."""
        try:
            if not self.gui_scene_dir.exists():
                return

            files = [f.name for f in self.gui_scene_dir.glob("*") if f.is_file()]

            await self._broadcast({
                "type": "gui_scene_list",
                "files": files,
                "timestamp": time.time()
            })
        except Exception as e:
            print(f"❌ Failed to list GUI files: {e}")
```

**Step 3: Verify syntax**

Run: `python -c "from systems.visual_shell.api.visual_bridge import VisualBridge; print('OK')"`
Expected: OK

**Step 4: Commit**

```bash
git add systems/visual_shell/api/visual_bridge.py
git commit -m "feat(visual-bridge): add GUI WebSocket message handlers"
```

---

## Task 7: Write Integration Tests

**Files:**
- Create: `tests/systems/visual_shell/api/test_visual_bridge_gui.py`

**Step 1: Write integration tests**

```python
"""Tests for Visual Bridge GUI integration."""

import pytest
from pathlib import Path
import tempfile
import asyncio

from systems.visual_shell.api.visual_bridge import VisualBridge
from systems.visual_shell.ascii_gui import Command
from datetime import datetime


@pytest.fixture
def temp_gui_dirs():
    with tempfile.TemporaryDirectory() as d:
        fragments = Path(d) / "fragments"
        pending = Path(d) / "commands" / "pending"
        completed = Path(d) / "commands" / "completed"
        fragments.mkdir(parents=True)
        pending.mkdir(parents=True)
        completed.mkdir(parents=True)
        yield {
            "fragments": fragments,
            "pending": pending,
            "completed": completed,
            "root": Path(d),
        }


def test_gui_state_variables_initialized():
    """Test that GUI state variables are initialized."""
    bridge = VisualBridge()
    assert hasattr(bridge, "gui_scene_dir")
    assert hasattr(bridge, "gui_scene_files")
    assert hasattr(bridge, "_gui_renderers_registered")


def test_register_gui_renderers(temp_gui_dirs):
    """Test GUI renderer registration."""
    bridge = VisualBridge()
    bridge.gui_scene_dir = temp_gui_dirs["fragments"]
    bridge.register_gui_renderers()

    assert bridge._gui_renderers_registered
    assert hasattr(bridge, "_gui_broadcaster")
    assert hasattr(bridge, "_gui_renderer")


@pytest.mark.asyncio
async def test_gui_scene_poller_detects_changes(temp_gui_dirs):
    """Test that GUI scene poller detects file changes."""
    bridge = VisualBridge()
    bridge.gui_scene_dir = temp_gui_dirs["fragments"]
    bridge.gui_scene_files = {}
    bridge.clients = set()  # No clients, so broadcast will be safe

    # Create a test file
    test_file = temp_gui_dirs["fragments"] / "test.yaml"
    test_file.write_text("windows: []")

    # Run one iteration of poller
    poll_task = asyncio.create_task(bridge._gui_scene_poller())
    await asyncio.sleep(0.6)  # Wait for one poll cycle
    poll_task.cancel()

    assert "test.yaml" in bridge.gui_scene_files


@pytest.mark.asyncio
async def test_gui_command_processor_handles_commands(temp_gui_dirs):
    """Test that GUI command processor handles commands."""
    bridge = VisualBridge()
    bridge.gui_scene_dir = temp_gui_dirs["fragments"]
    bridge.clients = set()

    # Setup broadcaster first
    bridge.register_gui_renderers()

    # Create command
    cmd = Command(
        command_id="cmd-001",
        action="focus",
        timestamp=datetime.now(),
        target="win-001",
    )

    # Execute command
    await bridge._execute_gui_command(cmd)


def test_broadcast_gui_scene_list(temp_gui_dirs):
    """Test broadcasting GUI scene list."""
    bridge = VisualBridge()
    bridge.gui_scene_dir = temp_gui_dirs["fragments"]

    # Create test files
    (temp_gui_dirs["fragments"] / "windows.yaml").write_text("windows: []")
    (temp_gui_dirs["fragments"] / "focus.ascii").write_text("FOCUS")

    # This should not raise
    asyncio.run(bridge.broadcast_gui_scene_list())
```

**Step 2: Run tests**

Run: `python -m pytest tests/systems/visual_shell/api/test_visual_bridge_gui.py -v`
Expected: All tests pass

**Step 3: Commit**

```bash
git add tests/systems/visual_shell/api/test_visual_bridge_gui.py
git commit -m "test(visual-bridge): add GUI integration tests"
```

---

## Task 8: Update Documentation

**Files:**
- Create: `docs/gui-visual-bridge-integration.md`

**Step 1: Write documentation**

```markdown
# GUI Visual Bridge Integration

## Overview

The ASCII GUI system integrates with Visual Bridge to enable real-time GUI state broadcasting and AI command processing via WebSocket.

## WebSocket Messages

### GUI Scene Updates

**Client receives:**
```json
{
  "type": "gui_scene_update",
  "filename": "windows.yaml",
  "content": "windows:\n  - id: win-001\n    title: Terminal",
  "timestamp": 1708700000.0
}
```

**Client requests:**
```json
{
  "type": "gui_scene_request"
}
```

### GUI Events

**PixiJS sends:**
```json
{
  "type": "gui_event",
  "event_type": "window_create",
  "id": "win-001",
  "title": "Terminal",
  "pos": [100, 50],
  "size": [640, 480]
}
```

### GUI Commands

**Client receives:**
```json
{
  "type": "gui_command",
  "command_id": "cmd-001",
  "action": "focus",
  "target": "win-002",
  "params": {},
  "source": "ai-agent"
}
```

## Directory Structure

```
.geometry/gui/
├── fragments/          # GUI state files (read by AI)
│   ├── windows.yaml
│   ├── focus.ascii
│   ├── mouse.ascii
│   └── keyboard.ascii
├── commands/
│   ├── pending/        # AI writes commands here
│   └── completed/      # Processed commands
└── state/
```

## Usage

### Starting Visual Bridge with GUI

```bash
python systems/visual_shell/api/visual_bridge.py
```

The bridge will:
1. Register GUI renderers
2. Start watching `.geometry/gui/fragments/`
3. Start GUI command processor

### AI Reading GUI State

```python
# Read current windows
windows = Path(".geometry/gui/fragments/windows.yaml").read_text()

# Parse with YAML
import yaml
state = yaml.safe_load(windows)
for win in state.get("windows", []):
    print(f"Window: {win['title']} (focused: {win.get('focused', False)})")
```

### AI Writing Commands

```python
from systems.visual_shell.ascii_gui import Command
from datetime import datetime

cmd = Command(
    command_id="cmd-001",
    action="focus",
    timestamp=datetime.now(),
    target="win-002",
)

# Write to pending directory
Path(".geometry/gui/commands/pending/cmd-001.yaml").write_text(cmd.to_yaml())
```

## Integration Points

| Component | Purpose |
|-----------|---------|
| `register_gui_renderers()` | Wires GUIFragmentRenderer to events |
| `_gui_scene_poller()` | Watches fragment files, broadcasts changes |
| `_execute_gui_command()` | Handles AI-initiated commands |
| WebSocket handlers | Bi-directional GUI state sync |
```

**Step 2: Commit**

```bash
git add docs/gui-visual-bridge-integration.md
git commit -m "docs: add GUI Visual Bridge integration documentation"
```

---

## Task 9: Run All Tests

**Step 1: Run all Visual Bridge tests**

Run: `python -m pytest tests/systems/visual_shell/api/ -v --tb=short`
Expected: All tests pass

**Step 2: Run all ASCII GUI tests**

Run: `python -m pytest tests/systems/visual_shell/ascii_gui/ -v --tb=short`
Expected: All tests pass (61 tests)

**Step 3: Commit**

```bash
git add -A
git commit -m "test(visual-bridge): verify all integration tests pass"
```

---

## Summary

This plan integrates the ASCII GUI system with Visual Bridge in 9 tasks:

1. **Add GUI State Variables** - Initialize GUI-related state in VisualBridge
2. **Register GUI Renderers** - Wire GUIFragmentRenderer to Visual Bridge
3. **GUI Scene Watcher** - Poll `.geometry/gui/fragments/` for changes
4. **GUI Command Processor** - Handle AI commands from file queue
5. **Wire in start()** - Call setup methods on bridge startup
6. **WebSocket Handlers** - Handle gui_scene_request, gui_scene_update, gui_event
7. **Integration Tests** - Test the integration points
8. **Documentation** - Document WebSocket protocol and usage
9. **Run All Tests** - Verify everything works together

Each task follows the existing Visual Bridge patterns for consistency.
