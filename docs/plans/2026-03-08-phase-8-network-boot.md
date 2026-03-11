# Implementation Plan: Phase 8 - Network Boot (v1.2 Milestone)

> **"The OS is no longer a disk image; it is a live video stream."**

## Goal
Enable Geometry OS to boot remotely by streaming the 3D Holographic Substrate as a bootable PixelRTS v2 texture. 

## 1. Core Architecture
The Network Boot process follows the "Holographic Pipeline":
1.  **Source:** The live 3D Hilbert VRAM (Holographic Substrate).
2.  **Flattening:** A compute shader flattens the 3D layers into a high-density 2D PixelRTS v2 texture.
3.  **Stream:** The `visual_bridge` streams this texture via WebSocket at 60 FPS.
4.  **Boot:** The remote hypervisor (Rust) pulls the stream, re-maps the pixels to 1D memory, and executes.

## 2. Implementation Tasks

### Task 1: Holographic Flattening (WGSL)
*   **File:** `systems/hypervisor/src/glyph_renderer.wgsl`
*   **Action:** Implement `flatten_hologram()` compute shader.
*   **Logic:** Iterate through (X,Y,Z) and pack into a large (X,Y) texture using 3D-to-2D Hilbert coordinate folding.

### Task 2: Network Boot Protocol (Python/Rust)
*   **File:** `systems/visual_shell/api/boot_bridge.py`
*   **Action:** Create a new bridge endpoint `/ws/v1/boot_stream`.
*   **Logic:** Stream raw binary texture chunks with SHA256 integrity headers.

### Task 3: Remote Hypervisor Loader (Rust)
*   **File:** `systems/hypervisor/src/net_loader.rs`
*   **Action:** Implement a lightweight loader that connects to the `boot_bridge`.
*   **Logic:** Receive texture -> Invert 3D Hilbert mapping -> Populate RAM -> Jump to Kernel Entry.

### Task 4: E2E Integration Test
*   **File:** `tests/test_network_boot_e2e.py`
*   **Action:** Simulate a server streaming a kernel and a client successfully jumping to the entry point.

## 3. Success Criteria
*   [ ] Live 3D substrate can be flattened to 2D RTS texture in <16ms.
*   [ ] WebSocket stream maintains 100MB/s throughput (local/LAN).
*   [ ] Remote client can reconstruct 1D memory from the 3D Hilbert stream.
*   [ ] System boots to "Hello Geometry OS" prompt via network stream.

---
**Status:** Planned  
**Target:** v1.2.0  
**Architect:** FFI Bridge Team  
