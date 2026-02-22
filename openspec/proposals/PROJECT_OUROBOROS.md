---
title: "Project Ouroboros: The Visual Quine"
status: PROPOSAL
priority: CRITICAL
---

# Project Ouroboros: The OS as its own IDE

> "How could we use the existing infinite map to figure out a way to build a new way to build the infinite map?"

## The Concept
We replace the terminal/IDE with the Infinite Map itself. The source code of Geometry OS is projected onto the map as a **Civilization of Code**.

- **Directories** = Districts (Regions on the Hilbert Curve)
- **Files** = Buildings (Large Tiles)
- **Functions** = Rooms (Interactive Bricks)
- **Logic** = Traffic (Packets moving between functions)

## The Bootstrap Loop (Quine)

To build the "new way" using the "existing map":

1.  **Source Materialization**: We write a "Source Loader" that reads the local `./geometry_os` git repo and spawns it as a massive map structure.
    - usage: `cargo run -- --load-source ./`
    - Result: You fly over the `systems/infinite_map_rs` district.

2.  **Visual Refactoring (Spatial Coding)**:
    - Instead of typing `mv app.rs new_loc/`, you **physically drag** the `app.rs` building to the new district.
    - The Synaptic Bridge detects this `TileMoved` event and triggers the actual file system syscall.

3.  **The Builder Tile (The Factory)**:
    - A special "Compiler" tile exists.
    - You drag the `systems/` district connectivity wires into the Compiler Tile.
    - **Visual Output**: The Compiler Tile glows, churns (animated), and excretes a *new* `geometry_os` binary executable tile.

4.  **Hot Swapping**:
    - Executing the new binary tile replaces the currently running process (execv), effectively rebooting into the new version you just visually assembled.

## Implemenation Path (Phase 40)

### Step 1: Source visualizer (`systems/builder`) ✅ COMPLETE
- **Created**: `systems/builder/source_loader.py`
- Scans 291,946 source files
- Maps files to Hilbert curve coordinates for spatial coherence
- Generates layout JSON + HTML visualization
- Districts = 582 regions (systems/, ubuntu_full_rootfs, etc.)

**Visualization Generated**: `/tmp/source_city_viz.html`

### Step 1.5: Rust Integration ✅ COMPLETE
- **Created**: `systems/infinite_map_rs/src/source_city.rs`
- Integrated `SourceCityLoader` into `InfiniteMapApp`
- Added `--load-source` command line argument
- Loaded source city is available via `app.source_city_loader`

**Usage**:
```bash
# Generate source city JSON
python3 systems/builder/source_loader.py --output /tmp/source_city.json --visualize

# Load in Infinite Map
cargo run -- --load-source /tmp/source_city.json
```

### Step 2: The Synaptic Editor
- Use the **Synaptic Bridge** to interpret map interactions as code edits.
- `Event: Connector(Tile A, Tile B)` -> `Action: Inject Function Call`

### Step 3: Self-Hosted Builder
- Run the build command (`cargo build`) via a visual trigger.
- Stream the `stderr/stdout` of the compiler into a "Log River" visualizing errors as pollution/fire in the city.

## Feasibility
We already have:
- `api_server` to read/write files (Phase 34).
- `run_command` capability in Daemon.
- `Synaptic Bridge` to trigger actions (Phase 35.5).
- `riscv_executor` to run small logic chunks on GPU.

**We just need to visualize the Source Code itself.**
