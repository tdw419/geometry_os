# Tasks: Phase 40.4 - Self-Hosted Builder

- [x] **Task 1: Extend Infinite Builder for Source Loading**
    - **Description**: Update `systems/builder/infinite_builder.py` to watch for specialized build tasks that trigger `source_loader.py`.
    - **Acceptance Criteria**:
        - Placing a trigger file in the queue results in a fresh `city.json`.
        - Logging clearly shows the build process.
    - **Estimated Effort**: Small

- [x] **Task 2: Define the Foundry Tile in Source Loader**
    - **Description**: Modify `systems/builder/source_loader.py` to always include a "Foundry" tile at a fixed coordinate (e.g., center of the city) if it's not already there.
    - **Acceptance Criteria**:
        - A specialized tile with `type: "foundry"` appears in the generated `city.json`.
    - **Estimated Effort**: Small

- [x] **Task 3: Implement Foundry Interaction in Compositor**
    - **Description**: In `systems/infinite_map_rs/src/app.rs`, add logic to detect Right Click on a tile of type "foundry". Trigger the build task creation.
    - **Acceptance Criteria**:
        - Right-clicking the tile creates a file in `systems/builder/queue/`.
    - **Estimated Effort**: Medium

- [x] **Task 4: Implement Map Reload Logic**
    - **Description**: Add a mechanism for the compositor to reload its source city state without restarting.
    - **Acceptance Criteria**:
        - Map refreshes and displays new pillars when `city.json` changes.
    - **Estimated Effort**: Large
