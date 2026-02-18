# Tasks: Phase 40.5 - Stateful Hot Swapping

- [x] **Task 1: Define the Vat State Protocol**
    - **Description**: Create a shared header or trait in Rust (`crate::hot_swap::VatState`) that defines how state is serialized for hot-swapping.
    - **Acceptance Criteria**: A working prototype that can serialize/deserialize a simple counter and instruction pointer.
    - **Estimated Effort**: Medium

- [x] **Task 2: Implement the ModuleManager in the Compositor**
    - **Description**: Extend `InfiniteMapApp` with a `ModuleManager` capable of loading `.so` files (or `.rts.png` interpreted as logic blocks) and invoking lifecycle hooks.
    - **Acceptance Criteria**: The compositor can reload a dummy module without crashing.
    - **Estimated Effort**: Large

- [x] **Task 3: Integrate Hot-Snapping with the Foundry**
    - **Description**: Update the Foundry reload logic (`poll_rebuild_signal`) to not just update the visualization, but also signal the `ModuleManager` to perform a hot-swap if a binary changed.
    - **Acceptance Criteria**: Rebuilding the city results in running modules being upgraded live.
    - **Estimated Effort**: Medium

- [x] **Task 4: Create the "Morph" Transition Shader**
    - **Description**: Add a WGSL shader that creates a visual distortion effect on the tile being refactored/swapped.
    - **Acceptance Criteria**: A visible "shimmer" or "melt" occurs when a building is updated.
    - **Estimated Effort**: Medium
