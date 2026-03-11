# Tasks: Phase 47 Hypervisor Convergence

- [x] **Task 1**: Implement QEMU Wrapper
  - **Description**: Create a struct in `virtual_machine.rs` that manages a `qemu-system-x86_64` child process. It should handle starting, stopping, and monitoring the process.
  - **Acceptance Criteria**:
    - Can launch QEMU with a specified ISO.
    - Captures stdout/stderr for logging.
    - Gracefully terminates QEMU when the host app closes.
  - **Estimated Effort**: Medium

- [x] **Task 2**: Implement Shared Memory Framebuffer
  - **Description**: Configure QEMU to output to a shared memory file (or use a memory-mapped file) and have `infinite_map_rs` read this directly into a WGPU texture.
  - **Acceptance Criteria**:
    - QEMU writes to a known memory location/file.
    - Rust compositor reads this data each frame.
    - The texture updates in real-time on the 3D map.
  - **Estimated Effort**: Large

- [x] **Task 3**: Integrate Ground Truth Shader
  - **Description**: Connect the dynamic VM texture to the `ground_truth.wgsl` pipeline in `renderer.rs`.
  - **Acceptance Criteria**:
    - The VM window looks "biological" (CRT effects, pulse).
    - Visual artifacts (scanlines) appear correctly on the VM output.
  - **Estimated Effort**: Small

- [x] **Task 4**: Input Forwarding
  - **Description**: Route keyboard and mouse events from `input_manager.rs` to the QEMU process.
  - **Acceptance Criteria**:
    - Typing in the Infinite Map sends keys to the Alpine Linux console.
    - Mouse movement is captured (if GUI is running).
  - **Estimated Effort**: Medium

- [x] **System-Test**: Full Boot Verification
  - **Description**: Boot Alpine Linux ISO to a login prompt visible on the map.
  - **Acceptance Criteria**:
    - Login prompt is legible.
    - User can type `root` and log in.
    - Frame rate remains > 60 FPS during boot.
  - **Estimated Effort**: Medium
