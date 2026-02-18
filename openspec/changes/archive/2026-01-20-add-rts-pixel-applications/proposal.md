# Proposal: RTS Pixel Applications (Self-Executing PNGs)

## Abstract
Transform the Operating System from a "Launcher of Binaries" to a "Field of Active Textures".
We enable applications to exist as self-contained `.rts.png` files—valid images that contain their own bootable runtime (QEMU/Linux/Python).

## Context
Currently, apps are separate binaries. In Geometry OS, we want "The UI to be the Computer".
A user should be able to drag an App (PNG) to a different machine, and it carries its entire execution environment with it.

## The Solution: Polyglot RTS Images
We define a new file standard: `.rts.png`.
1. **Visual Layer**: A standard PNG image (the "Icon" or last screenshot).
2. **Hidden Layer**: Embedded binary payload containing:
   - Application Code (Python/Binary)
   - Runtime Config (`boot.json`)
   - (Optional) Differential RootFS overlay.

## Impact
- **Portability**: Apps become single files.
- **Visual State**: Apps look like what they are doing (thumbnails are live).
- **Security**: Apps are sandboxed MicroVMs by default.

## Risk Assessment
- **File Size**: Embedding full kernels is too heavy. We must implement a "Shared Kernel" architecture.
- **Performance**: Booting QEMU for every icon is slow. We need a "Warm Standby" pool of VMs.
