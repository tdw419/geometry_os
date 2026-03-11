# Substrate Cloning Guide

## Overview

Substrate Cloning converts VM-based UI into native PixelRTS WGSL shaders
that run without the original VM.

## Architecture

```
Live Tile (VM) ──▶ Extraction Pipeline ──▶ UITransmuter ──▶ WGSL Shader
                                                           │
                                                           ▼
                                                   .geometry/clones/
```

## Components

### UITransmuter (`systems/evolution_daemon/ui_transmuter.py`)
Wrapper around conductor UITransmuter. Converts extraction JSON to WGSL shaders.

### SubstrateBrush (`systems/evolution_daemon/substrate_brush.py`)
Provides in-vivo binary painting on Hilbert-mapped textures.

### CloneOrchestrator (`systems/evolution_daemon/clone_orchestrator.py`)
Coordinates the cloning pipeline and manages clone tasks.

## Usage

### Python API

```python
from systems.evolution_daemon.clone_orchestrator import CloneOrchestrator

orchestrator = CloneOrchestrator()
task = orchestrator.request_clone(
    source_tile_id="alpine-vm",
    extraction_result=extraction_json,
    target_name="alpine_native"
)
print(f"Output: {task.output_path}")
```

### RPC API

```javascript
// Via WebSocket
{
    "method": "clone_tile",
    "params": {
        "tile_id": "my-vm",
        "target_name": "my_cloned_ui"
    }
}
```

### Glass Box UI

1. Select a Live Tile in Neural City
2. Wait for extraction (auto every 10s)
3. Click "🧬 Clone" button
4. WGSL saved to `.geometry/clones/`

## Verification

Run the test suite:

```bash
pytest tests/evolution_daemon/test_ui_transmuter.py tests/evolution_daemon/test_substrate_brush.py tests/evolution_daemon/test_clone_orchestrator.py tests/evolution_daemon/test_substrate_cloning_e2e.py -v
```

## Output Files

Cloned WGSL shaders are saved to `.geometry/clones/<target_name>.wgsl`

## Next Steps

- Visual regression testing for cloned UIs
- Integration with Evolution Daemon for autonomous cloning
- PixelRTS packaging and Infinite Map registration
