---
name: infinite-map-testing
description: Provides testing workflows for the Infinite Map visual interface, including browser-based UI testing and integration verification. Use this skill when you need to verify tile loading, pan/zoom, HUD functionality, and Memory Beam features.
category: testing
---

# Infinite Map Testing

This skill provides structured testing workflows for the Geometry OS Infinite Map visual interface.

## Test Environment Setup

### 1. Start Backend Services

```bash
# Start Visual Bridge (WebSocket hub)
cd systems/visual_shell/api
python3 visual_bridge.py &

# Optional: Start Evolution Daemon
cd ../swarm/evolution
./evolution_ctl.sh start
```

### 2. Open Browser Interface

Navigate to:
```
systems/visual_shell/web/index.html
```

Or use a local server:
```bash
cd systems/visual_shell/web
python3 -m http.server 8080
# Open http://localhost:8080
```

## Browser Test Checklist

### Core Map Functionality

| Test | Steps | Expected Result |
|------|-------|-----------------|
| Initial Load | Open index.html | Map renders with loading overlay, then fades |
| Pan | Click and drag | Map pans smoothly in all directions |
| Zoom In | Scroll wheel up / pinch | Tiles scale up, new tiles load if needed |
| Zoom Out | Scroll wheel down / pinch out | Tiles scale down, overview visible |
| Tile Loading | Watch network tab | Tiles load progressively based on viewport |

### HUD and Debug Overlay

| Test | Steps | Expected Result |
|------|-------|-----------------|
| Toggle HUD | Press Ctrl+Shift+V | Dark overlay panel appears on right |
| Bounding Boxes | Press Ctrl+Shift+B | Bounding box overlay toggles |
| Verification HUD | Press Ctrl+Shift+H | Verification metadata shows/hides |
| Shotcut HUD | Press Ctrl+Shift+S | Shotcut visual debug toggles |
| Ghost Overlay | Press Ctrl+Shift+G | Memory ghost overlay toggles |

### Memory Beams (Hippocampus)

| Test | Steps | Expected Result |
|------|-------|-----------------|
| Activation | Hold Shift + Middle Mouse Button | Cyan beam lines appear |
| Ghost Pixels | Look at memory locations | Pulsing circles at memory points |
| Labels | Hover over memory points | Text preview appears |
| Debug Test | Run `window.geometryOSApp.memoryBeams.debugTest()` | Mock beams render |

### Tutorial System

| Test | Steps | Expected Result |
|------|-------|-----------------|
| Tutorial Button | Click "Tutorial" button (top-right) | Menu appears with tour options |
| Keyboard Shortcut | Press Ctrl+H | Tutorial menu opens |
| Auto-start | Clear localStorage, reload | Welcome prompt appears |

### Theme Support

| Test | Steps | Expected Result |
|------|-------|-----------------|
| Dark Theme | Default | Dark background (#0a0a1a) |
| Light Theme | Apply via theme manager | Light background (#f5f5f5) |
| High Contrast | Apply via theme manager | Black background (#000000) |

## Integration Tests

### WebSocket Connection Test

In browser console:
```javascript
// Check WebSocket state
window.geometryOSApp.ws?.readyState
// 0=CONNECTING, 1=OPEN, 2=CLOSING, 3=CLOSED

// Send test ping
window.geometryOSApp.ws.send(JSON.stringify({type: 'ping'}))
```

### RISC-V UART Test

1. Start RISC-V executor:
   ```bash
   cd systems/infinite_map_rs
   cargo run --release --bin run_riscv -- tests/simple_uart.rts.png
   ```

2. Open browser HUD (Ctrl+Shift+V)

3. Look for "SILICON TERMINAL" section showing UART output

### Tectonic Pulse Test

1. Ensure Visual Bridge is running

2. Inject test pulse:
   ```python
   import asyncio, websockets, json
   async def test():
       async with websockets.connect('ws://localhost:8768') as ws:
           await ws.send(json.dumps({
               'type': 'tectonic_pulse',
               'source': 0, 'dest': 100,
               'pulse_type': 'violet', 'volume': 1.0
           }))
   asyncio.run(test())
   ```

3. Verify HUD shows "TECTONIC PULSE" event

## Rust Backend Tests

### Run Unit Tests

```bash
cd systems/infinite_map_rs
cargo test
```

### Run Benchmarks

```bash
cargo bench
```

### Run Specific Test

```bash
cargo test test_hilbert_decode
cargo test test_memory_store
```

### Integration Test with Logging

```bash
RUST_LOG=debug cargo test -- --nocapture
```

## Performance Validation

### Browser Performance

Open browser DevTools (F12) > Performance:

1. Record 5 seconds of map interaction
2. Check for:
   - Frame rate >= 55 FPS
   - No long tasks > 50ms
   - GPU memory stable

### Memory Leak Check

In browser console:
```javascript
// Get baseline
console.log('Initial memory:', performance.memory?.usedJSHeapSize)

// Interact with map for 1 minute
// ...

// Check after interaction
console.log('After memory:', performance.memory?.usedJSHeapSize)
```

### Tile Cache Performance

```javascript
// Check tile cache stats
window.geometryOSApp.chunkManager?.cache?.stats
```

## Test Runner

Navigate to the test runner page:
```
systems/visual_shell/web/tests/test_runner.html
```

This provides a UI for running automated browser tests.

## Troubleshooting Failed Tests

### Map Not Rendering

1. Check WebGL support:
   ```javascript
   document.createElement('canvas').getContext('webgl2')
   ```

2. Verify PixiJS loaded:
   ```javascript
   typeof PIXI
   ```

3. Check console for shader errors

### Tiles Not Loading

1. Check network tab for 404s
2. Verify tile manifest exists:
   ```bash
   ls systems/visual_shell/web/tile_manifest.json
   ```

3. Check chunk manager state:
   ```javascript
   window.geometryOSApp.chunkManager
   ```

### HUD Not Updating

1. Verify WebSocket connection (see above)
2. Check for event listener errors in console
3. Verify visual_debug_overlay.js loaded without errors

## Automated Test Commands

```bash
# Run all Python tests
pytest systems/visual_shell/tests/

# Run with coverage
pytest --cov=systems/visual_shell systems/visual_shell/tests/

# Run Rust tests
cd systems/infinite_map_rs && cargo test --all

# Run E2E tests (requires browser)
python3 systems/visual_shell/tests/e2e/test_infinite_map.py
```
