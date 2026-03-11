# AI-GUI Control Surface Implementation Plan

> Implementation plan for the AI-GUI Control Surface Design (2026-02-15)

**Status:** Draft
**Created:** 2026-02-16
**Target:** 4-6 weeks

---

## Overview

This plan implements the AI-GUI Control Surface, enabling AI agents to operate GUI applications as first-class tiles on the Geometry OS Infinite Map. The core innovation: apps become tiles, AI uses WebMCP.

**Key Deliverable:** A fully functional system where an AI agent can launch, operate, and coordinate GUI applications through the WebMCP bridge.

---

## Phase 1: Foundation (Week 1)

**Goal:** Core infrastructure for tile-based app management

### Task 1.1: Create Module Structure

**File:** `systems/ai_gui/__init__.py`

```python
# Create module with version info and public API
__version__ = "0.1.0"
```

**Commands:**
```bash
mkdir -p systems/ai_gui/{specialists,backends,shortcuts}
mkdir -p data/ai_gui/schemas
touch systems/ai_gui/{__init__,orchestrator,tile_app_manager,goal_parser,workflow_engine}.py
touch systems/ai_gui/specialists/{__init__,base,gtk_specialist,qt_specialist,electron_specialist}.py
touch systems/ai_gui/backends/{__init__,base,vnc_backend,wasm_backend,native_backend}.py
touch systems/ai_gui/shortcuts/{__init__,registry,injector}.py
```

**Verification:** `python -c "from systems.ai_gui import __version__; print(__version__)"`

---

### Task 1.2: Tile App Manager - Core

**File:** `systems/ai_gui/tile_app_manager.py`

**Requirements:**
- Tile registry (in-memory + JSON persistence)
- App lifecycle: spawn, focus, close
- Backend selection logic
- Location assignment (auto or specified)

**API:**
```python
class TileAppManager:
    async def launch_app(self, app: str, backend: str = "auto",
                         location: tuple = None) -> Tile
    async def focus_tile(self, tile_id: str) -> bool
    async def close_tile(self, tile_id: str, force: bool = False) -> bool
    async def list_tiles(self) -> list[Tile]
    async def get_tile(self, tile_id: str) -> Tile | None
```

**Data:**
```python
@dataclass
class Tile:
    id: str
    app: str
    backend: str  # "vnc" | "wasm" | "native"
    location: tuple[int, int]
    state: str    # "spawning" | "running" | "idle" | "error"
    created_at: datetime
    process: any  # Backend-specific process handle
```

**Verification:** Unit test with mock backends

---

### Task 1.3: Backend Interface

**File:** `systems/ai_gui/backends/base.py`

**Requirements:**
- Abstract base class for all backends
- Common lifecycle methods
- Input and capture interfaces

**API:**
```python
class BaseBackend(ABC):
    @abstractmethod
    async def spawn(self, app_config: AppConfig) -> Tile

    @abstractmethod
    async def send_input(self, tile_id: str, input: InputEvent) -> bool

    @abstractmethod
    async def capture_frame(self, tile_id: str) -> bytes

    @abstractmethod
    async def terminate(self, tile_id: str) -> bool

    @abstractmethod
    async def health_check(self, tile_id: str) -> bool
```

**Verification:** Unit test verifying interface compliance

---

### Task 1.4: VNC Backend (Stub)

**File:** `systems/ai_gui/backends/vnc_backend.py`

**Requirements:**
- Implement BaseBackend
- Mock QEMU spawning (just log, don't actually start)
- Websockify integration placeholder
- Screenshot capture placeholder

**This is a stub for Phase 1 - real implementation in Phase 2**

**Verification:** Unit test with mocked subprocess calls

---

## Phase 2: VNC Backend (Week 2)

**Goal:** Working VNC streaming for real apps

### Task 2.1: QEMU + VNC Integration

**File:** `systems/ai_gui/backends/vnc_backend.py`

**Requirements:**
- Spawn QEMU with VNC display
- Configure memory, CPU, disk
- Alpine Linux base image support
- VNC port assignment and tracking

**Implementation:**
```python
class VNCBackend(BaseBackend):
    def __init__(self):
        self.next_display = 10  # VNC displays start at :10
        self.tiles: dict[str, Tile] = {}

    async def spawn(self, config: AppConfig) -> Tile:
        display = self._next_vnc_display()
        cmd = self._build_qemu_cmd(config, display)
        process = await asyncio.create_subprocess_exec(*cmd)
        # ... create and return tile
```

**Verification:** Can launch Alpine Linux in QEMU and VNC to it

---

### Task 2.2: Websockify Bridge

**File:** `systems/ai_gui/backends/vnc_backend.py` (extended)

**Requirements:**
- Start websockify for browser VNC access
- WebSocket URL generation for PixiJS
- Connection health monitoring

**Implementation:**
```python
async def _start_websockify(self, vnc_port: int, ws_port: int):
    """Bridge VNC to WebSocket for browser access"""
    proc = await asyncio.create_subprocess_exec(
        "websockify", str(ws_port), f"localhost:{vnc_port}"
    )
    return proc
```

**Verification:** Can connect to VNC app via browser WebSocket

---

### Task 2.3: Input Routing

**File:** `systems/ai_gui/backends/vnc_backend.py` (extended)

**Requirements:**
- Keyboard event injection (via QEMU monitor or VNC)
- Mouse click/move injection
- Input sanitization

**Implementation:**
```python
async def send_input(self, tile_id: str, event: InputEvent) -> bool:
    if event.type == "key":
        return await self._send_key(tile_id, event.keys, event.modifiers)
    elif event.type == "mouse":
        return await self._send_mouse(tile_id, event.x, event.y, event.button)
```

**Verification:** Can type text and click in VNC app

---

### Task 2.4: Frame Capture

**File:** `systems/ai_gui/backends/vnc_backend.py` (extended)

**Requirements:**
- Capture current frame as PNG/RGBA
- Return as bytes or base64
- Performance target: < 100ms

**Implementation:**
```python
async def capture_frame(self, tile_id: str) -> bytes:
    """Capture current VNC framebuffer"""
    # Use VNC client to grab frame, convert to PNG
```

**Verification:** Can capture screenshot of running app

---

## Phase 3: Specialists (Week 3)

**Goal:** Semantic access to GTK, Qt, and Electron apps

### Task 3.1: Specialist Base Class

**File:** `systems/ai_gui/specialists/base.py`

**Requirements:**
- Abstract interface for all specialists
- Discovery cascade framework
- Modification cascade framework

**API:**
```python
class BaseSpecialist(ABC):
    @property
    @abstractmethod
    def toolkit(self) -> str

    @abstractmethod
    async def discover_capabilities(self, app_handle) -> Capabilities

    @abstractmethod
    async def get_widget_tree(self, app_handle) -> WidgetTree

    @abstractmethod
    async def get_shortcuts(self, app_handle) -> list[Shortcut]

    @abstractmethod
    async def find_widget(self, app_handle, query: WidgetQuery) -> list[Widget]

    @abstractmethod
    async def inject_shortcut(self, app_handle, shortcut: Shortcut) -> bool
```

**Verification:** Unit test interface compliance

---

### Task 3.2: GTK Specialist

**File:** `systems/ai_gui/specialists/gtk_specialist.py`

**Requirements:**
- AT-SPI integration via pyatspi
- Widget tree traversal
- Shortcut extraction from menus
- Basic capability discovery

**Dependencies:** `pip install pyatspi`

**Implementation:**
```python
class GTKSpecialist(BaseSpecialist):
    toolkit = "gtk"

    async def get_widget_tree(self, app_handle) -> WidgetTree:
        desktop = pyatspi.Registry.getDesktop(0)
        for app in desktop:
            if app.name == app_handle.app_name:
                return self._traverse_accessible(app)
```

**Verification:** Can introspect a running GTK app (e.g., gedit)

---

### Task 3.3: Shortcut Registry

**File:** `systems/ai_gui/shortcuts/registry.py`

**Requirements:**
- In-memory shortcut database
- Load from app schemas
- Runtime shortcut discovery
- AI-added shortcut registration

**Schema:**
```python
@dataclass
class Shortcut:
    id: str
    app: str
    keys: str           # "Ctrl+S"
    action: str         # "Save"
    category: str       # "file" | "edit" | "ai-added"
    source: str         # "built-in" | "discovered" | "injected"
    description: str
```

**Verification:** Can register and query shortcuts

---

### Task 3.4: App Schema Format

**File:** `data/ai_gui/schemas/gimp.json` (example)

**Requirements:**
- JSON schema for app capabilities
- Shortcuts, widgets, custom actions
- Version tracking

**Example:**
```json
{
  "app": "gimp",
  "version": "2.10",
  "toolkit": "gtk",
  "shortcuts": [
    {"keys": "Ctrl+N", "action": "New", "category": "file"},
    {"keys": "Ctrl+S", "action": "Save", "category": "file"}
  ],
  "widgets": {
    "toolbox": {"type": "panel", "items": 25},
    "canvas": {"type": "drawing-area"}
  }
}
```

**Verification:** Schema validates and loads correctly

---

## Phase 4: WebMCP Integration (Week 4)

**Goal:** AI-GUI tools exposed through WebMCP

### Task 4.1: AI-GUI Bridge

**File:** `systems/visual_shell/web/ai_gui_bridge.js`

**Requirements:**
- Implement all WebMCP tools from design doc
- WebSocket communication to Python backend
- Error handling and timeouts

**Tools to Implement:**
- `gui_app_launch`
- `gui_app_list`
- `gui_app_focus`
- `gui_app_close`
- `gui_send_keys`
- `gui_send_text`
- `gui_click`
- `gui_screenshot`
- `gui_get_widget_tree`
- `gui_find_widget`
- `gui_get_shortcuts`
- `gui_discover_capabilities`

**Verification:** Each tool callable from WebMCP bridge

---

### Task 4.2: PixiJS Tile Integration

**File:** `systems/visual_shell/web/ai_gui_bridge.js` (extended)

**Requirements:**
- Create PixiJS Container for each tile
- VNC texture streaming via WebSocket
- Input event routing from PixiJS to backend

**Implementation:**
```javascript
class AppTile extends PIXI.Container {
    constructor(tileId, wsUrl) {
        super();
        this.tileId = tileId;
        this.vncClient = new VNCClient(wsUrl);
        this.sprite = new PIXI.Sprite();
        this.addChild(this.sprite);
        this.setupInputHandlers();
    }
}
```

**Verification:** App tiles render in Infinite Map

---

### Task 4.3: WebMCP Bridge Registration

**File:** `systems/visual_shell/web/webmcp_bridge.js` (modified)

**Requirements:**
- Register ai_gui tool category
- Route calls to AIGUIBridge
- Handle tool discovery for AI clients

**Verification:** AI can list and call AI-GUI tools

---

### Task 4.4: Python Backend Server

**File:** `systems/ai_gui/server.py`

**Requirements:**
- WebSocket server for JS bridge
- JSON-RPC or custom protocol
- Integration with TileAppManager and Specialists

**API:**
```python
class AIGUIServer:
    async def handle_launch_app(self, params) -> dict
    async def handle_send_keys(self, params) -> dict
    async def handle_screenshot(self, params) -> dict
    # ... all other tools
```

**Verification:** Full round-trip: JS → WebSocket → Python → Action → Response

---

## Phase 5: Orchestrator (Week 5)

**Goal:** High-level goal execution and workflow coordination

### Task 5.1: Goal Parser

**File:** `systems/ai_gui/goal_parser.py`

**Requirements:**
- Parse natural language goals to steps
- App identification from goal context
- Step dependency analysis

**Implementation:**
```python
class GoalParser:
    async def parse(self, goal: str, context: dict) -> list[Step]:
        # Use LLM or rule-based parsing
        # Return ordered list of steps
```

**Verification:** Parse "Create a spreadsheet with sales data" → steps

---

### Task 5.2: Workflow Engine

**File:** `systems/ai_gui/workflow_engine.py`

**Requirements:**
- Execute steps in order
- Visual verification after each step
- Error recovery and retry
- Timeout handling

**Implementation:**
```python
class WorkflowEngine:
    async def execute(self, steps: list[Step], tile: Tile) -> Result:
        for step in steps:
            result = await self._execute_step(step, tile)
            if not result.success:
                return self._handle_failure(step, result)
            await self._verify_step(step, tile)
        return Result(success=True)
```

**Verification:** Execute multi-step workflow end-to-end

---

### Task 5.3: AI-GUI Orchestrator

**File:** `systems/ai_gui/orchestrator.py`

**Requirements:**
- Compose GoalParser + WorkflowEngine + TileAppManager
- High-level API for AI consumers
- Multi-app coordination

**API:**
```python
class AIGUIOrchestrator:
    async def execute_goal(self, goal: str, context: dict = None) -> Result
    async def launch_app(self, app: str, **kwargs) -> Tile
    async def get_app_state(self, tile_id: str) -> AppState
    async def coordinate_workflow(self, apps: list[str], steps: list) -> Result
```

**Verification:** Full goal execution from string to result

---

## Phase 6: Testing & Polish (Week 6)

**Goal:** Production-ready system

### Task 6.1: Integration Tests

**File:** `systems/ai_gui/tests/test_integration.py`

**Requirements:**
- End-to-end test for each workflow type
- Mock backends for CI
- Real VNC tests (manual or special CI runner)

**Test Cases:**
1. Launch app → verify tile appears
2. Send keyboard input → verify state change
3. Multi-app workflow → verify coordination
4. Discovery → verify capability report

**Verification:** All tests pass

---

### Task 6.2: Performance Benchmarks

**File:** `systems/ai_gui/tests/test_performance.py`

**Requirements:**
- Measure key metrics
- Compare against targets

| Metric | Target | Test |
|--------|--------|------|
| App launch | < 2s | Launch 10 apps, avg time |
| Input latency | < 50ms | Send 100 keys, avg latency |
| Screenshot | < 100ms | Capture 50 frames, avg time |
| Widget tree | < 200ms | Query 20 trees, avg time |

**Verification:** All metrics meet targets

---

### Task 6.3: Documentation

**File:** `systems/ai_gui/README.md`

**Requirements:**
- Quick start guide
- API reference
- Architecture overview
- Troubleshooting

**Verification:** New developer can follow and succeed

---

### Task 6.4: Demo Script

**File:** `demos/ai_gui_demo.py`

**Requirements:**
- Self-contained demo
- Shows all key features
- Can be recorded for presentation

**Demo Flow:**
1. Launch LibreOffice Calc as tile
2. Create spreadsheet with data
3. Launch GIMP as tile
4. Copy chart from Calc to GIMP
5. Apply filter in GIMP
6. Save both files

**Verification:** Demo runs successfully

---

## Dependencies

### Python Packages
```
pyatspi        # AT-SPI for GTK/Qt accessibility
websockets     # WebSocket server
Pillow         # Image processing
```

### System Packages
```
qemu-system-x86_64  # VNC backend
websockify          # VNC→WebSocket bridge
```

### Node.js Packages
```
pixi.js             # Rendering
@novnc/novnc        # VNC client
```

---

## Risk Mitigation

| Risk | Mitigation |
|------|------------|
| AT-SPI unavailable | Fall back to visual-only control |
| VNC latency too high | Add WASM backend for simple apps |
| QEMU resource heavy | Implement backend pooling |
| Complex apps fail | Start with app whitelist, expand gradually |

---

## Success Criteria

1. **Functional:** AI can launch, operate, and coordinate 3+ apps
2. **Performance:** All targets met (see Task 6.2)
3. **Reliability:** 95%+ workflow success rate in tests
4. **Usability:** Demo script runs without manual intervention

---

## Next Actions

1. Review and approve this plan
2. Begin Phase 1, Task 1.1 (Create Module Structure)
3. Set up CI for new module
