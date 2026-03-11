# Evolution Zone Testing Guide

## Full Pipeline Testing

This guide covers testing the complete Evolution Zone autonomous execution pipeline.

## Architecture Overview

```
User Click → Rust Frontend → Python Daemon → Compositor Rendering
     ↓              ↓                ↓                ↓
Evolution Zone   WriteEvolvedGenome   Compile & Emit    Render Tile
   Window         Message          CARTRIDGE_CREATED    on Map
```

## Manual Testing Steps

### 1. Start Evolution Daemon

```bash
python3 evolution_daemon_v8.py
```

Expected output:
```
🧬 INITIALIZING EVOLUTION DAEMON V8 (UNIFIED)...
🧬 Genome Queue Initialized - Ready for autonomous execution
🔗 EvolutionDaemonBridge initialized for genome forwarding
```

### 2. Start Geometry OS Compositor

```bash
cd systems/infinite_map_rs
cargo run --release --bin geometry-os
```

Expected output:
```
Starting Infinite Map Compositor
Wayland socket: geometry-os-wayland-0
GEOMETRY OS - Visual Substrate (PIXIJS/WGPU)
```

### 3. Click on Evolution Zone Window

- Locate the Evolution Zone window (gold border)
- Click anywhere in the window
- Observe the logs

### 4. Verify Python Daemon Response

```
📥 Genome queued: genome-boot-XXX
🧬 Processing genome: genome-boot-XXX
📢 CARTRIDGE_CREATED resonance emitted: genome-boot-XXX at (100.0, 200.0)
```

### 5. Verify Rust Compositor Response

```
🎮 Cartridge registered: genome-boot-XXX at (100.0, 200.0)
🎮 Rendering cartridge: genome-boot-XXX at (100.0, 200.0)
```

### 6. Verify Visual Result

- A colored tile should appear at the click position
- The tile should be approximately 64x64 pixels
- Color should be gold-ish (green-yellow tint from RGBA dense packing)

## Component Testing

### Python Daemon Tests

```bash
# Test resonance emission
python3 -m pytest tests/test_cartridge_resonance.py -v

# Test genome queue
python3 -m pytest tests/test_evolution_genome_queue.py -v
```

### Rust Compositor Tests

```bash
# Test cartridge registry
cargo test --package infinite_map_rs test_cartridge_registry --lib

# Test evolution manager polling
cargo test --package infinite_map_rs test_evolution_manager_resonance --lib
```

## Integration Testing

### Test SIB File Format

The SemanticIntentBus writes to `/tmp/geometry_os_sib.json`:

```json
{
  "registry": {
    "intent_1234567890": {
      "intent_id": "intent_1234567890",
      "actor": "evolution_daemon_v8",
      "explicit": "CARTRIDGE_CREATED",
      "implicit": {
        "cartridge_id": "genome-boot-123",
        "cartridge_path": "/tmp/genome-boot-123.rts.png",
        "spawn_x": 100.0,
        "spawn_y": 200.0,
        "generation": 1,
        "fitness": 0.95
      },
      "status": "ACTIVE",
      "timestamp": 1707542400.0
    }
  },
  "timestamp": 1707542400.0
}
```

### Verify Cartridge File

After clicking Evolution Zone, check for the cartridge file:

```bash
ls -la /tmp/genome-*.rts.png
```

Expected: A new .rts.png file should exist with the genome data encoded.

## Troubleshooting

### Issue: No resonance emitted

**Check:**
- Python daemon is running
- `intent_bus` is initialized in daemon
- `/tmp/geometry_os_sib.json` exists and is writable

### Issue: Cartridge not registered

**Check:**
- SIB file contains CARTRIDGE_CREATED resonance
- Rust compositor is reading SIB file path (default: `/tmp/geometry_os_sib.json`)
- EvolutionManager update interval is being called

### Issue: Cartridge not visible

**Check:**
- Cartridge is registered in EvolutionManager
- `render_cartridges()` is being called
- Spawn coordinates are within visible map area
- Tile size is appropriate (64x64 pixels)

## Performance Notes

- SIB polling interval: 100ms (10Hz)
- EvolutionManager update interval: 500ms (2Hz)
- Rendering happens on every Redraw event (60Hz target)

## Next Phases

- **Phase 35.9.1**: Load actual .rts.png textures
- **Phase 35.9.2**: Render as clickable tiles with borders
- **Phase 35.9.3**: Handle tile interactions (click to boot)
- **Phase 36.0**: Auto-boot from Evolution Zone
