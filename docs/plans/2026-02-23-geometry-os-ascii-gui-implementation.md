# Geometry OS ASCII GUI System Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Build a dual-audience GUI system where every state is exposed as ASCII fragments for both human visual interaction and AI text-based control.

**Architecture:** ASCII Control Surface layer (.geometry/gui/) + GUIFragmentRenderer (state to ASCII) + GUICommandProcessor (commands to actions) + Integration with Visual Bridge WebSocket. Follows the ASCII Exposed Computing manifesto.

**Tech Stack:** Python 3.12, asyncio, PyYAML, watchdog, pytest

---

## Phase 1: Core Infrastructure

### Task 1: Create Module Structure

**Files:**
- Create: `systems/visual_shell/ascii_gui/__init__.py`
- Create: `systems/visual_shell/ascii_gui/py.typed`
- Create: `.geometry/gui/.gitkeep`

**Step 1: Create the ascii_gui module directory**

```bash
mkdir -p systems/visual_shell/ascii_gui
mkdir -p .geometry/gui/fragments
mkdir -p .geometry/gui/schemas
mkdir -p .geometry/gui/commands/pending
mkdir -p .geometry/gui/commands/completed
mkdir -p .geometry/gui/state
```

**Step 2: Create __init__.py**

```python
"""
ASCII GUI System - Dual-audience interface for humans and AIs.

Exposes all GUI state as ASCII fragments in .geometry/gui/ for zero-cost
AI perception while rendering visually for human users.
"""

from systems.visual_shell.ascii_gui.hooks import (
    GUIShellHook,
    GUIHookBroadcaster,
)
from systems.visual_shell.ascii_gui.fragment_renderer import (
    GUIFragmentRenderer,
    Window,
    FocusState,
    MouseState,
    KeyboardState,
)
from systems.visual_shell.ascii_gui.command_processor import (
    GUICommandProcessor,
    Command,
)

__all__ = [
    "GUIShellHook",
    "GUIHookBroadcaster",
    "GUIFragmentRenderer",
    "Window",
    "FocusState",
    "MouseState",
    "KeyboardState",
    "GUICommandProcessor",
    "Command",
]
```

**Step 3: Create py.typed for type hints**

```bash
touch systems/visual_shell/ascii_gui/py.typed
```

**Step 4: Create .gitkeep files**

```bash
touch .geometry/gui/fragments/.gitkeep
touch .geometry/gui/schemas/.gitkeep
touch .geometry/gui/commands/pending/.gitkeep
touch .geometry/gui/commands/completed/.gitkeep
touch .geometry/gui/state/.gitkeep
```

**Step 5: Commit**

```bash
git add systems/visual_shell/ascii_gui/ .geometry/gui/
git commit -m "feat(ascii-gui): create module structure and directories"
```

---

### Task 2: Implement Data Classes

**Files:**
- Create: `systems/visual_shell/ascii_gui/models.py`

**Step 1: Write the data models**

```python
"""
Data models for ASCII GUI system.
"""

from dataclasses import dataclass, field
from datetime import datetime
from enum import Enum
from typing import Dict, List, Optional, Tuple, Any


class WindowType(Enum):
    """Window type enumeration."""
    TERMINAL = "terminal"
    EDITOR = "editor"
    BROWSER = "browser"
    DASHBOARD = "dashboard"
    NEURAL_CITY = "neural_city"
    SWARM = "swarm"
    EVOLUTION = "evolution"
    UNKNOWN = "unknown"


class PanelType(Enum):
    """Panel type enumeration."""
    SIDEBAR = "sidebar"
    STATUSBAR = "statusbar"
    TOOLBAR = "toolbar"
    DOCK = "dock"


@dataclass
class Window:
    """Represents a window in the GUI."""
    id: str
    title: str
    type: WindowType = WindowType.UNKNOWN
    pos: Tuple[int, int] = (0, 0)
    size: Tuple[int, int] = (640, 480)
    z_index: int = 0
    focused: bool = False
    minimized: bool = False
    maximized: bool = False
    children: List["Window"] = field(default_factory=list)
    state: Dict[str, Any] = field(default_factory=dict)

    def to_yaml_dict(self) -> Dict[str, Any]:
        """Convert to YAML-serializable dict."""
        result = {
            "id": self.id,
            "title": self.title,
            "type": self.type.value,
            "pos": list(self.pos),
            "size": list(self.size),
            "z": self.z_index,
        }
        if self.focused:
            result["focused"] = True
        if self.minimized:
            result["minimized"] = True
        if self.maximized:
            result["maximized"] = True
        if self.state:
            result["state"] = self.state
        if self.children:
            result["children"] = [c.to_yaml_dict() for c in self.children]
        return result


@dataclass
class FocusState:
    """Current focus state."""
    window_id: Optional[str] = None
    window_title: str = ""
    element: str = ""
    cursor_pos: Tuple[int, int] = (0, 0)
    selection: Optional[Tuple[int, int, int, int]] = None
    mode: str = "normal"


@dataclass
class MouseState:
    """Current mouse state."""
    pos: Tuple[int, int] = (0, 0)
    screen_pos: Tuple[int, int] = (0, 0)
    window_id: Optional[str] = None
    window_pos: Tuple[int, int] = (0, 0)
    buttons: List[str] = field(default_factory=list)
    modifiers: List[str] = field(default_factory=list)
    hover_element: str = ""


@dataclass
class KeyboardState:
    """Current keyboard state."""
    pressed: List[str] = field(default_factory=list)
    modifiers: List[str] = field(default_factory=list)
    last_key: str = ""
    last_key_time: Optional[datetime] = None
    layout: str = "us"


@dataclass
class MenuItem:
    """Menu item definition."""
    label: str
    shortcut: str = ""
    enabled: bool = True
    action: Optional[str] = None
    items: List["MenuItem"] = field(default_factory=list)


@dataclass
class Menu:
    """Menu definition."""
    id: str
    label: str
    items: List[MenuItem] = field(default_factory=list)


@dataclass
class Panel:
    """Panel definition."""
    id: str
    type: PanelType
    anchor: str = "left"
    size: int = 240
    collapsed: bool = False
    widgets: List[Dict[str, Any]] = field(default_factory=list)


@dataclass
class Command:
    """AI command for GUI control."""
    command_id: str
    action: str  # click, type, key, move, scroll, drag, resize, close, focus
    timestamp: datetime
    target: Optional[str] = None
    params: Dict[str, Any] = field(default_factory=dict)
    source: str = "ai-agent"

    def to_yaml(self) -> str:
        """Serialize to YAML string."""
        import yaml
        return yaml.dump({
            "command_id": self.command_id,
            "action": self.action,
            "timestamp": self.timestamp.isoformat(),
            "target": self.target,
            "params": self.params,
            "source": self.source,
        }, default_flow_style=False)

    @classmethod
    def from_yaml(cls, content: str) -> "Command":
        """Deserialize from YAML string."""
        import yaml
        data = yaml.safe_load(content)
        return cls(
            command_id=data["command_id"],
            action=data["action"],
            timestamp=datetime.fromisoformat(data["timestamp"]),
            target=data.get("target"),
            params=data.get("params", {}),
            source=data.get("source", "ai-agent"),
        )
```

**Step 2: Commit**

```bash
git add systems/visual_shell/ascii_gui/models.py
git commit -m "feat(ascii-gui): add data models for windows, focus, mouse, keyboard, commands"
```

---

### Task 3: Implement Hook System

**Files:**
- Create: `systems/visual_shell/ascii_gui/hooks.py`
- Create: `tests/systems/visual_shell/ascii_gui/test_hooks.py`

**Step 1: Write the failing test**

```python
"""Tests for GUI hook system."""

import pytest
from systems.visual_shell.ascii_gui.hooks import GUIShellHook, GUIHookBroadcaster


class MockHook(GUIShellHook):
    """Mock hook for testing."""

    def __init__(self):
        self.events = []

    async def on_window_create(self, id: str, title: str, pos: tuple, size: tuple):
        self.events.append(("window_create", id, title))

    async def on_window_focus(self, id: str):
        self.events.append(("window_focus", id))

    async def on_window_close(self, id: str):
        self.events.append(("window_close", id))

    async def on_mouse_move(self, x: int, y: int):
        self.events.append(("mouse_move", x, y))

    async def on_key_press(self, key: str, modifiers: list):
        self.events.append(("key_press", key, modifiers))

    async def on_menu_open(self, menu_id: str):
        self.events.append(("menu_open", menu_id))


@pytest.mark.asyncio
async def test_broadcaster_dispatches_to_all_hooks():
    """Test that broadcaster dispatches events to all registered hooks."""
    broadcaster = GUIHookBroadcaster()
    hook1 = MockHook()
    hook2 = MockHook()

    broadcaster.add_hook(hook1)
    broadcaster.add_hook(hook2)

    await broadcaster.on_window_create("win-001", "Terminal", (100, 50), (640, 480))

    assert len(hook1.events) == 1
    assert len(hook2.events) == 1
    assert hook1.events[0] == ("window_create", "win-001", "Terminal")
    assert hook2.events[0] == ("window_create", "win-001", "Terminal")


@pytest.mark.asyncio
async def test_broadcaster_handles_hook_exceptions():
    """Test that broadcaster continues even if a hook raises."""
    broadcaster = GUIHookBroadcaster()

    class FailingHook(GUIShellHook):
        async def on_window_create(self, *args): raise RuntimeError("fail")
        async def on_window_focus(self, id): pass
        async def on_window_close(self, id): pass
        async def on_mouse_move(self, x, y): pass
        async def on_key_press(self, key, modifiers): pass
        async def on_menu_open(self, menu_id): pass

    hook1 = FailingHook()
    hook2 = MockHook()

    broadcaster.add_hook(hook1)
    broadcaster.add_hook(hook2)

    # Should not raise, hook2 should still receive event
    await broadcaster.on_window_create("win-001", "Test", (0, 0), (100, 100))

    assert len(hook2.events) == 1
```

**Step 2: Run test to verify it fails**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest tests/systems/visual_shell/ascii_gui/test_hooks.py -v 2>&1 | head -20`
Expected: FAIL with module not found

**Step 3: Implement hooks**

```python
"""
GUI Hook System - Event dispatch for GUI state changes.

Provides abstract hook interface and broadcaster for multi-listener dispatch.
"""

import asyncio
import logging
from abc import ABC, abstractmethod
from typing import List, Tuple, Any

logger = logging.getLogger(__name__)


class GUIShellHook(ABC):
    """
    Abstract base class for GUI shell hooks.

    Implement this interface to receive GUI events.
    All methods are async for non-blocking dispatch.
    """

    @abstractmethod
    async def on_window_create(self, id: str, title: str, pos: Tuple[int, int], size: Tuple[int, int]):
        """Called when a new window is created."""
        pass

    @abstractmethod
    async def on_window_focus(self, id: str):
        """Called when window focus changes."""
        pass

    @abstractmethod
    async def on_window_close(self, id: str):
        """Called when a window is closed."""
        pass

    @abstractmethod
    async def on_mouse_move(self, x: int, y: int):
        """Called when mouse position changes."""
        pass

    @abstractmethod
    async def on_key_press(self, key: str, modifiers: List[str]):
        """Called when a key is pressed."""
        pass

    @abstractmethod
    async def on_menu_open(self, menu_id: str):
        """Called when a menu is opened."""
        pass


class GUIHookBroadcaster(GUIShellHook):
    """
    Broadcasts GUI events to multiple hooks.

    Uses asyncio.gather with return_exceptions=True to ensure
    all hooks receive events even if some fail.
    """

    def __init__(self):
        self.hooks: List[GUIShellHook] = []

    def add_hook(self, hook: GUIShellHook) -> None:
        """Register a hook to receive events."""
        self.hooks.append(hook)

    def remove_hook(self, hook: GUIShellHook) -> None:
        """Unregister a hook."""
        if hook in self.hooks:
            self.hooks.remove(hook)

    async def _dispatch(self, method_name: str, *args, **kwargs) -> None:
        """Dispatch to all hooks, catching exceptions."""
        if not self.hooks:
            return

        async def call_hook(hook: GUIShellHook):
            try:
                method = getattr(hook, method_name)
                await method(*args, **kwargs)
            except Exception as e:
                logger.error(f"Hook {hook.__class__.__name__}.{method_name} failed: {e}")

        await asyncio.gather(*[call_hook(h) for h in self.hooks], return_exceptions=True)

    async def on_window_create(self, id: str, title: str, pos: Tuple[int, int], size: Tuple[int, int]):
        await self._dispatch("on_window_create", id, title, pos, size)

    async def on_window_focus(self, id: str):
        await self._dispatch("on_window_focus", id)

    async def on_window_close(self, id: str):
        await self._dispatch("on_window_close", id)

    async def on_mouse_move(self, x: int, y: int):
        await self._dispatch("on_mouse_move", x, y)

    async def on_key_press(self, key: str, modifiers: List[str]):
        await self._dispatch("on_key_press", key, modifiers)

    async def on_menu_open(self, menu_id: str):
        await self._dispatch("on_menu_open", menu_id)
```

**Step 4: Create test directory and run test**

```bash
mkdir -p tests/systems/visual_shell/ascii_gui
touch tests/systems/visual_shell/ascii_gui/__init__.py
```

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest tests/systems/visual_shell/ascii_gui/test_hooks.py -v`
Expected: 2 passed

**Step 5: Commit**

```bash
git add systems/visual_shell/ascii_gui/hooks.py tests/systems/visual_shell/ascii_gui/
git commit -m "feat(ascii-gui): implement hook system with broadcaster"
```

---

## Phase 2: Fragment Renderer

### Task 4: Implement Fragment Renderer - Windows

**Files:**
- Create: `systems/visual_shell/ascii_gui/fragment_renderer.py`
- Create: `tests/systems/visual_shell/ascii_gui/test_fragment_renderer.py`

**Step 1: Write the failing test**

```python
"""Tests for GUI fragment renderer."""

import pytest
from pathlib import Path
import tempfile
from datetime import datetime

from systems.visual_shell.ascii_gui.fragment_renderer import GUIFragmentRenderer
from systems.visual_shell.ascii_gui.models import Window, WindowType


@pytest.fixture
def temp_output_dir():
    with tempfile.TemporaryDirectory() as d:
        yield Path(d)


@pytest.mark.asyncio
async def test_render_windows_fragment(temp_output_dir):
    """Test that windows fragment is rendered correctly."""
    renderer = GUIFragmentRenderer(output_dir=temp_output_dir)

    # Create windows
    await renderer.on_window_create("win-001", "Terminal", (100, 50), (640, 480))
    await renderer.on_window_create("win-002", "Editor", (750, 50), (800, 600))
    await renderer.on_window_focus("win-001")

    # Check fragment file exists
    fragment_path = temp_output_dir / "windows.ascii"
    assert fragment_path.exists()

    content = fragment_path.read_text()
    assert "win-001" in content
    assert "Terminal" in content
    assert "win-002" in content
    assert "Editor" in content
    assert "focused: true" in content


@pytest.mark.asyncio
async def test_render_focus_fragment(temp_output_dir):
    """Test that focus fragment is rendered correctly."""
    renderer = GUIFragmentRenderer(output_dir=temp_output_dir)

    await renderer.on_window_create("win-001", "Terminal", (100, 50), (640, 480))
    await renderer.on_window_focus("win-001")

    fragment_path = temp_output_dir / "focus.ascii"
    assert fragment_path.exists()

    content = fragment_path.read_text()
    assert "win-001" in content
    assert "Terminal" in content
    assert "FOCUS STATE" in content
```

**Step 2: Run test to verify it fails**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest tests/systems/visual_shell/ascii_gui/test_fragment_renderer.py -v 2>&1 | head -20`
Expected: FAIL with module not found

**Step 3: Implement fragment renderer**

```python
"""
GUI Fragment Renderer - Converts GUI state to ASCII fragments.

Emits .ascii files representing the GUI state including:
- windows.ascii: YAML-like tree of active windows
- focus.ascii: ASCII box with current focus state
- mouse.ascii: ASCII box with mouse position
- keyboard.ascii: ASCII box with keyboard state

Follows atomic write pattern (temp file + rename).
"""

import os
import tempfile
from dataclasses import dataclass, field
from datetime import datetime
from pathlib import Path
from typing import Dict, List, Optional, Tuple, Any
import logging
import yaml

from systems.visual_shell.ascii_gui.hooks import GUIShellHook
from systems.visual_shell.ascii_gui.models import (
    Window, WindowType, FocusState, MouseState, KeyboardState
)

logger = logging.getLogger(__name__)


def atomic_write(path: Path, content: str) -> None:
    """Write to temp file, then atomic rename."""
    temp = path.with_suffix(".tmp")
    temp.write_text(content)
    temp.replace(path)


class GUIFragmentRenderer(GUIShellHook):
    """
    ASCII renderer for GUI state.

    Implements GUIShellHook to receive GUI events and emits .ascii files
    for zero-cost AI perception.

    Output files (in output_dir):
        - windows.ascii: YAML-like tree of active windows
        - focus.ascii: ASCII box with focus state
        - mouse.ascii: ASCII box with mouse state
        - keyboard.ascii: ASCII box with keyboard state
    """

    def __init__(self, output_dir: Path = Path(".geometry/gui/fragments")):
        self.output_dir = Path(output_dir)
        self.output_dir.mkdir(parents=True, exist_ok=True)

        self.windows: Dict[str, Window] = {}
        self.focused_id: Optional[str] = None
        self.mouse = MouseState()
        self.keyboard = KeyboardState()

        self._last_write: Dict[str, datetime] = {}
        self._min_write_interval_ms = 100  # Throttle writes

    async def on_window_create(self, id: str, title: str, pos: Tuple[int, int], size: Tuple[int, int]):
        """Handle window creation."""
        self.windows[id] = Window(
            id=id,
            title=title,
            pos=pos,
            size=size,
        )
        self._write_windows()

    async def on_window_focus(self, id: str):
        """Handle focus change."""
        # Clear previous focus
        if self.focused_id and self.focused_id in self.windows:
            self.windows[self.focused_id].focused = False

        self.focused_id = id
        if id in self.windows:
            self.windows[id].focused = True

        self._write_windows()
        self._write_focus()

    async def on_window_close(self, id: str):
        """Handle window close."""
        if id in self.windows:
            del self.windows[id]
        if self.focused_id == id:
            self.focused_id = None

        self._write_windows()
        self._write_focus()

    async def on_mouse_move(self, x: int, y: int):
        """Handle mouse movement."""
        self.mouse.pos = (x, y)
        self._write_mouse()

    async def on_key_press(self, key: str, modifiers: List[str]):
        """Handle key press."""
        self.keyboard.last_key = key
        self.keyboard.last_key_time = datetime.now()
        self.keyboard.modifiers = modifiers
        self._write_keyboard()

    async def on_menu_open(self, menu_id: str):
        """Handle menu open (no fragment for menus yet)."""
        pass

    def _write_windows(self) -> None:
        """Write windows fragment."""
        content = yaml.dump({
            "#": "ASCII Window Fragment",
            "#updated": datetime.now().isoformat(),
            "windows": [w.to_yaml_dict() for w in sorted(
                self.windows.values(), key=lambda w: -w.z_index
            )],
        }, default_flow_style=False, sort_keys=False)

        atomic_write(self.output_dir / "windows.ascii", content)
        logger.debug(f"Wrote windows.ascii with {len(self.windows)} windows")

    def _write_focus(self) -> None:
        """Write focus fragment as ASCII box."""
        focused_window = None
        if self.focused_id and self.focused_id in self.windows:
            focused_window = self.windows[self.focused_id]

        lines = [
            "+" + "-" * 76 + "+",
            "| {:^74} |".format("FOCUS STATE"),
            "+" + "-" * 76 + "+",
        ]

        if focused_window:
            lines.extend([
                "| Window:     {:67} |".format(f"{focused_window.id} ({focused_window.title})"),
                "| Element:    {:67} |".format("root"),
                "| Cursor:     {:67} |".format(str((0, 0))),
                "| Selection:  {:67} |".format("None"),
                "| Mode:       {:67} |".format("normal"),
            ])
        else:
            lines.extend([
                "| Window:     {:67} |".format("(none)"),
                "| Element:    {:67} |".format("-"),
                "| Cursor:     {:67} |".format("-"),
                "| Selection:  {:67} |".format("-"),
                "| Mode:       {:67} |".format("-"),
            ])

        lines.append("+" + "-" * 76 + "+")

        atomic_write(self.output_dir / "focus.ascii", "\n".join(lines) + "\n")
        logger.debug("Wrote focus.ascii")

    def _write_mouse(self) -> None:
        """Write mouse fragment as ASCII box."""
        lines = [
            "+" + "-" * 76 + "+",
            "| {:^74} |".format("MOUSE STATE"),
            "+" + "-" * 76 + "+",
            "| Position:   {:67} |".format(str(self.mouse.pos)),
            "| Screen:     {:67} |".format(str(self.mouse.screen_pos)),
            "| Window:     {:67} |".format(self.mouse.window_id or "(none)"),
            "| Buttons:    {:67} |".format(str(self.mouse.buttons) if self.mouse.buttons else "[none]"),
            "| Modifiers:  {:67} |".format(str(self.mouse.modifiers) if self.mouse.modifiers else "[none]"),
            "| Hover:      {:67} |".format(self.mouse.hover_element or "(none)"),
            "+" + "-" * 76 + "+",
        ]

        atomic_write(self.output_dir / "mouse.ascii", "\n".join(lines) + "\n")
        logger.debug("Wrote mouse.ascii")

    def _write_keyboard(self) -> None:
        """Write keyboard fragment as ASCII box."""
        last_key_info = "-"
        if self.keyboard.last_key and self.keyboard.last_key_time:
            last_key_info = f"'{self.keyboard.last_key}' at {self.keyboard.last_key_time.isoformat()}"

        lines = [
            "+" + "-" * 76 + "+",
            "| {:^74} |".format("KEYBOARD STATE"),
            "+" + "-" * 76 + "+",
            "| Pressed:    {:67} |".format(str(self.keyboard.pressed) if self.keyboard.pressed else "[none]"),
            "| Modifiers:  {:67} |".format(str(self.keyboard.modifiers) if self.keyboard.modifiers else "[none]"),
            "| Last Key:   {:67} |".format(last_key_info),
            "| Layout:     {:67} |".format(self.keyboard.layout),
            "+" + "-" * 76 + "+",
        ]

        atomic_write(self.output_dir / "keyboard.ascii", "\n".join(lines) + "\n")
        logger.debug("Wrote keyboard.ascii")

    def render_all(self) -> None:
        """Render all fragments."""
        self._write_windows()
        self._write_focus()
        self._write_mouse()
        self._write_keyboard()
```

**Step 4: Run test to verify it passes**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest tests/systems/visual_shell/ascii_gui/test_fragment_renderer.py -v`
Expected: 2 passed

**Step 5: Commit**

```bash
git add systems/visual_shell/ascii_gui/fragment_renderer.py tests/systems/visual_shell/ascii_gui/test_fragment_renderer.py
git commit -m "feat(ascii-gui): implement fragment renderer with windows, focus, mouse, keyboard"
```

---

## Phase 3: Command Processor

### Task 5: Implement Command Processor

**Files:**
- Create: `systems/visual_shell/ascii_gui/command_processor.py`
- Create: `tests/systems/visual_shell/ascii_gui/test_command_processor.py`

**Step 1: Write the failing test**

```python
"""Tests for command processor."""

import pytest
from pathlib import Path
import tempfile
from datetime import datetime
import asyncio

from systems.visual_shell.ascii_gui.command_processor import GUICommandProcessor
from systems.visual_shell.ascii_gui.models import Command


@pytest.fixture
def temp_dirs():
    with tempfile.TemporaryDirectory() as d:
        pending = Path(d) / "pending"
        completed = Path(d) / "completed"
        pending.mkdir()
        completed.mkdir()
        yield pending, completed


@pytest.mark.asyncio
async def test_process_click_command(temp_dirs):
    """Test processing a click command."""
    pending, completed = temp_dirs

    executed = []

    async def mock_execute(cmd):
        executed.append(cmd)

    processor = GUICommandProcessor(
        pending_dir=pending,
        completed_dir=completed,
        executor=mock_execute,
    )

    # Write a command
    cmd = Command(
        command_id="cmd-001",
        action="click",
        timestamp=datetime.now(),
        target="button[title='Save']",
        params={"button": "left", "count": 1},
    )

    cmd_path = pending / "cmd-001.ascii"
    cmd_path.write_text(cmd.to_yaml())

    # Process once
    await processor.process_pending()

    assert len(executed) == 1
    assert executed[0].command_id == "cmd-001"
    assert not cmd_path.exists()  # Should be moved
    assert (completed / "cmd-001.ascii").exists()


@pytest.mark.asyncio
async def test_invalid_command_rejected(temp_dirs):
    """Test that invalid commands are rejected."""
    pending, completed = temp_dirs

    executed = []

    async def mock_execute(cmd):
        executed.append(cmd)

    processor = GUICommandProcessor(
        pending_dir=pending,
        completed_dir=completed,
        executor=mock_execute,
    )

    # Write invalid command (missing required field)
    cmd_path = pending / "cmd-bad.ascii"
    cmd_path.write_text("action: click\n")  # Missing command_id and timestamp

    await processor.process_pending()

    assert len(executed) == 0
    assert not cmd_path.exists()
    # Should be moved to completed with error
    assert (completed / "cmd-bad.ascii").exists()
```

**Step 2: Run test to verify it fails**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest tests/systems/visual_shell/ascii_gui/test_command_processor.py -v 2>&1 | head -20`
Expected: FAIL with module not found

**Step 3: Implement command processor**

```python
"""
GUI Command Processor - Processes AI commands from file queue.

Watches commands/pending/ for new commands, validates against schema,
executes via injected executor, and moves to commands/completed/.
"""

import asyncio
import logging
from datetime import datetime
from pathlib import Path
from typing import Callable, Awaitable, Optional, List
import yaml

from systems.visual_shell.ascii_gui.models import Command

logger = logging.getLogger(__name__)

# Valid command actions
VALID_ACTIONS = {"click", "type", "key", "move", "scroll", "drag", "resize", "close", "focus"}


class GUICommandProcessor:
    """
    Processes AI commands from the command queue.

    Watches commands/pending/ for new command files, validates them,
    executes via the injected executor, and moves to commands/completed/.

    Uses file-based queue for persistence and replay capability.
    """

    def __init__(
        self,
        pending_dir: Path = Path(".geometry/gui/commands/pending"),
        completed_dir: Path = Path(".geometry/gui/commands/completed"),
        executor: Optional[Callable[[Command], Awaitable[None]]] = None,
    ):
        self.pending_dir = Path(pending_dir)
        self.completed_dir = Path(completed_dir)
        self.executor = executor

        self.pending_dir.mkdir(parents=True, exist_ok=True)
        self.completed_dir.mkdir(parents=True, exist_ok=True)

        self._running = False
        self._poll_interval = 0.1  # seconds

    async def start(self) -> None:
        """Start the command processing loop."""
        self._running = True
        logger.info("Command processor started")

        while self._running:
            try:
                await self.process_pending()
            except Exception as e:
                logger.error(f"Error processing commands: {e}")

            await asyncio.sleep(self._poll_interval)

    def stop(self) -> None:
        """Stop the command processing loop."""
        self._running = False
        logger.info("Command processor stopped")

    async def process_pending(self) -> List[Command]:
        """Process all pending commands."""
        processed = []

        for cmd_file in sorted(self.pending_dir.glob("*.ascii")):
            try:
                cmd = await self._load_command(cmd_file)
                if cmd:
                    await self._execute_command(cmd)
                    processed.append(cmd)
                    self._move_to_completed(cmd_file, success=True)
            except Exception as e:
                logger.error(f"Failed to process {cmd_file}: {e}")
                self._move_to_completed(cmd_file, success=False, error=str(e))

        return processed

    async def _load_command(self, path: Path) -> Optional[Command]:
        """Load and validate a command from file."""
        try:
            content = path.read_text()
            data = yaml.safe_load(content)

            # Validate required fields
            if not data:
                raise ValueError("Empty command file")

            if "command_id" not in data:
                raise ValueError("Missing command_id")

            if "action" not in data:
                raise ValueError("Missing action")

            if data["action"] not in VALID_ACTIONS:
                raise ValueError(f"Invalid action: {data['action']}")

            if "timestamp" not in data:
                raise ValueError("Missing timestamp")

            return Command(
                command_id=data["command_id"],
                action=data["action"],
                timestamp=datetime.fromisoformat(data["timestamp"]),
                target=data.get("target"),
                params=data.get("params", {}),
                source=data.get("source", "ai-agent"),
            )
        except Exception as e:
            logger.warning(f"Invalid command in {path}: {e}")
            return None

    async def _execute_command(self, cmd: Command) -> None:
        """Execute a validated command."""
        if self.executor:
            await self.executor(cmd)
            logger.info(f"Executed command {cmd.command_id}: {cmd.action}")
        else:
            logger.warning(f"No executor set, command {cmd.command_id} not executed")

    def _move_to_completed(self, path: Path, success: bool, error: str = "") -> None:
        """Move command file to completed directory."""
        dest = self.completed_dir / path.name

        if not success:
            # Append error info
            content = path.read_text()
            content += f"\n# Processing result: FAILED\n# Error: {error}\n# Completed: {datetime.now().isoformat()}\n"
            dest.write_text(content)
        else:
            content = path.read_text()
            content += f"\n# Processing result: SUCCESS\n# Completed: {datetime.now().isoformat()}\n"
            dest.write_text(content)

        path.unlink()
        logger.debug(f"Moved {path.name} to completed ({'success' if success else 'failed'})")
```

**Step 4: Run test to verify it passes**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest tests/systems/visual_shell/ascii_gui/test_command_processor.py -v`
Expected: 2 passed

**Step 5: Commit**

```bash
git add systems/visual_shell/ascii_gui/command_processor.py tests/systems/visual_shell/ascii_gui/test_command_processor.py
git commit -m "feat(ascii-gui): implement command processor with validation"
```

---

## Phase 4: Integration

### Task 6: Update Module Exports

**Files:**
- Modify: `systems/visual_shell/ascii_gui/__init__.py`

**Step 1: Update __init__.py with all exports**

```python
"""
ASCII GUI System - Dual-audience interface for humans and AIs.

Exposes all GUI state as ASCII fragments in .geometry/gui/ for zero-cost
AI perception while rendering visually for human users.

Usage:
    from systems.visual_shell.ascii_gui import GUIFragmentRenderer, GUICommandProcessor

    # Set up fragment renderer
    renderer = GUIFragmentRenderer(output_dir=Path(".geometry/gui/fragments"))
    broadcaster.add_hook(renderer)

    # Set up command processor
    async def execute_command(cmd):
        # Execute via GUIProtocol or similar
        pass

    processor = GUICommandProcessor(executor=execute_command)
    await processor.start()
"""

from systems.visual_shell.ascii_gui.hooks import (
    GUIShellHook,
    GUIHookBroadcaster,
)
from systems.visual_shell.ascii_gui.models import (
    Window,
    WindowType,
    FocusState,
    MouseState,
    KeyboardState,
    MenuItem,
    Menu,
    Panel,
    PanelType,
    Command,
)
from systems.visual_shell.ascii_gui.fragment_renderer import (
    GUIFragmentRenderer,
    atomic_write,
)
from systems.visual_shell.ascii_gui.command_processor import (
    GUICommandProcessor,
)

__all__ = [
    # Hooks
    "GUIShellHook",
    "GUIHookBroadcaster",
    # Models
    "Window",
    "WindowType",
    "FocusState",
    "MouseState",
    "KeyboardState",
    "MenuItem",
    "Menu",
    "Panel",
    "PanelType",
    "Command",
    # Renderer
    "GUIFragmentRenderer",
    "atomic_write",
    # Processor
    "GUICommandProcessor",
]
```

**Step 2: Verify imports work**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -c "from systems.visual_shell.ascii_gui import GUIFragmentRenderer, GUICommandProcessor, GUIHookBroadcaster; print('OK')"`
Expected: OK

**Step 3: Commit**

```bash
git add systems/visual_shell/ascii_gui/__init__.py
git commit -m "feat(ascii-gui): update module exports"
```

---

### Task 7: Run All Tests

**Step 1: Run all ascii_gui tests**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest tests/systems/visual_shell/ascii_gui/ -v`
Expected: All tests pass

**Step 2: Commit test status**

```bash
git add -A
git commit -m "test(ascii-gui): verify all tests pass"
```

---

### Task 8: Create Integration Example

**Files:**
- Create: `systems/visual_shell/ascii_gui/example.py`

**Step 1: Create example script**

```python
#!/usr/bin/env python3
"""
Example usage of ASCII GUI system.

This demonstrates:
1. Setting up the hook broadcaster
2. Creating a fragment renderer
3. Simulating GUI events
4. Reading fragments as an AI would
"""

import asyncio
from pathlib import Path

from systems.visual_shell.ascii_gui import (
    GUIHookBroadcaster,
    GUIFragmentRenderer,
    GUICommandProcessor,
    Command,
)
from systems.visual_shell.ascii_gui.models import Command
from datetime import datetime


async def main():
    # Set up output directory
    output_dir = Path(".geometry/gui/fragments")
    output_dir.mkdir(parents=True, exist_ok=True)

    # Create broadcaster
    broadcaster = GUIHookBroadcaster()

    # Create and register fragment renderer
    renderer = GUIFragmentRenderer(output_dir=output_dir)
    broadcaster.add_hook(renderer)

    # Simulate some GUI events
    print("Simulating GUI events...")
    await broadcaster.on_window_create("win-001", "Terminal", (100, 50), (640, 480))
    await broadcaster.on_window_create("win-002", "Code Editor", (750, 50), (800, 600))
    await broadcaster.on_window_focus("win-001")
    await broadcaster.on_mouse_move(512, 384)

    # Read fragments as an AI would
    print("\n--- AI reads windows.ascii ---")
    print((output_dir / "windows.ascii").read_text())

    print("\n--- AI reads focus.ascii ---")
    print((output_dir / "focus.ascii").read_text())

    print("\n--- AI reads mouse.ascii ---")
    print((output_dir / "mouse.ascii").read_text())

    # AI writes a command
    print("\n--- AI writes command ---")
    pending_dir = Path(".geometry/gui/commands/pending")
    pending_dir.mkdir(parents=True, exist_ok=True)

    cmd = Command(
        command_id="cmd-001",
        action="click",
        timestamp=datetime.now(),
        target="win-002",
        params={"button": "left", "count": 1},
    )
    cmd_path = pending_dir / "cmd-001.ascii"
    cmd_path.write_text(cmd.to_yaml())
    print(f"Wrote command to {cmd_path}")
    print(cmd.to_yaml())


if __name__ == "__main__":
    asyncio.run(main())
```

**Step 2: Run the example**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python systems/visual_shell/ascii_gui/example.py`
Expected: Fragment files created and displayed

**Step 3: Commit**

```bash
git add systems/visual_shell/ascii_gui/example.py
git commit -m "docs(ascii-gui): add example usage script"
```

---

## Verification

### Final Verification Task

**Step 1: Run all tests**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest tests/systems/visual_shell/ascii_gui/ -v --tb=short`
Expected: All tests pass

**Step 2: Verify directory structure**

Run: `tree .geometry/gui/`
Expected:
```
.geometry/gui/
├── commands/
│   ├── completed/
│   └── pending/
├── fragments/
├── schemas/
└── state/
```

**Step 3: Verify fragments exist after running example**

Run: `ls -la .geometry/gui/fragments/`
Expected: windows.ascii, focus.ascii, mouse.ascii, keyboard.ascii

---

## Summary

This plan implements the ASCII GUI system in 8 tasks:

1. **Module Structure** - Create directories and __init__.py
2. **Data Models** - Window, FocusState, MouseState, KeyboardState, Command
3. **Hook System** - GUIShellHook interface and GUIHookBroadcaster
4. **Fragment Renderer** - GUIFragmentRenderer with YAML and ASCII box output
5. **Command Processor** - GUICommandProcessor with validation and execution
6. **Module Exports** - Update __init__.py
7. **Test Verification** - Run all tests
8. **Example Script** - Demonstrate usage

Each task follows TDD with failing tests first, minimal implementation, and verification.
