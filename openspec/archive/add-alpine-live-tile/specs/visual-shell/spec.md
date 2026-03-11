# Alpine Linux Live Tile - Technical Specification

## 1. PixelRTS v3 Pixel Mapping for Alpine Boot Logic

### 1.1 Substrate Layout

The Alpine Linux v3 substrate uses a 1024x1024 Hilbert-mapped grid where each pixel represents a 32-bit RGBA-encoded instruction or data value.

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

### 1.2 RGBA Instruction Encoding

Each pixel encodes a CPU instruction in the RGBA channels:

| Channel | Bits | Purpose | Alpine Use |
|---------|------|---------|------------|
| Red | 8 | Opcode | CPU operation |
| Green | 8 | Source 1 | Register index (0-31) or immediate |
| Blue | 8 | Source 2 | Register index (0-31) |
| Alpha | 8 | Dest | Target register (0-31) |

### 1.3 Boot Sequence Pixel Mapping

```
Boot Sector (Hilbert 0-65535):
┌─────────────────────────────────────────────────────────────────┐
│ Pixel 0-15:     Magic number "ALPINE_V3\0" (ASCII)             │
│ Pixel 16-19:    Entry point offset (little-endian u32)         │
│ Pixel 20-23:    Kernel size (little-endian u32)                │
│ Pixel 24-27:    Initramfs offset (little-endian u32)           │
│ Pixel 28-31:    Initramfs size (little-endian u32)             │
│ Pixel 32+:      Boot loader code (v3 opcodes)                  │
└─────────────────────────────────────────────────────────────────┘

Kernel Entry (Hilbert 65536-131071):
┌─────────────────────────────────────────────────────────────────┐
│ Pixel 0:        LDI r0, 0x01    # Initialize console           │
│ Pixel 1:        LDI r1, 0x00    # Cursor X = 0                 │
│ Pixel 2:        LDI r2, 0x00    # Cursor Y = 0                 │
│ Pixel 3:        CURSOR r1, r2   # Set cursor position          │
│ Pixel 4+:       Shell init code                                │
└─────────────────────────────────────────────────────────────────┘
```

### 1.4 Hilbert Coordinate Calculation

```python
def hilbert_d2xy(n, d):
    """Convert Hilbert index d to (x, y) coordinates in n×n grid."""
    x = y = 0
    s = 1
    while s < n:
        rx = 1 & (d // 2)
        ry = 1 & (d ^ rx)
        x, y = hilbert_rot(s, x, y, rx, ry)
        x += s * rx
        y += s * ry
        d //= 4
        s *= 2
    return x, y

def hilbert_rot(n, x, y, rx, ry):
    """Rotate/flip quadrant appropriately."""
    if ry == 0:
        if rx == 1:
            x = n - 1 - x
            y = n - 1 - y
        return y, x
    return x, y
```

---

## 2. Memory-Mapped Terminal I/O Structure

### 2.1 Register Map

The Terminal I/O region (Hilbert 131072-196607) uses memory-mapped registers:

```
Offset    │ Purpose           │ R/W │ Format              │ Default
──────────┼───────────────────┼─────┼─────────────────────┼─────────
0x0000    │ Keyboard buffer   │ R   │ ASCII char (0-127)  │ 0x00
0x0001    │ Keyboard ready    │ R   │ 0x01=key waiting    │ 0x00
0x0002    │ Framebuffer X     │ R/W │ Cursor X (0-79)     │ 0x00
0x0003    │ Framebuffer Y     │ R/W │ Cursor Y (0-23)     │ 0x00
0x0004    │ Console char out  │ W   │ ASCII to display    │ -
0x0005    │ Console flush     │ W   │ 0x01=flush line     │ -
0x0006    │ Console color FG  │ R/W │ ANSI color (0-15)   │ 0x07 (white)
0x0007    │ Console color BG  │ R/W │ ANSI color (0-15)   │ 0x00 (black)
0x0008    │ Scroll offset     │ R/W │ Lines scrolled      │ 0x00
0x0009    │ Terminal width    │ R   │ 80                  │ 0x50
0x000A    │ Terminal height   │ R   │ 24                  │ 0x18
0x0010+   │ Framebuffer data  │ R/W │ 80×24 char grid     │ spaces
```

### 2.2 Framebuffer Layout

The 80×24 character grid is stored linearly starting at offset 0x0010:

```
Offset 0x0010: Row 0, Col 0 (top-left)
Offset 0x0011: Row 0, Col 1
...
Offset 0x005F: Row 0, Col 79
Offset 0x0060: Row 1, Col 0
...
Offset 0x08CF: Row 23, Col 79 (bottom-right)
```

Total framebuffer size: 1920 bytes (80 × 24)

### 2.3 Terminal Opcode Details

#### PRINT (0x40)
```
RGBA: R=0x40, G=char, B=0, A=0
Effect: Output character at cursor position, advance cursor
```

#### SCAN (0x41)
```
RGBA: R=0x41, G=dest_reg, B=0, A=0
Effect: Read keyboard buffer into dest_reg, clear ready flag
        If no key waiting, dest_reg = 0
```

#### CURSOR (0x42)
```
RGBA: R=0x42, G=X, B=Y, A=0
Effect: Set cursor position to (X, Y)
        X clamped to 0-79, Y clamped to 0-23
```

#### CLEAR (0x43)
```
RGBA: R=0x43, G=0, B=0, A=0
Effect: Fill framebuffer with spaces, reset cursor to (0,0)
```

#### SCROLL (0x44)
```
RGBA: R=0x44, G=lines, B=0, A=0
Effect: Scroll screen up by 'lines' rows
        New rows filled with spaces
```

### 2.4 ANSI Color Palette

```
0: Black       8: Bright Black (Dark Gray)
1: Red         9: Bright Red
2: Green       10: Bright Green
3: Yellow      11: Bright Yellow
4: Blue        12: Bright Blue
5: Magenta     13: Bright Magenta
6: Cyan        14: Bright Cyan
7: White       15: Bright White
```

---

## 3. LiveTileService Integration Points

### 3.1 Extended LiveTileInstance Dataclass

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
    terminal_grid: List[List[str]] = field(default_factory=lambda: [[' '] * 80 for _ in range(24)])
    cursor_x: int = 0
    cursor_y: int = 0
    focus_state: str = "idle"  # idle, focused, typing, background
    input_pixel_map: Dict[str, Tuple[int, int]] = field(default_factory=dict)
    last_input_time: float = 0.0
    color_fg: int = 7  # ANSI white
    color_bg: int = 0  # ANSI black
```

### 3.2 LiveTileService New Methods

```python
class LiveTileService:
    async def start_alpine_v3(self, tile_id: str) -> LiveTileInstance:
        """Start an Alpine Linux v3 format tile."""
        tile = LiveTileInstance(
            tile_id=tile_id,
            rts_path="alpine_v3.rts.png",
            status="booting",
            v3_format=True
        )
        # Initialize terminal grid
        tile.terminal_grid = [[' '] * 80 for _ in range(24)]
        # Load v3 substrate and begin execution
        await self._execute_v3_boot(tile)
        return tile

    async def send_alpine_input(self, tile_id: str, input: str, source: str) -> None:
        """Send input to Alpine tile's keyboard buffer."""
        tile = self._tiles[tile_id]
        for char in input:
            # Map to keyboard buffer pixel
            offset = 0x0000  # Keyboard buffer offset
            pixel_coord = self._map_io_to_pixel(tile, offset)
            # Write character to memory
            await self._write_pixel(tile, pixel_coord, ord(char))
            # Set ready flag
            ready_coord = self._map_io_to_pixel(tile, 0x0001)
            await self._write_pixel(tile, ready_coord, 0x01)
            # Trigger SCAN opcode processing
            await self._pulse_v3_clock(tile)

    async def get_terminal_grid(self, tile_id: str) -> List[List[str]]:
        """Read current terminal grid from v3 memory."""
        tile = self._tiles[tile_id]
        if not tile.v3_format:
            raise ValueError("Not a v3 format tile")
        # Read framebuffer from Hilbert-mapped memory
        fb_start = 0x0010  # Framebuffer offset
        for row in range(24):
            for col in range(80):
                offset = fb_start + (row * 80) + col
                pixel_coord = self._map_io_to_pixel(tile, offset)
                char_val = await self._read_pixel(tile, pixel_coord)
                tile.terminal_grid[row][col] = chr(char_val) if 32 <= char_val < 127 else ' '
        return tile.terminal_grid

    async def set_tile_focus(self, tile_id: str, focused: bool) -> None:
        """Update tile focus state and adjust FPS."""
        tile = self._tiles[tile_id]
        tile.focus_state = "focused" if focused else "idle"
        tile.last_input_time = time.time()
```

### 3.3 Adaptive Screenshot Loop

```python
async def _adaptive_screenshot_loop(self, tile: LiveTileInstance) -> None:
    """Capture and broadcast terminal grid at adaptive FPS."""
    while tile.status == "running":
        # Calculate target FPS based on state
        fps = self._calculate_target_fps(tile)
        await asyncio.sleep(1.0 / fps)

        # Capture terminal grid from v3 memory
        if tile.v3_format:
            grid = await self.get_terminal_grid(tile.tile_id)
            cursor = (tile.cursor_x, tile.cursor_y)

            # Broadcast to WebSocket clients
            await self._broadcast_output(tile, grid, cursor)
        else:
            # Legacy screenshot for non-v3 tiles
            await self._capture_screenshot(tile)

def _calculate_target_fps(self, tile: LiveTileInstance) -> float:
    """Determine capture FPS based on tile state."""
    if tile.focus_state == "background":
        return 0.5  # 1 frame every 2 seconds
    elif tile.focus_state == "focused":
        return 15.0
    elif tile.focus_state == "typing":
        return 10.0
    else:  # idle
        # Check if recently interacted
        if time.time() - tile.last_input_time < 5.0:
            return 5.0
        return 1.0
```

### 3.4 WebSocket Message Types

#### alpine_input (Client → Server)
```json
{
  "type": "alpine_input",
  "tile_id": "alpine-001",
  "input": "ls -la\n",
  "source": "human"
}
```

#### alpine_output (Server → Client)
```json
{
  "type": "alpine_output",
  "tile_id": "alpine-001",
  "terminal_grid": [[" ", " ", ...], ...],
  "cursor": {"x": 5, "y": 10},
  "timestamp": 1739980800
}
```

#### alpine_focus (Client → Server)
```json
{
  "type": "alpine_focus",
  "tile_id": "alpine-001",
  "focused": true
}
```

#### alpine_stats (Server → Client)
```json
{
  "type": "alpine_stats",
  "tile_id": "alpine-001",
  "cpu": 12.5,
  "memory": 45.2,
  "uptime": 3600,
  "focus_state": "focused",
  "fps": 15.0
}
```

---

## 4. Frontend Integration

### 4.1 LiveTile.js Terminal Renderer

```javascript
class LiveTile {
    renderTerminal(container) {
        // Create terminal canvas
        this.terminalCanvas = document.createElement('canvas');
        this.terminalCanvas.width = 80 * 10;  // 10px per char
        this.terminalCanvas.height = 24 * 18; // 18px per line
        this.ctx = this.terminalCanvas.getContext('2d');

        // Apply terminal styling
        this.ctx.font = '14px monospace';
        this.ctx.fillStyle = '#000000';  // Black background
        this.ctx.fillRect(0, 0, this.terminalCanvas.width, this.terminalCanvas.height);

        container.appendChild(this.terminalCanvas);
    }

    updateTerminalGrid(grid, cursor) {
        this.ctx.fillStyle = '#000000';
        this.ctx.fillRect(0, 0, this.terminalCanvas.width, this.terminalCanvas.height);

        // Render characters
        this.ctx.fillStyle = '#00ff00';  // Green text
        for (let y = 0; y < 24; y++) {
            for (let x = 0; x < 80; x++) {
                const char = grid[y][x];
                this.ctx.fillText(char, x * 10, (y + 1) * 18);
            }
        }

        // Render cursor
        this.ctx.fillStyle = '#00ff00';
        this.ctx.fillRect(cursor.x * 10, cursor.y * 18 + 2, 10, 16);
    }

    setupInputHandler() {
        this.terminalCanvas.addEventListener('keydown', (e) => {
            if (this.focused) {
                e.preventDefault();
                const key = e.key === 'Enter' ? '\n' : e.key;
                this.sendInput(key);
            }
        });

        this.terminalCanvas.addEventListener('click', () => {
            this.terminalCanvas.focus();
            this.setFocused(true);
        });
    }
}
```

---

## 5. Neural Memory Event Types

### 5.1 Event Definitions

```python
class EventType(Enum):
    # Alpine-specific events
    ALPINE_COMMAND = "alpine_command"    # Command executed
    ALPINE_OUTPUT = "alpine_output"      # Output line produced
    ALPINE_ERROR = "alpine_error"        # Error occurred

def capture_alpine_event(tile_id: str, event_type: str, data: dict):
    event = NeuralEvent(
        event_type=EventType(event_type),
        source="alpine_live_tile",
        location=get_tile_hilbert_coords(tile_id),
        data={
            "tile_id": tile_id,
            "command": data.get("command"),
            "output": data.get("output"),
            "exit_code": data.get("exit_code"),
            "timestamp": time.time()
        }
    )
    neural_memory_hub.capture(event)
```

---

## 6. WordPress Semantic Publishing Integration

The Alpine Live Tile integrates with the WordPress Semantic District for long-term memory persistence and human-readable system mirrors.

### 6.1 Integration Architecture

```
┌─────────────────────────────────────────────────────────────────────────┐
│                ALPINE → WORDPRESS MEMORY PIPELINE                       │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│   Alpine Terminal                                                       │
│        │                                                                │
│        ▼                                                                │
│   capture_alpine_event() ──► NeuralMemoryHub (short-term)              │
│        │                                                                │
│        ├──────────────────────────────────────────────┐                 │
│        ▼                                              ▼                 │
│   Visual Bridge (8768)                      publish_to_wordpress()      │
│   "evolution_event" pulse                   "Alpine Session Log"        │
│        │                                              │                 │
│        ▼                                              ▼                 │
│   Infinite Map Pulse                  WordPress District (localhost)    │
│   (WordPress tile glows)              Human-readable archive            │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

### 6.2 Event-to-WordPress Bridge

```python
# systems/evolution_daemon/alpine_wordpress_bridge.py

from wordpress_zone.publish_to_wp import publish_to_wordpress
import time

class AlpineWordPressBridge:
    """Bridge Alpine terminal events to WordPress Semantic District."""

    # Rate limiting: max 1 post per 30 seconds
    MIN_PUBLISH_INTERVAL = 30
    last_publish_time = 0

    # Significant command patterns that trigger journaling
    SIGNIFICANT_PATTERNS = [
        r'^git\s+(commit|push|merge)',     # Version control
        r'^cargo\s+(build|test)',          # Build events
        r'^python.*test',                   # Test runs
        r'^echo.*>>',                       # File writes
        r'^cat\s+',                         # File reads
        r'^\./.*\.sh',                      # Script execution
        r'^make\s+',                        # Build commands
    ]

    def should_publish(self, command: str, exit_code: int) -> bool:
        """Determine if command is significant enough for WordPress."""
        import re
        # Always publish errors
        if exit_code != 0:
            return True
        # Check patterns
        for pattern in self.SIGNIFICANT_PATTERNS:
            if re.match(pattern, command.strip()):
                return True
        return False

    def publish_session_log(self, tile_id: str, command: str, output: str, exit_code: int):
        """Publish significant Alpine events to WordPress."""
        # Rate limiting
        now = time.time()
        if now - self.last_publish_time < self.MIN_PUBLISH_INTERVAL:
            return
        self.last_publish_time = now

        # Format content with semantic HTML
        status = "✅ Success" if exit_code == 0 else f"❌ Exit {exit_code}"
        content = f"""
        <h3>Alpine Terminal Session</h3>
        <p><b>Tile:</b> <code>{tile_id}</code></p>
        <p><b>Status:</b> {status}</p>
        <h4>Command</h4>
        <pre><code>{command}</code></pre>
        <h4>Output</h4>
        <pre>{output[:2000]}{'...' if len(output) > 2000 else ''}</pre>
        <p><i>Timestamp: {time.strftime('%Y-%m-%d %H:%M:%S')}</i></p>
        """

        publish_to_wordpress(
            title=f"Alpine: {command[:50]}{'...' if len(command) > 50 else ''}",
            content=content,
            post_type="post"
        )

        # Pulse Visual Bridge for map visualization
        self._pulse_wordpress_district(tile_id)

    def _pulse_wordpress_district(self, tile_id: str):
        """Send telemetry pulse to Visual Bridge."""
        import websockets
        import asyncio

        async def send_pulse():
            async with websockets.connect('ws://localhost:8768') as ws:
                await ws.send(json.dumps({
                    "type": "evolution_event",
                    "source": "alpine_wordpress_bridge",
                    "tile_id": tile_id,
                    "district": "wordpress_zone",
                    "action": "session_logged"
                }))

        asyncio.run(send_pulse())
```

### 6.3 LiveTileService WordPress Integration

```python
# Extension to LiveTileService

class LiveTileService:
    def __init__(self):
        # ... existing init ...
        self.wp_bridge = AlpineWordPressBridge()

    async def send_alpine_input(self, tile_id: str, input: str, source: str) -> None:
        """Send input and track for WordPress publishing."""
        tile = self._tiles[tile_id]

        # Store command for output correlation
        if input.endswith('\n'):
            tile._pending_command = input.strip()

        # ... existing input handling ...

    async def _on_alpine_output(self, tile_id: str, output: str, exit_code: int):
        """Handle output completion with WordPress publishing."""
        tile = self._tiles[tile_id]
        command = getattr(tile, '_pending_command', '')

        if command and self.wp_bridge.should_publish(command, exit_code):
            self.wp_bridge.publish_session_log(
                tile_id=tile_id,
                command=command,
                output=output,
                exit_code=exit_code
            )
```

### 6.4 Semantic Search Integration

Alpine commands published to WordPress are indexed by the Memory Beam system:

```python
# Query past Alpine sessions via SynapticQueryEngine
from systems.evolution_daemon.synaptic_query import SynapticQueryEngine

engine = SynapticQueryEngine()

# Find all git commits from Alpine
results = engine.query("""
    SELECT title, content, timestamp
    FROM wordpress_posts
    WHERE source = 'alpine_wordpress_bridge'
    AND content LIKE '%git commit%'
    ORDER BY timestamp DESC
    LIMIT 10
""")

# Or browse visually at http://localhost:8080
```

### 6.5 Constraints

| Constraint | Value | Reason |
|------------|-------|--------|
| Rate Limit | 1 post / 30s | Prevent database bloat |
| Output Truncation | 2000 chars | Post size limits |
| Localhost Only | 127.0.0.1 | Security (ai-publisher.php) |
| Author Attribution | User ID 1 | Geometry OS Administrator |

---

## 7. AlpineV3Builder Kernel Strategy

Per review feedback, the AlpineV3Builder uses a **shim approach** rather than full opcode transpilation:

### 7.1 Shim Architecture

```
┌─────────────────────────────────────────────────────────────────────────┐
│                    ALPINE V3 SHIM BOOT STRATEGY                         │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│   boot.pasm (v3 opcodes):                                               │
│   ┌─────────────────────────────────────────────────────────────────┐   │
│   │ LDI r0, KERNEL_ADDR     # Load kernel blob address              │   │
│   │ LDI r1, KERNEL_SIZE     # Load kernel size                      │   │
│   │ CALL native_exec        # Execute native binary blob            │   │
│   │                                                               │   │
│   │ # native_exec is a v3 opcode that:                            │   │
│   │ # 1. Sets up protected memory region                          │   │
│   │ # 2. Jumps to native entry point                              │   │
│   │ # 3. Bridges I/O to memory-mapped pixels                      │   │
│   └─────────────────────────────────────────────────────────────────┘   │
│                                                                         │
│   Native Kernel (unmodified):                                           │
│   ┌─────────────────────────────────────────────────────────────────┐   │
│   │ Standard Alpine vmlinux + initramfs                            │   │
│   │ Stored as binary blob in Hilbert region (768,0)+               │   │
│   │ Executed via native_exec shim                                  │   │
│   └─────────────────────────────────────────────────────────────────┘   │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

### 7.2 native_exec Opcode (0xF0)

```python
# New v3 opcode for native binary execution
NATIVE_EXEC = 0xF0

class NativeExecutor:
    """Execute native binaries from v3 substrate with I/O bridging."""

    def execute(self, blob_addr: int, blob_size: int, tile: LiveTileInstance):
        """Execute native kernel blob with pixel I/O bridge."""
        # 1. Load binary blob from Hilbert-mapped memory
        kernel_blob = self._read_hilbert_region(tile, blob_addr, blob_size)

        # 2. Set up I/O bridge (native → memory-mapped pixels)
        io_bridge = PixelIOBridge(
            keyboard_addr=0x0000,
            framebuffer_addr=0x0010
        )

        # 3. Execute with QEMU or native CPU
        # The bridge intercepts I/O and routes to pixel memory
        self._execute_native(kernel_blob, io_bridge)
```

### 7.3 Benefits

| Approach | Pros | Cons |
|----------|------|------|
| Full Transpilation | Pure v3, no native deps | Complex, slow build |
| **Shim (chosen)** | Fast, uses standard Alpine | Requires native_exec |
| Hybrid | Best of both | Most complex |

---

## 8. Test Verification Matrix

| Component | Test File | Test Count |
|-----------|-----------|------------|
| AlpineV3Builder | `test_alpine_v3_builder.py` | 8 |
| Terminal Opcodes | `test_terminal_opcodes.py` | 7 |
| InputPixelMapper | `test_input_pixel_mapper.py` | 5 |
| LiveTileInstance v3 | `test_live_tile_v3.py` | 8 |
| Adaptive FPS | `test_adaptive_fps.py` | 4 |
| WebSocket Handlers | `test_alpine_websocket.py` | 5 |
| Terminal Renderer | `test_terminal_renderer.py` | 5 |
| WordPress Bridge | `test_alpine_wordpress_bridge.py` | 6 |
| Native Exec Shim | `test_native_exec.py` | 4 |
| **Total** | | **52** |
