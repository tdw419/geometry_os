# Phase 17: The Inception Protocol

## Rationale
We have achieved a stable Visual Shell (PixiJS) and a functional Building Daemon (Masonry). To realize the "Self-Building OS" vision, we must close the loop: the OS must be able to boot a development environment *within itself* that can modify its own source code.

This phase implements the "Inception Protocol": the ability for Geometry OS (Visual Shell) to execute **PixelRTS Containers** (like `ubuntu.rts.png`), spawning actual Linux VMs that can be used for development.

## Tasks
1. **PixelRTS Integration**: Ensure `ubuntu.rts` (or a lightweight Linux variant) is converted to `ubuntu.rts.png` and placed on the Infinite Desktop.
2. **Server-Side Execution**: Update `InfiniteDesktopServer` to detect `EXECUTE_FILE` events for `.rts.png` files and trigger the `PixelRTS` boot sequence.
3. **QEMU Spawning**: The server must invoke `qemu-system-x86_64` using the kernel/initrd extracted from the `.rts.png`.
4. **Visual Feedback**: The OS should indicate "Virtual Machine Running" via the Masonry/Status interface.

## Visual Impact
- **New Icon**: `ubuntu.rts.png` (Linux Penguin in a Glass Cube).
- **Action**: Double-clicking spawns a QEMU window (initially external, eventually embedded).

## Technical Requirements
- Python 3.12+
- QEMU installed on host (`qemu-system-x86_64`)
- Existing `ubuntu.rts` artifact
