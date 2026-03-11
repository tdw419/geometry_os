# WGPU Linux GUI Hypervisor - Design Document

> **Created:** 2026-02-14
> **Status:** Approved

## Overview

A pure browser-based Linux hypervisor using WebGPU to run GUI programs. The system boots real Linux kernels (RISC-V) and displays graphical output directly in the browser with no backend dependencies.

## Requirements

### Must Have
- Pure browser execution (WebGPU only, no backend)
- Pre-compiled .rts.png kernel textures
- Multiple display modes (Canvas, WebGPU, PixiJS)
- Direct user input + AI programmatic control
- Progressive GUI support: framebuffer → X11 → Wayland

### Success Criteria (Progressive)
1. **Milestone 1:** Boot to shell - Linux boots, shows login prompt
2. **Milestone 2:** Interactive terminal - Type commands, see output
3. **Milestone 3:** GUI application - Run a real graphical app

## Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                        Browser                                   │
│  ┌─────────────────────────────────────────────────────────────┐│
│  │                    Hypervisor App                           ││
│  │  ┌─────────────┐  ┌─────────────┐  ┌─────────────────────┐ ││
│  │  │ Kernel      │  │ Display     │  │ Input               │ ││
│  │  │ Loader      │  │ Manager     │  │ Handler             │ ││
│  │  │ (.rts.png)  │  │ (3 modes)   │  │ (Direct + AI)       │ ││
│  │  └──────┬──────┘  └──────▲──────┘  └──────────┬──────────┘ ││
│  │         │                │                     │           ││
│  │         ▼                │                     ▼           ││
│  │  ┌─────────────────────────────────────────────────────────┐││
│  │  │              GPUExecutionSystem                         │││
│  │  │  ┌─────────────┐  ┌─────────────┐  ┌─────────────────┐ │││
│  │  │  │ RISC-V      │  │ 64MB VRAM   │  │ MMU (Sv32)      │ │││
│  │  │  │ Shader      │  │ Memory      │  │ Page Tables     │ │││
│  │  │  │ (RV32IM)    │  │             │  │                 │ │││
│  │  │  └─────────────┘  └─────────────┘  └─────────────────┘ │││
│  │  └─────────────────────────────────────────────────────────┘││
│  └─────────────────────────────────────────────────────────────┘│
└─────────────────────────────────────────────────────────────────┘
```

## Components

### 1. Kernel Loader (`wgpu_kernel_loader.js`)
- Fetches .rts.png texture from URL
- Extracts kernel blob + initramfs
- Writes to GPU memory at 0x00000000
- Sets initial PC to entry point

### 2. Display Manager (`display/`)
Three rendering modes:
- **Canvas Renderer** - Direct ImageData (simplest)
- **WebGPU Renderer** - Texture swap (fastest)
- **Pixi Renderer** - Integration with visual shell

### 3. Input Handler (`wgpu_input_handler.js`)
- Captures canvas keyboard/mouse events
- Writes to MMIO region at 0x02000000
- Supports both direct user input and AI control

### 4. Hypervisor Orchestrator (`wgpu_linux_hypervisor.js`)
- Coordinates boot sequence
- Manages 60fps execution loop
- Integrates all components

## Memory Layout (64MB)

| Region | Start | End | Size | Purpose |
|--------|-------|-----|------|---------|
| Kernel | 0x00000000 | 0x00FFFFFF | 16MB | Kernel code + initramfs |
| Framebuffer | 0x01000000 | 0x01FFFFFF | 16MB | 1024x768 RGBA video |
| MMIO | 0x02000000 | 0x02FFFFFF | 16MB | Input devices |
| User | 0x03000000 | 0x03FFFFFF | 16MB | Page tables + user memory |

## MMIO Layout (0x02000000)

| Offset | Size | Purpose |
|--------|------|---------|
| 0x0000 | 4 bytes | Keyboard status (type=1, scancode, modifiers) |
| 0x0004 | 4 bytes | Keyboard data |
| 0x1000 | 4 bytes | Mouse status (type=2) |
| 0x1004 | 4 bytes | Mouse x/y packed (16-bit each) |
| 0x1008 | 1 byte | Mouse buttons |

## Data Flow

### Boot Sequence
1. Fetch kernel.rts.png from URL
2. Extract kernel blob to GPU memory @ 0x00000000
3. Setup identity page tables @ 0x03000000
4. Set satp CSR (enable MMU)
5. Set PC to entry point (0x80000000)
6. Start 60fps tick loop

### Runtime Loop (60fps)
1. Execute 10K RISC-V cycles
2. Read framebuffer from 0x01000000
3. Render using active display mode
4. Process input queue → MMIO writes

## Target Distribution

**Primary:** Alpine Linux + fbdev
- Size: ~5MB kernel + initramfs
- Framebuffer-native (no X11 initially)
- Fast boot for iteration

**Progression:** Alpine fbdev → Alpine X11 → Full Debian

## File Structure

```
systems/visual_shell/web/
├── wgpu_kernel_loader.js        # Kernel loading
├── wgpu_linux_hypervisor.js     # Main orchestrator
├── wgpu_input_handler.js        # Input handling
├── display/
│   ├── canvas_renderer.js       # Canvas 2D mode
│   ├── webgpu_renderer.js       # WebGPU texture mode
│   └── pixi_renderer.js         # PixiJS integration
├── kernels/
│   ├── alpine_minimal.rts.png   # Milestone 1 kernel
│   └── alpine_gui.rts.png       # Milestone 3 kernel
├── test_boot_shell.html         # M1 test page
├── test_interactive_shell.html  # M2 test page
└── test_gui_app.html            # M3 test page
```

## Dependencies (Existing)

- `gpu_execution_system.js` - RISC-V execution engine
- `visual_cpu_riscv.wgsl` - Shader with MMU support
- `webmcp_bridge.js` - AI control tools

## Risks & Mitigations

| Risk | Mitigation |
|------|------------|
| Missing RISC-V instructions | Implement incrementally as needed |
| Kernel too large | Use minimal Alpine, strip symbols |
| Input latency | Keep MMIO writes on main thread |
| WebGPU compatibility | Canvas fallback mode |

## Next Steps

See implementation plan: `docs/plans/2026-02-14-wgpu-linux-gui-hypervisor.md`
