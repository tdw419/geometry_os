# Refinery Spatial Grid Integration

This document explains how the refinery simulation maps to the Geometry OS spatial grid, enabling industrial process visualization and execution on pixel-native spatial compute.

## Overview

The refinery integration demonstrates a complete pipeline from CPU simulation to spatial grid rendering:

1. **CPU Simulation** (`RefinerySimulation`) - Models refinery physics (flow, pressure, temperature)
2. **Spatial Rendering** (`RefineryRenderer`) - Maps simulation state to 128x64 grid cells
3. **GPU Execution** - Loads spatial cells into GridRunner for spatial compute (experimental)

## Spatial Grid Configuration

The refinery uses a 128x64 spatial grid (8,192 cells total), suitable for industrial process visualization:

- **Grid Dimensions**: 128 (width) × 64 (height)
- **Cell Size**: Each cell represents ~2x2 meters of refinery floor space
- **Total Area**: 256m × 128m = 32,768 m²

## Opcode Mapping (Opcodes 18-25)

Refinery equipment types map to specific spatial opcodes, enabling hardware-level classification:

| Opcode | Symbol | Equipment Type | Data Encoding |
|--------|--------|----------------|---------------|
| 18     | ≈      | Oil Flow       | RGBA: flow rate + color |
| 19     | ◉      | Valve          | RGBA: open/close state |
| 20     | ◎      | Pump           | RGBA: RPM + status |
| 21     | ☀      | Heater         | RGBA: temperature + power |
| 22     | ◫      | Separator      | RGBA: efficiency + throughput |
| 23     | ▮      | Storage (Tank) | RGBA: fill level + color |
| 24     | ✚      | Sensor         | RGBA: measurement value |
| 25     | ⨁      | Mixer          | RGBA: rotation speed + state |

## Data Encoding (32-bit `data_buffer`)

Each cell's 32-bit `data_buffer` encodes equipment state:

```
Bits 24-31: Alpha (0xFF = opaque)
Bits 16-23: Blue (blue component of RGBA color)
Bits  8-15: Green (green component of RGBA color)
Bits  0- 7: Red (red component of RGBA color)
```

### Example Color Encodings

- `0xff13458b` = Oil flow (brown, high alpha)
- `0xff64c8ff` = Storage tank outline (silver-gray, high alpha)
- `0xff0066cc` = Water/coolant (blue, high alpha)

## Rendering Pipeline

### 1. Simulation → Render Elements

`RefineryRenderer::render_state()` converts simulation state to render elements:

```rust
// From refinery state
state.tanks.iter().map(|tank| {
    RenderElement::Tank {
        x: tank.position.0 / 2,    // Convert to grid coordinates
        y: tank.position.1 / 2,
        width: tank.width / 2,
        height: tank.height / 2,
        current_volume: tank.current_volume,
        capacity: tank.capacity,
        color: 0xff64c8ff,
    }
})
```

### 2. Render Elements → Spatial Cells

`RefineryRenderer::to_spatial_cells()` rasterizes render elements to grid:

```rust
// Rasterize pipe (Bresenham's algorithm)
rasterize_line(
    cells,
    grid_width,
    grid_height,
    start_x, start_y,
    end_x, end_y,
    color,      // data_buffer encoding
    18,         // opcode (Oil Flow)
);

// Rasterize tank (rectangle fill)
rasterize_rect(
    cells,
    grid_width,
    grid_height,
    x, y, width, height,
    color,      // data_buffer encoding
    23,         // opcode (Storage)
);
```

### 3. Spatial Cells → GPU Overlay (Experimental)

Cells can be loaded into GPU via `bytemuck::cast_slice`:

```rust
let overlay_bytes = cast_slice(&cells);  // 16 bytes per cell
grid_runner.load_overlay(overlay_bytes);
grid_runner.tick();  // Execute spatial compute
```

## Grid Runner Compatibility Note

The current `GridRunner` is designed for 17x17 spatial routing grids (289 cells), which is optimal for pathfinding algorithms. The refinery demo uses a 128x64 grid (8,192 cells) for industrial visualization.

**Current Status**: GPU execution falls back gracefully to CPU demo when grid sizes don't match.

**Future Work**: Implement a configurable GridRunner that supports arbitrary grid sizes for industrial visualization.

## Usage Example

```rust
// 1. Create refinery simulation
let (state, connections) = RefinerySimulation::create_mvp_layout();
let mut sim = RefinerySimulation::new(state, 1.0);
for conn in connections {
    sim.add_connection(conn);
}

// 2. Run simulation
for _ in 0..10 {
    sim.step()?;
}

// 3. Render to spatial grid
let mut visualizer = RefineryRenderer::with_defaults();
visualizer.render_state(sim.state(), 0.0);
let grid_width = 128;
let grid_height = 64;
let cells = visualizer.to_spatial_cells(grid_width, grid_height);

// 4. Statistics
let active_cells = cells.iter().filter(|c| c.is_active > 0).count();
println!("Active cells: {} / {}", active_cells, cells.len());
// Output: Active cells: 461 / 8192
```

## Running the Demo

```bash
cd systems/infinite_map_rs
cargo run --bin refinery_demo
```

**Expected Output**:
- 461 active cells (refinery equipment)
- 3 tanks with fill levels
- 1 pipe with flow rate (44.271 m³/s)
- Equipment layout in grid coordinates

## Key Files

- `systems/infinite_map_rs/src/refinery/simulation.rs` - CPU simulation engine
- `systems/infinite_map_rs/src/refinery/visualization.rs` - Spatial grid renderer
- `systems/infinite_map_rs/src/refinery/types.rs` - Refinery data structures
- `systems/infinite_map_rs/src/bin/refinery_demo.rs` - Demo binary
- `systems/infinite_map_rs/src/spatial/grid_runner.rs` - GPU grid executor

## Integration Patterns

### Pattern 1: Equipment Type → Opcode

Refinery equipment types map one-to-one to spatial opcodes, enabling:
- Hardware-level classification
- Opcode-based filtering
- Spatial shader branching

```rust
let opcode = match equipment_type {
    EquipmentType::Pipe => 18,  // Oil Flow
    EquipmentType::Tank => 23,  // Storage
    // ... etc
};
```

### Pattern 2: State → Color Encoding

Simulation state encodes into RGBA colors for visual feedback:

```rust
let color = encode_rgba(
    red:   flow_rate as u8,
    green: pressure_norm as u8,
    blue:  temperature_norm as u8,
    alpha: 255,
);
```

### Pattern 3: Coordinate Scaling

Physical coordinates (meters) scale to grid coordinates:

```rust
let grid_x = (physical_x as i32 / 2).clamp(0, grid_width as i32 - 1);
let grid_y = (physical_y as i32 / 2).clamp(0, grid_height as i32 - 1);
```

### Pattern 4: Rasterization with Metadata

Geometric primitives rasterize with both visual data and opcodes:

```rust
fn rasterize_line(
    cells: &mut [CellState],
    grid_width: usize,
    grid_height: usize,
    x0, y0, x1, y1,
    data: u32,    // Color encoding
    opcode: u8,   // Equipment type
);
```

## Future Enhancements

1. **GPU Grid Runner Expansion** - Support arbitrary grid sizes (not just 17x17)
2. **Spatial Physics** - Move simulation compute to WGSL shaders
3. **Interactive Control** - Click-to-control valves, pumps via spatial events
4. **Real-time Updates** - Continuous sync between CPU sim and GPU grid
5. **Multi-scale Rendering** - Zoomable refinery view with LOD

## References

- Geometry OS Spatial Architecture: `docs/geometry-os-spatial-architecture.md`
- WGSL Compute Shaders: `systems/infinite_map_rs/src/spatial/spatial_compute.wgsl`
- Refinery Physics Model: `systems/infinite_map_rs/src/refinery/simulation.rs:SimulationEngine`