# Technical Design: Hypervisor Convergence

## Architecture

### 1. The Virtual Tile Wrapper (`src/virtual_machine.rs`)
We will refine the existing KVM stub to support standard ISO booting.
- **QemuProcess**: A wrapper around the `qemu-system-x86_64` process (easier than raw KVM for initial ISO support).
- **Shared Memory**: Using `shm_open` to share the framebuffer between QEMU and the Rust Compositor.
- **Signal Handling**: Forwarding input events via QMP (QEMU Machine Protocol) or direct standard input injection.

### 2. Texture Binding (`src/renderer.rs`)
Link the VM framebuffer to the rendering pipeline.
- The `has_vm_texture` flag in `renderer.rs` will be activated.
- The **Ground Truth Shader** (`ground_truth.wgsl`) will be reused to render the VM framebuffer, applying CRT effects and "biological coupling" (brightness pulsing on CPU activity).

### 3. Input Injection (`src/input_manager.rs`)
- Capture standard Winit keyboard/mouse events.
- Translate them to QEMU-compatible events when a `WindowType::VirtualMachine` has focus.

## Verification
- Boot `alpine-standard-3.18.iso`.
- Achieve 60 FPS update rate in the VM window.
- Verify reliable typing and mouse interaction.
