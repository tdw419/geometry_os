# AI-GUI Control Surface Design

> "The Map is the Desktop. Apps are Tiles. AI uses WebMCP."

**Date:** 2026-02-15
**Status:** Approved
**Version:** 1.0

---

## Executive Summary

This document defines the architecture for AI agents (both internal and external) to operate graphical user interfaces within Geometry OS. The core innovation is treating GUI applications as first-class tiles on the PixiJS Infinite Map, enabling unified control through existing WebMCP tools.

---

## 1. Core Concept

### The Paradigm Shift

Instead of building bridges to control external GUIs, we bring GUIs *into* the Geometry OS map as tile objects. The AI doesn't "control" apps from outside - it operates within a unified spatial environment where apps are native objects.

| Traditional Approach | Geometry OS Approach |
|---------------------|---------------------|
| AI controls external apps | Apps become map tiles |
| Screenshot APIs for visual | Texture already available |
| AT-SPI/xdotool for input | Unified tile input routing |
| Hard cross-app coordination | All tiles on same map |
| "Find window X" | "Navigate to (x, y)" |

### Key Design Decisions

| Dimension | Decision |
|-----------|----------|
| **AI Consumers** | Both internal agents + external LLMs |
| **Interaction Model** | Hybrid: keyboard shortcuts (primary) + semantic tree + visual perception |
| **Target Apps** | Native Linux (GTK, Qt, Electron) first |
| **Use Case** | Autonomous agency (superset of automation and orchestration) |
| **Discovery Method** | Cascading: schemas → AT-SPI → visual/inference → exploration |
| **Modification Strategy** | Preferred: plugins → accessibility overlay → direct patches |
| **Rendering Backend** | Hybrid: VNC (universal) + WASM (fast) + Native (specialized) |

---

## 2. Architecture Overview

```
┌─────────────────────────────────────────────────────────────────────┐
│                     Geometry OS AI-GUI System                       │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  ┌───────────────────────────────────────────────────────────────┐  │
│  │                    AI-GUI Orchestrator                        │  │
│  │  ┌─────────────┐ ┌─────────────┐ ┌─────────────────────────┐  │  │
│  │  │   Goal      │ │   Workflow  │ │   Tile App Manager      │  │  │
│  │  │   Parser    │ │   Engine    │ │   • Spawn apps as tiles │  │  │
│  │  │             │ │             │ │   • Route WebMCP→tiles  │  │  │
│  │  └─────────────┘ └─────────────┘ │   • Maintain registry   │  │  │
│  │                                   └─────────────────────────┘  │  │
│  └───────────────────────────────────────────────────────────────┘  │
│                                    │                                │
│         ┌──────────────────────────┼──────────────────────────┐     │
│         ▼                          ▼                          ▼     │
│  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐     │
│  │ GTK Specialist  │  │  Qt Specialist  │  │Electron Spec.   │     │
│  │ ┌─────────────┐ │  │ ┌─────────────┐ │  │ ┌─────────────┐ │     │
│  │ │AT-SPI Client│ │  │ │AT-SPI Client│ │  │ │DevTools     │ │     │
│  │ ├─────────────┤ │  │ ├─────────────┤ │  │ │Protocol     │ │     │
│  │ │Shortcut     │ │  │ │Shortcut     │ │  │ ├─────────────┤ │     │
│  │ │Registry     │ │  │ │Registry     │ │  │ │Shortcut     │ │     │
│  │ ├─────────────┤ │  │ ├─────────────┤ │  │ │Registry     │ │     │
│  │ │Plugin       │ │  │ │Plugin       │ │  │ ├─────────────┤ │     │
│  │ │Manager      │ │  │ │Manager      │ │  │ │Extension    │ │     │
│  │ └─────────────┘ │  │ └─────────────┘ │  │ │Manager      │ │     │
│  └─────────────────┘  └─────────────────┘  │ └─────────────┘ │     │
│                                            └─────────────────┘     │
│                                    │                                │
│  ┌───────────────────────────────────────────────────────────────┐  │
│  │                   Hybrid Tile Backends                        │  │
│  │  ┌─────────────┐ ┌─────────────┐ ┌─────────────────────────┐  │  │
│  │  │     VNC     │ │    WASM     │ │       Native            │  │  │
│  │  │  Streaming  │ │  Compiled   │ │    Integration          │  │  │
│  │  │ (Universal) │ │ (Fast)      │ │  (Specialized: term)    │  │  │
│  │  └─────────────┘ └─────────────┘ └─────────────────────────┘  │  │
│  └───────────────────────────────────────────────────────────────┘  │
│                                    │                                │
│  ┌───────────────────────────────────────────────────────────────┐  │
│  │                    PixiJS Infinite Map                        │  │
│  │                                                               │  │
│  │   ┌─────────┐  ┌─────────┐  ┌─────────┐  ┌─────────┐         │  │
│  │   │  GIMP   │  │ LibreOff│  │Terminal │  │ Firefox │  ...    │  │
│  │   │  Tile   │  │  Tile   │  │  Tile   │  │  Tile   │         │  │
│  │   │ @100,200│  │@500,200 │  │@900,200 │  │@100,500 │         │  │
│  │   └─────────┘  └─────────┘  └─────────┘  └─────────┘         │  │
│  │                                                               │  │
│  │   WebMCP Tools: navigate_map, linux_*, a2a_*, builder_*      │  │
│  └───────────────────────────────────────────────────────────────┘  │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

---

## 3. Core Components

### 3.1 AI-GUI Orchestrator

The central brain that coordinates all AI-GUI interaction.

**Location:** `systems/ai_gui/orchestrator.py`

| Subcomponent | File | Responsibility |
|-------------|------|----------------|
| **Goal Parser** | `goal_parser.py` | Parse high-level goals into executable steps |
| **Workflow Engine** | `workflow_engine.py` | Execute multi-step app workflows with verification |
| **Tile App Manager** | `tile_app_manager.py` | Spawn apps as tiles, route commands, maintain registry |

**API:**
```python
class AIGUIOrchestrator:
    async def execute_goal(self, goal: str, context: dict) -> Result
    async def launch_app(self, app_name: str, backend: str, location: tuple) -> Tile
    async def get_app_state(self, tile_id: str) -> AppState
    async def coordinate_workflow(self, steps: list[Step]) -> Result
```

### 3.2 Toolkit Specialists

Per-toolkit experts that handle semantic access and modification.

**Location:** `systems/ai_gui/specialists/`

| Specialist | File | Knows About | Primary Methods |
|-----------|------|-------------|-----------------|
| **GTK Specialist** | `gtk_specialist.py` | GTK widget tree, common shortcuts | AT-SPI, GTK plugin API |
| **Qt Specialist** | `qt_specialist.py` | Qt accessibility, signals/slots | AT-SPI, Qt DBus |
| **Electron Specialist** | `electron_specialist.py` | Chromium DevTools, web context | CDP, Chrome extensions |

**Specialist Interface:**
```python
class BaseSpecialist(ABC):
    @abstractmethod
    async def discover_capabilities(self, app_handle) -> Capabilities

    @abstractmethod
    async def get_widget_tree(self, app_handle) -> WidgetTree

    @abstractmethod
    async def get_shortcuts(self, app_handle) -> list[Shortcut]

    @abstractmethod
    async def find_widget(self, app_handle, query: WidgetQuery) -> Widget

    @abstractmethod
    async def inject_shortcut(self, app_handle, shortcut: Shortcut) -> bool

    @abstractmethod
    async def install_plugin(self, app_handle, plugin: Plugin) -> bool
```

**Discovery Cascade (each specialist):**
1. Check for pre-built app schema
2. Traverse AT-SPI accessibility tree
3. Parse menus and documentation
4. Safe exploration mode for unknown widgets

**Modification Cascade (each specialist):**
1. Use native plugin/extension API (preferred)
2. Inject via accessibility overlay (default)
3. Apply source patches (last resort)

### 3.3 Hybrid Tile Backends

Multiple rendering strategies chosen automatically by Tile App Manager.

**Location:** `systems/ai_gui/backends/`

| Backend | File | Best For | Trade-off |
|---------|------|----------|-----------|
| **VNC Streaming** | `vnc_backend.py` | Complex legacy apps (GIMP, LibreOffice) | Universal but ~50ms latency |
| **WASM Compiled** | `wasm_backend.py` | Portable apps, Qt for WASM | Fast (~5ms) but limited availability |
| **Native Integration** | `native_backend.py` | Terminals, simple UIs | Best perf (<1ms) but custom work |

**Backend Interface:**
```python
class BaseBackend(ABC):
    @abstractmethod
    async def spawn(self, app_config: AppConfig) -> Tile

    @abstractmethod
    async def send_input(self, tile_id: str, input: Input) -> bool

    @abstractmethod
    async def capture_frame(self, tile_id: str) -> bytes

    @abstractmethod
    async def terminate(self, tile_id: str) -> bool
```

**Backend Selection Logic:**
```python
def select_backend(app: str, requirements: dict) -> str:
    # Prefer native for terminals
    if app in TERMINAL_APPS:
        return "native"

    # Use WASM if available
    if has_wasm_build(app):
        return "wasm"

    # Default to VNC for universal compatibility
    return "vnc"
```

### 3.4 Shortcut Registry

Central database of keyboard shortcuts, both built-in and AI-added.

**Location:** `systems/ai_gui/shortcuts/registry.py`

**Schema:**
```python
@dataclass
class Shortcut:
    id: str
    app: str
    keys: str              # "Ctrl+Shift+S"
    action: str            # "Save As"
    category: str          # "file", "edit", "ai-added"
    source: str            # "built-in", "plugin", "overlay"

@dataclass
class AIShortcut(Shortcut):
    # AI-specific shortcuts follow a convention
    category: str = "ai-added"
    returns: str           # What the shortcut returns (JSON description)
    safe_in_sandbox: bool  # Can be called in exploration mode
```

**AI-Added Shortcut Convention:**
```
Ctrl+Alt+Shift+?  →  "Describe current state" (structured JSON dump)
Ctrl+Alt+Shift+D  →  "Dump document structure" (semantic tree)
Ctrl+Alt+Shift+H  →  "Highlight interactive elements" (visual overlay)
Ctrl+Alt+Shift+S  →  "Suggested next actions" (AI recommendations)
```

---

## 4. WebMCP Tool Extensions

New tools to expose AI-GUI capabilities through the WebMCP bridge.

**Location:** `systems/visual_shell/web/ai_gui_bridge.js`

### 4.1 App Tile Management

```javascript
// Launch an app as a tile on the map
gui_app_launch({
    app: "gimp",           // App identifier
    backend: "vnc",        // "vnc" | "wasm" | "native" | "auto"
    location: {x: 1000, y: 2000},  // Optional: map coordinates
    config: {}             // App-specific config
}) → {tile_id, location, backend}

// List all app tiles
gui_app_list() → [{
    tile_id, app, backend,
    location: {x, y},
    state: "running" | "idle" | "error",
    focused: boolean
}]

// Focus a specific tile (brings to front, routes input)
gui_app_focus({tile_id}) → {success, previous_focus}

// Close an app tile
gui_app_close({tile_id, force: false}) → {success}
```

### 4.2 Unified App Interaction

```javascript
// Send keyboard input to a tile
gui_send_keys({
    tile_id,
    keys: "Ctrl+S",        // Can be shortcut or text
    delay_ms: 0            // Optional delay between keys
}) → {success}

// Send text to a tile (types character by character)
gui_send_text({
    tile_id,
    text: "Hello World",
    delay_ms: 50           // Delay between characters
}) → {success, characters_sent}

// Click at coordinates within a tile
gui_click({
    tile_id,
    x: 100, y: 200,        // Coordinates within tile
    button: "left",        // "left" | "right" | "middle"
    double: false          // Double-click
}) → {success}

// Capture screenshot of a tile
gui_screenshot({
    tile_id,
    format: "base64"       // "base64" | "blob"
}) → {image_data, width, height, timestamp}
```

### 4.3 Semantic Access

```javascript
// Get the widget tree from a tile (via AT-SPI)
gui_get_widget_tree({
    tile_id,
    depth: 5               // Max tree depth
}) → {
    root: WidgetNode,
    timestamp
}

// Find widgets matching a query
gui_find_widget({
    tile_id,
    role: "button",        // Widget role
    label: "Save",         // Label text (fuzzy match)
    state: "enabled"       // Widget state filter
}) → [Widget]

// Get all known shortcuts for an app
gui_get_shortcuts({
    tile_id,
    category: "all"        // "all" | "built-in" | "ai-added"
}) → [{
    keys, action, category, description
}]
```

### 4.4 Discovery

```javascript
// Discover all capabilities of an app
gui_discover_capabilities({
    tile_id,
    deep: false            // Deep exploration (slower)
}) → {
    app_name,
    toolkit: "gtk" | "qt" | "electron",
    capabilities: {
        shortcuts: [...],
        widgets: [...],
        custom_actions: [...]
    },
    schema_available: boolean,
    exploration_confidence: number
}
```

---

## 5. Key Workflows

### 5.1 Launch App as Tile

```
User/AI Request: "Open LibreOffice Calc"
         │
         ▼
┌─────────────────────────────────────────────┐
│           AI-GUI Orchestrator               │
│                                             │
│  1. Parse request → app="libreoffice-calc"  │
│  2. Check registry → not running            │
│  3. Select backend → VNC (complex app)      │
│  4. Assign location → (1000, 2000)          │
│  5. Spawn via VNC backend                   │
│  6. Create PixiJS tile                      │
│  7. Register in tile registry               │
│                                             │
└─────────────────────────────────────────────┘
         │
         ▼
WebMCP: navigate_map(1000, 2000)
AI/user sees app on map
```

### 5.2 AI Operates App

```
AI Goal: "Create a spreadsheet with monthly sales data"
         │
         ▼
┌─────────────────────────────────────────────┐
│           AI-GUI Orchestrator               │
│                                             │
│  Goal Parser:                               │
│  → Step 1: Launch Calc                      │
│  → Step 2: Create new spreadsheet           │
│  → Step 3: Enter header row                 │
│  → Step 4: Enter data                       │
│  → Step 5: Format and save                  │
│                                             │
└─────────────────────────────────────────────┘
         │
         ▼
┌─────────────────────────────────────────────┐
│           Workflow Engine                   │
│                                             │
│  Step 1: gui_app_launch("calc") → tile_id   │
│                                             │
│  Step 2: gui_send_keys(tile_id, "Ctrl+N")   │
│          gui_screenshot(tile_id) → verify   │
│                                             │
│  Step 3: gui_send_text(tile_id, "Month")    │
│          gui_send_keys(tile_id, "Tab")      │
│          gui_send_text(tile_id, "Sales")    │
│          gui_screenshot(tile_id) → verify   │
│                                             │
│  Step 4: [similar for data entry]           │
│                                             │
│  Step 5: gui_send_keys(tile_id, "Ctrl+S")   │
│          [dialog handling via semantic]     │
│          gui_send_text(tile_id, "sales")    │
│          gui_send_keys(tile_id, "Enter")    │
│                                             │
└─────────────────────────────────────────────┘
         │
         ▼
Result: {success: true, file: "sales.ods"}
```

### 5.3 Multi-App Orchestration

```
AI Goal: "Copy the chart from Calc to GIMP and apply blur"
         │
         ▼
┌─────────────────────────────────────────────┐
│           AI-GUI Orchestrator               │
│                                             │
│  Recognizes: Cross-app workflow             │
│  Plan:                                      │
│  → Focus Calc tile                          │
│  → Select and copy chart                    │
│  → Focus GIMP tile                          │
│  → Paste and apply filter                   │
│                                             │
└─────────────────────────────────────────────┘
         │
         ▼
┌─────────────────────────────────────────────┐
│           Execution                         │
│                                             │
│  1. gui_app_focus(calc_tile_id)             │
│  2. gui_send_keys(calc_tile_id, "Ctrl+A")   │
│     (select chart - via semantic query)     │
│  3. gui_send_keys(calc_tile_id, "Ctrl+C")   │
│                                             │
│  4. gui_app_focus(gimp_tile_id)             │
│  5. gui_send_keys(gimp_tile_id, "Ctrl+V")   │
│  6. gui_send_keys(gimp_tile_id,             │
│     "Filters>Blur>Gaussian Blur...")        │
│     (or via menu navigation)                │
│                                             │
│  7. gui_screenshot(gimp_tile_id) → verify   │
│                                             │
└─────────────────────────────────────────────┘
```

### 5.4 Discovery of Unknown App

```
AI Goal: "Use Inkscape to create an SVG"
         │
         ▼
┌─────────────────────────────────────────────┐
│         GTK Specialist                      │
│                                             │
│  Discovery Cascade:                         │
│                                             │
│  1. Check schema registry → not found       │
│                                             │
│  2. Traverse AT-SPI tree:                   │
│     - Found menu bar with File, Edit, etc.  │
│     - Found toolbox with 25 tools           │
│     - Found canvas widget                   │
│                                             │
│  3. Parse menus for shortcuts:              │
│     - File>New: Ctrl+N                      │
│     - Edit>Undo: Ctrl+Z                     │
│     - Object>Fill: Ctrl+Shift+F             │
│     - ...47 more shortcuts found            │
│                                             │
│  4. Visual inference (optional):            │
│     - Screenshot + vision model             │
│     - Identify unlabeled toolbar icons      │
│                                             │
│  Result: Capability report with 95% conf    │
│                                             │
└─────────────────────────────────────────────┘
```

---

## 6. Integration with Existing Systems

### 6.1 WebMCP Bridge Integration

The new AI-GUI tools integrate with the existing WebMCP bridge at `systems/visual_shell/web/webmcp_bridge.js`:

```javascript
// In webmcp_bridge.js, register new tools
import { AIGUIBridge } from './ai_gui_bridge.js';

class WebMCPBridge {
    constructor() {
        // ... existing tools ...

        // Add AI-GUI tools
        this.aiGuiBridge = new AIGUIBridge(this);
        this.registerToolCategory('ai_gui', this.aiGuiBridge.getTools());
    }
}
```

### 6.2 Agent Control Surface Integration

The AI-GUI Orchestrator registers with the existing Agent Control Surface:

```python
# In agent_control_surface.py
class AgentControlSurface:
    def __init__(self):
        self.ai_gui = AIGUIOrchestrator()

    def get_available_tools(self):
        return {
            'ai_gui': {
                'launch_app': self.ai_gui.launch_app,
                'execute_goal': self.ai_gui.execute_goal,
                # ... etc
            }
        }
```

### 6.3 Multi-Agent Coordination

Internal agents (Architect, Coder, Oracle, Guardian) can use AI-GUI tools:

```python
# In area_agent.py
class AreaAgent:
    async def use_gui_app(self, app: str, goal: str):
        tile = await self.ai_gui.launch_app(app)
        result = await self.ai_gui.execute_goal(goal, tile)
        return result
```

---

## 7. File Structure

```
geometry_os/
├── systems/
│   └── ai_gui/
│       ├── __init__.py
│       ├── orchestrator.py           # AI-GUI Orchestrator daemon
│       ├── tile_app_manager.py       # Tile lifecycle management
│       ├── goal_parser.py            # Goal → steps conversion
│       ├── workflow_engine.py        # Multi-step execution
│       │
│       ├── specialists/
│       │   ├── __init__.py
│       │   ├── base.py               # Specialist interface
│       │   ├── gtk_specialist.py     # GTK/AT-SPI integration
│       │   ├── qt_specialist.py      # Qt accessibility
│       │   └── electron_specialist.py # Electron/CDP
│       │
│       ├── backends/
│       │   ├── __init__.py
│       │   ├── base.py               # Backend interface
│       │   ├── vnc_backend.py        # VNC streaming
│       │   ├── wasm_backend.py       # WASM execution
│       │   └── native_backend.py     # Native integration
│       │
│       └── shortcuts/
│           ├── __init__.py
│           ├── registry.py           # Shortcut database
│           └── injector.py           # Shortcut injection
│
├── systems/visual_shell/web/
│   ├── ai_gui_bridge.js              # WebMCP tool extensions
│   └── webmcp_bridge.js              # (modified to include ai_gui)
│
├── data/
│   └── ai_gui/
│       ├── schemas/                  # Pre-built app schemas
│       │   ├── gimp.json
│       │   ├── libreoffice.json
│       │   └── inkscape.json
│       └── registry.json             # Tile instance registry
│
└── docs/plans/
    └── 2026-02-15-ai-gui-control-surface-design.md  # This document
```

---

## 8. Security Considerations

### 8.1 Sandboxing

- VNC apps run in isolated QEMU containers
- WASM apps run in browser sandbox
- Native apps run with restricted permissions

### 8.2 Input Validation

- All keyboard input sanitized before injection
- No raw shell command execution
- Rate limiting on automation actions

### 8.3 Access Control

- AI actions require appropriate permissions
- Human approval for destructive operations
- Audit logging of all AI-GUI actions

---

## 9. Performance Targets

| Metric | Target |
|--------|--------|
| App launch time | < 2s (VNC), < 500ms (WASM), < 100ms (native) |
| Input latency | < 50ms (VNC), < 10ms (WASM), < 5ms (native) |
| Screenshot capture | < 100ms |
| Widget tree query | < 200ms |
| Discovery (full) | < 5s |

---

## 10. Future Extensions

1. **Web App Specialist** - Control web apps via DevTools Protocol
2. **Game UI Specialist** - Handle game-specific UI patterns
3. **Voice Integration** - Voice commands for GUI control
4. **Learning Mode** - AI learns from human GUI usage patterns
5. **Collaboration Mode** - Multiple agents collaborate on same app

---

## Appendix A: AT-SPI Integration Details

```python
# Example GTK Specialist AT-SPI usage
import pyatspi

class GTKSpecialist(BaseSpecialist):
    def get_widget_tree(self, app_handle):
        desktop = pyatspi.Registry.getDesktop(0)
        for app in desktop:
            if app.name == app_handle.app_name:
                return self._traverse_accessible(app)

    def _traverse_accessible(self, acc, depth=0):
        node = WidgetNode(
            role=acc.getRoleName(),
            name=acc.name,
            states=[s for s in acc.getState().getStates()],
            children=[]
        )
        for i in range(acc.childCount):
            node.children.append(
                self._traverse_accessible(acc.getChildAtIndex(i), depth+1)
            )
        return node
```

## Appendix B: VNC Backend Details

```python
# VNC backend spawns QEMU with VNC enabled
class VNCBackend(BaseBackend):
    async def spawn(self, config: AppConfig) -> Tile:
        # 1. Create QEMU command
        cmd = [
            "qemu-system-x86_64",
            "-vnc", f":{self.next_display}",
            "-m", "2G",
            # ... other QEMU options
        ]

        # 2. Start QEMU process
        process = await asyncio.create_subprocess_exec(*cmd)

        # 3. Connect websockify for browser access
        ws_port = self.next_ws_port
        await self.start_websockify(ws_port, vnc_port)

        # 4. Create tile
        tile = Tile(
            id=generate_id(),
            backend="vnc",
            ws_url=f"ws://localhost:{ws_port}",
            process=process
        )

        return tile
```

---

**Document Status:** Approved for implementation
**Next Step:** Create implementation plan via writing-plans skill
