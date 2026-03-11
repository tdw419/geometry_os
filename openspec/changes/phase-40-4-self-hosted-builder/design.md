# Design: Phase 40.4 - Self-Hosted Builder

## Architecture

### 1. The Builder Daemon (`infinite_builder.py`)
Extend the builder to support a new task type: `REBUILD_CITY`.
When a task of this type is received, the builder will:
1. Execute `python3 systems/builder/source_loader.py --output systems/builder/output/city.json`.
2. Signal the compositor (via a file signal or HTTP endpoint) that the city manifest has been updated.

### 2. The Compositor (`infinite_map_rs`)
Add logic to handle a `ReloadMap` signal.
- **Component**: `systems/infinite_map_rs/src/app.rs`
- **Action**: Re-read `city.json` and update the live `SourceCity` state in the renderer.
- **Visual**: A specialized tile (The "Foundry") will serve as the UI trigger.

### 3. Visual Shell / UI
- **Tile Color**: Deep Cyan / Metallic Silver (representing the factory/foundry).
- **Interaction**: 
    - **Right Click**: Opens a context menu or directly triggers "Rebuild".
    - **Animation**: The tile should pulse or show a "construction" overlay while the build is in progress.

### 4. Communication Path
`Visual Interaction` -> `Compositor Signal` -> `Infinite Builder Queue` -> `Source Loader Execution` -> `Compositor Reload`.

## Data Flows
1. User clicks "Rebuild" on Foundry Tile.
2. `app.rs` writes a command to `systems/builder/queue/rebuild.task`.
3. `infinite_builder.py` picks up `rebuild.task`.
4. `source_loader.py` runs and overwrites `city.json`.
5. `infinite_builder.py` sends a `SIGUSR1` to the compositor or updates a `status.json`.
6. `app.rs` reloads the source city.
