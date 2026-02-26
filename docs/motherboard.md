# The Motherboard: Executable Glyph System

## Overview

The Motherboard transforms the Infinite Map from a visual display into executable RAM. By placing Resonance Glyphs on the map, you create spatial programs that execute via WebGPU compute shaders.

**Key Concept**: Every glyph placed on the map is both a visual element AND a CPU core. The map becomes a massively parallel computer.

## Architecture

```
+------------------+     +--------------------+     +------------------+
|   PixiJS Layer   |     | GlyphExecutor      |     | WebGPU Layer     |
|                  |     | (Bridge)           |     |                  |
|  +------------+  |     |  +--------------+  |     |  +------------+  |
|  | InfiniteMap|----->|  | Registry     |----->|  | Compute    |  |
|  |            |  |     |  | (x,y->core) |  |     |  | Shader    |  |
|  +------------+  |     |  +--------------+  |     |  | (WGSL)    |  |
|        |         |     |         |          |     |  +------------+  |
|  +------------+  |     |  +--------------+  |     |        |         |
|  |   Sprites  |<-----|  | CPU States  |<-----|  | System    |  |
|  |  (visual)  |  |     |  | (64 cores)  |  |     |  | Memory    |  |
|  +------------+  |     |  +--------------+  |     |  +------------+  |
+------------------+     +--------------------+     +------------------+
```

### Data Flow

1. **Placement**: User clicks map -> `placeExecutableGlyph(x, y, code)` -> create sprite -> register with executor
2. **Sync**: `execute()` -> `syncCPUIStates()` -> write PC values to GPU buffer
3. **Compute**: Dispatch shader -> decode holographic glyph -> verify symmetry -> execute RISC-V
4. **Readback**: `readResults()` -> copy buffer -> map to read -> update registry
5. **Visual**: `updateVisualFeedback()` -> update sprite alpha/scale/tint

## Quick Start

### 1. Open the Test Page

```bash
cd systems/visual_shell/web
python3 -m http.server 8080
# Open: http://localhost:8080/test_motherboard.html
```

### 2. Place Glyphs

- **Click** anywhere on the map to place the selected glyph
- Use the **Glyph Palette** (bottom-left) or keys **1-6** to select different glyphs

### 3. Execute

- Press **Ctrl+Enter** or click **Execute** button
- Watch glyphs glow as they execute
- Click **Auto Run** for continuous execution at 30 FPS

### 4. Observe Visual Feedback

- **Active glyphs**: Pulsing glow, alpha 0.7-1.0
- **Halted glyphs** (fraud detected): Red tint, dimmed

## API Reference

### GlyphExecutor Class

Core class that bridges PixiJS sprites to WebGPU compute execution.

#### Constructor

```javascript
const executor = new GlyphExecutor({
    maxCores: 64,           // Maximum parallel cores (matches shader workgroup)
    glyphSize: 16,          // Glyph dimensions in pixels
    regsPerCore: 46,        // Registers per CPU core (from WGSL)
    atlasPath: '/assets/universal_font.rts.png'  // Atlas texture path
});
```

#### Methods

##### `async init()`

Initialize WebGPU device and buffers. Must be called after constructor.

```javascript
await executor.init();
```

**Returns**: `this` (for chaining)

---

##### `async loadAtlas(atlasPath)`

Load the glyph atlas texture into GPU memory.

```javascript
await executor.loadAtlas('/assets/universal_font.rts.png');
```

**Parameters**:
- `atlasPath` (string): Path to atlas PNG file

**Returns**: `GPUTexture|null`

---

##### `registerGlyph(x, y, sprite, atlasX, atlasY)`

Register a glyph for execution. Assigns a core ID.

```javascript
const coreId = executor.registerGlyph(10, 20, mySprite, 5, 3);
```

**Parameters**:
- `x` (number): Map X coordinate
- `y` (number): Map Y coordinate
- `sprite` (PIXI.Sprite): Visual sprite reference
- `atlasX` (number): Glyph column in atlas
- `atlasY` (number): Glyph row in atlas

**Returns**: `number` - Assigned core ID (0-63)

---

##### `unregisterGlyph(x, y)`

Remove a glyph from execution.

```javascript
executor.unregisterGlyph(10, 20);
```

**Parameters**:
- `x` (number): Map X coordinate
- `y` (number): Map Y coordinate

---

##### `async execute()`

Execute all registered glyphs. Full cycle: sync -> compute -> read -> update.

```javascript
const result = await executor.execute();
// result = { executed: 5, timestamp: 1234567890, results: [...] }
```

**Returns**: `Promise<object>`
```javascript
{
    executed: number,      // Number of glyphs executed
    timestamp: number,     // Execution timestamp
    results: Array<{       // Per-glyph results
        coreId: number,
        halted: boolean,
        fraud: boolean,
        cycles: number,
        pc: number
    }>
}
```

---

##### `getExecutionState(x, y)`

Get execution state for a specific glyph.

```javascript
const state = executor.getExecutionState(10, 20);
// state = { sprite, atlasX, atlasY, coreId, pc, active, lastResult, executionCount, glowIntensity }
```

**Parameters**:
- `x` (number): Map X coordinate
- `y` (number): Map Y coordinate

**Returns**: `object|null` - GlyphEntry or null if not registered

---

##### `getActiveGlyphs()`

Get all registered glyphs.

```javascript
const glyphs = executor.getActiveGlyphs();
```

**Returns**: `Array<GlyphEntry>`

---

##### `startAutoExecution(fps = 30)`

Start continuous execution at specified frame rate.

```javascript
executor.startAutoExecution(60);  // 60 FPS
```

**Parameters**:
- `fps` (number): Frames per second (default: 30)

---

##### `stopAutoExecution()`

Stop auto-execution mode.

```javascript
executor.stopAutoExecution();
```

---

##### `toggleAutoExecution(fps = 30)`

Toggle auto-execution on/off.

```javascript
const isRunning = executor.toggleAutoExecution(30);
```

**Parameters**:
- `fps` (number): Frames per second when starting

**Returns**: `boolean` - New state (true = running)

---

##### `isAutoExecuting()`

Check if auto-execution is active.

```javascript
if (executor.isAutoExecuting()) {
    console.log('Auto mode is ON');
}
```

**Returns**: `boolean`

### InfiniteMap Additions

The InfiniteMap class is extended with GlyphExecutor integration.

#### Properties

```javascript
map.glyphExecutor     // GlyphExecutor instance (null if unavailable)
map.glyphAtlasLoaded  // Boolean - atlas load status
```

#### Methods

##### `placeExecutableGlyph(mapX, mapY, glyphCode)`

Place a glyph on the map and register it for execution.

```javascript
const sprite = map.placeExecutableGlyph(10, 20, 65);  // 'A' glyph
```

**Parameters**:
- `mapX` (number): Map X coordinate (grid units)
- `mapY` (number): Map Y coordinate (grid units)
- `glyphCode` (number): ASCII code (0-255) or Unicode

**Returns**: `PIXI.Sprite|null`

---

##### `async executeGlyphs()`

Execute all glyphs on this map.

```javascript
const result = await map.executeGlyphs();
```

**Returns**: `Promise<object>` - Same as `GlyphExecutor.execute()`

---

##### `createGlyphSprite(glyphCode, mapX, mapY)`

Create a visual sprite for a glyph (internal use).

```javascript
const sprite = map.createGlyphSprite(65, 10, 20);
```

**Returns**: `PIXI.Sprite|null`

## Visual Feedback

### Active Glyphs

When glyphs execute successfully:

- **Alpha**: 0.7 to 1.0 (based on glow intensity)
- **Scale**: Pulses with sine wave: `1.0 + sin(time/300 + coreId) * 0.1 * glowIntensity`
- **Tint**: White (0xffffff)
- **Glow**: Smooth interpolation: `glowIntensity = glowIntensity * 0.85 + target * 0.15`

### Halted Glyphs (Fraud Detected)

When the symmetry/fraud check fails:

- **Tint**: Red (0xff0000)
- **Alpha**: 0.5 (dimmed)
- **Scale**: 1.0 (no pulse)
- **Active**: Set to false (stops further execution)

### Example: Custom Visual Feedback

```javascript
// After execution, check for fraud
const state = executor.getExecutionState(10, 20);
if (state && state.lastResult && state.lastResult.fraud) {
    console.log('Fraud detected at (10, 20)!');
}
```

## Glyph Entry Structure

Each registered glyph has this state object:

```typescript
interface GlyphEntry {
    sprite: PIXI.Sprite;     // Visual representation
    atlasX: number;          // Column in atlas
    atlasY: number;          // Row in atlas
    coreId: number;          // Assigned core (0-63)
    pc: number;              // Program counter
    active: boolean;         // Execution flag
    lastResult: {
        cycles: number;
        halted: boolean;
        fraud?: boolean;
    } | null;
    executionCount: number;  // Total executions
    glowIntensity: number;   // Visual glow (0-1)
}
```

## Technical Details

### GPU Buffer Layout

- **System Memory**: 1MB storage buffer (program data, heap)
- **CPU States**: `64 cores * 46 regs * 4 bytes` = 11,776 bytes

### Register Layout (per core)

From `visual_cpu_riscv_morph.wgsl`:

| Offset | Register | Description |
|--------|----------|-------------|
| 0-31 | x0-x31 | RISC-V general registers |
| 32 | PC | Program counter |
| 38 | CSR_HALT | Halt flag (non-zero = halted) |

### WebGPU Requirements

- Browser must support WebGPU
- Chrome 113+, Edge 113+, Firefox Nightly (behind flag)
- Safari: Not yet supported

## Keyboard Shortcuts

| Key | Action |
|-----|--------|
| `Click` | Place selected glyph |
| `Ctrl+Enter` | Execute all glyphs |
| `1-6` | Select glyph from palette |

## Available Glyphs

| Key | Glyph | Code | Description |
|-----|-------|------|-------------|
| 1 | A | 65 | Accumulator |
| 2 | + | 43 | Add |
| 3 | L | 76 | Load |
| 4 | S | 83 | Store |
| 5 | J | 74 | Jump |
| 6 | ∑ | 8721 | Accumulate |

## Next Steps

### Current Limitations (POC)

- `dispatchCompute()` is simulated - no real shader dispatch
- Fraud detection uses 5% random chance for testing
- No actual RISC-V instruction execution yet

### Future Enhancements

1. **Real Compute Pipeline**: Implement actual `visual_cpu_riscv_morph.wgsl` dispatch
2. **Bind Groups**: Create proper bind groups for texture + buffers
3. **Staging Buffers**: Implement efficient async readback
4. **Instruction Set**: Define glyph-to-instruction mapping
5. **Debugging**: Step-through execution, register inspection
6. **Multi-Map**: Support multiple InfiniteMap instances

### Integration Points

- **Resonance Glyph System**: Holographic encoding validation
- **Visual Shell**: PixiJS infinite desktop
- **Tectonic Bridge**: Spatial memory mapping
- **Neural Event Bus**: Execution event broadcasting

## Troubleshooting

### "WebGPU not supported"

Update your browser or enable WebGPU flags:
- Chrome: `chrome://flags/#enable-unsafe-webgpu`
- Firefox: `about:config` -> `dom.webgpu.enabled`

### "GlyphExecutor not initialized"

Check console for WebGPU errors. The system falls back gracefully.

### "Atlas failed to load"

Ensure the atlas file exists at the configured path:
```
/assets/universal_font.rts.png
```

### Glyphs not glowing

1. Check if glyphs are registered: `executor.getActiveGlyphs()`
2. Verify execution is running: `executor.executionCount`
3. Check sprite reference in GlyphEntry
