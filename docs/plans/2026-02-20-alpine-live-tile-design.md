# Alpine Linux Live Tile - Design Document

> **Goal**: Integrate Alpine Linux as an interactive terminal tile on the Infinite Map using PixelRTS v3 as the native execution format.

> **Date**: 2026-02-20

> **Status**: Approved

---

## 1. Overview

### 1.1 Purpose

Transform Alpine Linux into a "live tile" on the Infinite Map where:
- The OS substrate is a direct geometric texture (PixelRTS v3)
- Users and AI agents can interact via terminal
- The tile is a functional shell node in the spatial computing environment

### 1.2 Scope

- Convert Alpine ISO to PixelRTS v3 format (`alpine_v3.rts.png`)
- Enable hybrid input (click-to-focus, HUD palette, agent WebSocket)
- Implement adaptive framebuffer updates (1-15 FPS)
- Integrate with existing LiveTileService infrastructure

### 1.3 Out of Scope

- Graphical/desktop mode (terminal only for v1)
- Multi-tile networking
- Persistent storage across sessions

---

## 2. Architecture

### 2.1 System Overview

```
┌─────────────────────────────────────────────────────────────────────────┐
│                    ALPINE LIVE TILE ARCHITECTURE                        │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│   Alpine ISO ──► AlpineV3Builder ──► alpine_v3.rts.png                 │
│                                           │                             │
│                                           ▼                             │
│   ┌─────────────────────────────────────────────────────────────────┐   │
│   │                    PixelRTS v3 Execution                        │   │
│   │  ┌───────────┐    ┌───────────┐    ┌───────────┐              │   │
│   │  │ Boot      │    │ Kernel    │    │ Terminal  │              │   │
│   │  │ Sector    │───►│ Logic     │───►│ I/O       │              │   │
│   │  │ (pixels)  │    │ (pixels)  │    │ (pixels)  │              │   │
│   │  └───────────┘    └───────────┘    └───────────┘              │   │
│   └─────────────────────────────────────────────────────────────────┘   │
│                         │                       ▲                       │
│                         ▼                       │                       │
│   ┌─────────────────────────────────────────────────────────────────┐   │
│   │                    LiveTileService                              │   │
│   │  - Lifecycle management                                         │   │
│   │  - Input routing (hybrid)                                       │   │
│   │  - Adaptive framebuffer capture                                 │   │
│   │  - Neural memory events                                         │   │
│   └─────────────────────────────────────────────────────────────────┘   │
│                         │                       ▲                       │
│                         ▼                       │                       │
│   ┌─────────────────────────────────────────────────────────────────┐   │
│   │                    Frontend (LiveTile.js)                       │   │
│   │  - Char grid renderer (80x24)                                   │   │
│   │  - Keyboard input relay                                         │   │
│   │  - Focus state management                                       │   │
│   └─────────────────────────────────────────────────────────────────┘   │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

### 2.2 Component Relationships

| Component | Depends On | Provides |
|-----------|------------|----------|
| AlpineV3Builder | Alpine ISO, pasm.py | alpine_v3.rts.png |
| LiveTileService | AlpineV3Builder, Visual Bridge | Tile lifecycle |
| LiveTile.js | LiveTileService, WebSocket | User interface |
| InputPixelMapper | Keyboard events | Pixel coordinates |
| NeuralMemoryHub | LiveTileService | Event logging |

---

## 3. PixelRTS v3 Format Specification

### 3.1 Substrate Layout

The `alpine_v3.rts.png` file is a 1024x1024 Hilbert-mapped grid:

```
┌────────────────────────────────────────────────────────────────────────┐
│                    ALPINE V3 SUBSTRATE LAYOUT                          │
│                    (1024x1024 Hilbert-mapped grid)                     │
├────────────────────────────────────────────────────────────────────────┤
│                                                                        │
│   Hilbert Region       │ Content           │ Size                      │
│   ─────────────────────┼───────────────────┼────────────────────────── │
│   (0,0) → (255,255)    │ Boot Sector       │ 64KB                      │
│                        │ (kernel loader)   │                           │
│   ─────────────────────┼───────────────────┼────────────────────────── │
│   (256,0) → (511,255)  │ Kernel Entry      │ 64KB                      │
│                        │ (native v3 ops)   │                           │
│   ─────────────────────┼───────────────────┼────────────────────────── │
│   (512,0) → (767,255)  │ Terminal I/O      │ 64KB                      │
│                        │ (memory-mapped)   │                           │
│   ─────────────────────┼───────────────────┼────────────────────────── │
│   (768,0) → (1023,255) │ Heap/Stack        │ 64KB                      │
│                        │ (runtime data)    │                           │
│                                                                        │
└────────────────────────────────────────────────────────────────────────┘
```

### 3.2 RGBA Instruction Encoding

| Channel | Purpose | Alpine Use |
|---------|---------|------------|
| Red | Opcode | CPU operation (ADD=0x33, SUB=0x34, MOV=0x01, LDI=0x08, HALT=0x07) |
| Green | Source 1 | Register index (0-31) or immediate value |
| Blue | Source 2 | Register index (0-31) |
| Alpha | Dest | Target register (0-31) |

### 3.3 Memory-Mapped Terminal I/O

```
Offset    │ Purpose           │ R/W │ Format
──────────┼───────────────────┼─────┼─────────────────
0x0000    │ Keyboard buffer   │ R   │ ASCII char
0x0001    │ Keyboard ready    │ R   │ 0x01=key waiting
0x0002    │ Framebuffer X     │ R/W │ Cursor X (0-79)
0x0003    │ Framebuffer Y     │ R/W │ Cursor Y (0-23)
0x0004    │ Console char out  │ W   │ ASCII to display
0x0005    │ Console flush     │ W   │ 0x01=flush line
0x0010+   │ Framebuffer data  │ R/W │ 80x24 char grid (1920 bytes)
```

### 3.4 Terminal Opcodes (New for Alpine)

| Opcode | Name | Description |
|--------|------|-------------|
| 0x40 | PRINT | Output char at cursor position |
| 0x41 | SCAN | Read char from keyboard buffer |
| 0x42 | CURSOR | Set cursor position (X, Y) |
| 0x43 | CLEAR | Clear terminal screen |
| 0x44 | SCROLL | Scroll screen up one line |

---

## 4. Input/Output Architecture

### 4.1 Hybrid Input Flow

The system supports three input modes:

| Mode | Source | Use Case |
|------|--------|----------|
| Click-to-Focus | Human | User clicks tile, keyboard input routes there |
| HUD Palette | Human | Command overlay for quick commands |
| Agent WebSocket | AI | Programmatic command execution |

### 4.2 Input Routing

```
Input Event
    │
    ▼
┌─────────────────┐
│ InputPixelMapper │
│ key → (x,y) pixel│
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ WebSocket API   │
│ alpine_input    │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ v3 Memory Map   │
│ Pixel 0x0000    │
└─────────────────┘
```

### 4.3 WebSocket Message Types

**alpine_input** (Client → Server)
```json
{
  "type": "alpine_input",
  "tile_id": "alpine-001",
  "input": "ls -la\n",
  "source": "human" | "agent"
}
```

**alpine_output** (Server → Client)
```json
{
  "type": "alpine_output",
  "tile_id": "alpine-001",
  "terminal_grid": [[char]],
  "cursor": {"x": 5, "y": 10},
  "timestamp": 1234567890
}
```

**alpine_focus** (Client → Server)
```json
{
  "type": "alpine_focus",
  "tile_id": "alpine-001",
  "focused": true
}
```

**alpine_stats** (Server → Client)
```json
{
  "type": "alpine_stats",
  "tile_id": "alpine-001",
  "cpu": 12.5,
  "memory": 45.2,
  "uptime": 3600
}
```

### 4.4 Adaptive Framebuffer

| State | FPS | Trigger |
|-------|-----|---------|
| IDLE | 1 | No input for 5+ seconds |
| FOCUSED | 15 | User clicked on tile |
| TYPING | 10 | Input received in last 500ms |
| BACKGROUND | 0.5 | Tile not visible in viewport |

---

## 5. LiveTileService Integration

### 5.1 Extended LiveTileInstance

```python
@dataclass
class LiveTileInstance:
    # Existing fields
    tile_id: str
    rts_path: str
    status: str  # stopped, booting, running, error
    framebuffer: Optional[str]
    metrics: Dict[str, Any]

    # New fields (v3)
    v3_format: bool = False
    terminal_grid: List[List[str]] = field(default_factory=list)
    focus_state: str = "idle"  # idle, focused, typing, background
    input_pixel_map: Dict[str, Tuple[int, int]] = field(default_factory=dict)
    last_input_time: float = 0.0

    # New methods
    def send_input(self, char: str) -> None: ...
    def get_terminal_grid(self) -> List[List[str]]: ...
    def set_focus(self, state: str) -> None: ...
```

### 5.2 LiveTileService Extensions

```python
class LiveTileService:
    # Existing methods
    async def start_tile(self, tile_id: str, rts_path: str) -> LiveTileInstance: ...
    async def stop_tile(self, tile_id: str) -> None: ...
    async def get_screenshot(self, tile_id: str) -> str: ...

    # New methods (v3)
    async def start_alpine_v3(self, tile_id: str) -> LiveTileInstance: ...
    async def send_alpine_input(self, tile_id: str, input: str, source: str) -> None: ...
    async def get_terminal_grid(self, tile_id: str) -> List[List[str]]: ...
    async def set_tile_focus(self, tile_id: str, focused: bool) -> None: ...

    # Adaptive screenshot loop
    async def _adaptive_screenshot_loop(self, tile: LiveTileInstance) -> None:
        while tile.status == "running":
            fps = self._calculate_target_fps(tile)
            await asyncio.sleep(1.0 / fps)
            await self._capture_terminal_grid(tile)
            await self._broadcast_output(tile)
```

---

## 6. Frontend Implementation

### 6.1 LiveTile.js Extensions

```javascript
class LiveTile {
    constructor(id, rtsPath) {
        // Existing
        this.id = id;
        this.rtsPath = rtsPath;
        this.state = 'stopped';
        this.framebuffer = null;

        // New (v3)
        this.v3Format = false;
        this.terminalGrid = [];  // 80x24 char array
        this.cursorX = 0;
        this.cursorY = 0;
        this.focused = false;
    }

    // Terminal rendering
    renderTerminal(container) {
        // Use monospace font, render 80x24 grid
        // Highlight cursor position
        // Apply terminal color scheme
    }

    // Input handling
    setupInputHandler() {
        container.addEventListener('keydown', (e) => {
            if (this.focused) {
                this.sendInput(e.key);
            }
        });
    }

    // WebSocket input relay
    sendInput(key) {
        ws.send(JSON.stringify({
            type: 'alpine_input',
            tile_id: this.id,
            input: key,
            source: 'human'
        }));
    }
}
```

### 6.2 Char Grid Rendering

- Use HTML5 Canvas or WebGL for crisp text
- Monospace font (14px)
- Terminal color scheme (green on black default)
- Cursor blink animation
- Scroll support for history

---

## 7. Neural Memory Integration

### 7.1 Event Types

```python
class EventType(Enum):
    # Existing
    TILE_BOOT = "tile_boot"
    TILE_ERROR = "tile_error"

    # New (Alpine)
    ALPINE_COMMAND = "alpine_command"    # Command executed
    ALPINE_OUTPUT = "alpine_output"      # Output line produced
    ALPINE_ERROR = "alpine_error"        # Error occurred
```

### 7.2 Event Capture

```python
def capture_alpine_event(tile_id: str, event_type: str, data: dict):
    event = NeuralEvent(
        event_type=EventType(event_type),
        source="alpine_live_tile",
        location=get_tile_hilbert_coords(tile_id),
        data={
            "tile_id": tile_id,
            "command": data.get("command"),
            "output": data.get("output"),
            "timestamp": time.time()
        }
    )
    neural_memory_hub.capture(event)
```

---

## 8. Implementation Tasks

| # | Task | File | Priority |
|---|------|------|----------|
| 1 | AlpineV3Builder | `systems/pixel_compiler/alpine_v3_builder.py` | P0 |
| 2 | Terminal Opcodes | `systems/pixel_compiler/pixelrts_v3/opcodes.py` | P0 |
| 3 | InputPixelMapper | `systems/visual_shell/api/input_pixel_mapper.py` | P0 |
| 4 | Extend LiveTileInstance | `systems/evolution_daemon/live_tile_service.py` | P0 |
| 5 | Adaptive Screenshot Loop | `systems/evolution_daemon/live_tile_service.py` | P1 |
| 6 | WebSocket Handlers | `systems/visual_shell/api/visual_bridge.py` | P1 |
| 7 | LiveTile.js Terminal Mode | `systems/visual_shell/web/js/LiveTile.js` | P1 |
| 8 | Neural Memory Events | `systems/evolution_daemon/neural_event.py` | P2 |

---

## 9. Testing Strategy

### 9.1 Unit Tests

- `test_alpine_v3_builder.py` - ISO conversion
- `test_input_pixel_mapper.py` - Key → pixel mapping
- `test_terminal_opcodes.py` - Opcode execution

### 9.2 Integration Tests

- `test_alpine_boot.py` - Full boot cycle
- `test_alpine_input.py` - Input routing
- `test_adaptive_fps.py` - Frame rate adaptation

### 9.3 E2E Tests

- Human types command → output appears
- Agent sends command via WebSocket → executes
- Focus change → FPS adjusts

---

## 10. Success Criteria

| Criterion | Verification |
|-----------|--------------|
| Alpine boots in v3 format | `alpine_v3.rts.png` loads and executes |
| Terminal displays | 80x24 char grid renders in LiveTile |
| Keyboard input works | Typing in focused tile appears in shell |
| Agent can send commands | WebSocket `alpine_input` executes commands |
| Adaptive FPS works | Idle=1fps, Focused=15fps, Background=0.5fps |
| Neural memory captures | Commands logged to NeuralMemoryHub |

---

## 11. Risks & Mitigations

| Risk | Impact | Mitigation |
|------|--------|------------|
| Alpine kernel too large for v3 grid | High | Use compressed kernel, extend grid |
| Input latency too high | Medium | Optimize WebSocket path, predict typing |
| Terminal rendering slow | Low | Use WebGL, cache character glyphs |

---

## 12. Future Enhancements

- Graphical/desktop mode support
- Multi-tile networking
- Persistent storage
- Copy/paste integration
- Terminal color themes
- Shell history navigation

---

## Appendix A: File Structure

```
systems/
├── pixel_compiler/
│   ├── alpine_v3_builder.py       # NEW
│   ├── pixelrts_v3/
│   │   ├── pasm.py                # EXISTING
│   │   ├── vm.py                  # EXISTING
│   │   ├── opcodes.py             # EXTEND
│   │   └── geometric_programming.wgsl
│   └── boot/
│       └── alpine_v3.rts.png      # GENERATED
│
├── evolution_daemon/
│   ├── live_tile_service.py       # EXTEND
│   └── neural_event.py            # EXTEND
│
├── visual_shell/
│   ├── api/
│   │   ├── visual_bridge.py       # EXTEND
│   │   └── input_pixel_mapper.py  # NEW
│   └── web/js/
│       └── LiveTile.js            # EXTEND
│
└── riscv_gpu/
    └── alpine_v3_kernel/          # NEW
        ├── boot.pasm
        ├── terminal.pasm
        └── shell.pasm
```

---

## Appendix B: References

- `GEOMETRIC_PROGRAMMING.md` - Geometric programming philosophy
- `systems/pixel_compiler/pixelrts_v3/` - PixelRTS v3 implementation
- `systems/evolution_daemon/live_tile_service.py` - Current LiveTileService
- `INFINITE_DESKTOP_RTS_COMPLETE.md` - RTS format details
