# PixelRTS Boot Improvement

## What This Is

A transformation of PixelRTS from a novel encoding format into a practical, production-ready OS boot and distribution system with network capabilities. The project enables booting OS containers from anywhere - local files, remote servers, or bare metal over PXE - with the same visual, drag-and-drop experience.

## Core Value

**Booting an OS should be as visual and intuitive as opening an image file — from anywhere.**

If everything else fails, users must be able to:
1. Drag an `.rts.png` file to boot
2. See what OS they're about to boot (visual preview)
3. Trust the container (vision-based verification)
4. Boot from remote URLs with offline resilience
5. Boot bare metal machines over PXE

## Current Milestone: v1.4 GPU Linux Execution

**Goal:** Execute Linux kernel entirely on GPU via WebGPU compute shaders

**Target features:**
- RISC-V instruction emulation in WebGPU compute shaders
- LNX bundle loading and kernel execution on GPU
- Memory management with GPU buffer-backed RAM
- Interrupt handling and device emulation

## Requirements

### Validated

- ✓ Vision Analysis Pipeline — v1.0
- ✓ FUSE Bridge for Direct Boot — v1.0
- ✓ Visual Installer Engine — v1.0
- ✓ Visual Catalog Manager — v1.0
- ✓ Desktop Object Integration — v1.1
- ✓ Boot Progress Visualization — v1.1
- ✓ Remote container boot with download progress — v1.2
- ✓ Local caching with hash verification — v1.2
- ✓ Unified local + remote catalog view — v1.2
- ✓ Graceful error handling with retry — v1.2
- ✓ DHCP server for PXE clients — v1.3
- ✓ TFTP server for bootloader delivery — v1.3
- ✓ HTTP container serving with range requests — v1.3
- ✓ iPXE boot menu with customization — v1.3
- ✓ PXE visual shell integration (badge, toggle) — v1.3

### Active

(None — defining v1.4 requirements)

### Future

- **NETWORK-02**: Delta-based OS updates (download only changed bytes)

### Out of Scope

- **Cloud provider integration** — Focus on local/boot scenarios first
- **Mobile apps** — Web/desktop interface only
- **Container formats beyond PNG** — PixelRTS v2 is fixed
- **Full OS installation from scratch** — Building on existing Alpine/Ubuntu bases

## Context

**Existing Codebase:**
- Geometry OS is a large project with PixelRTS v2 as a component
- Primary languages: Python 3.12+, TypeScript/JavaScript, Rust, WGSL
- Located in `systems/pixel_compiler/` for PixelRTS components
- `systems/visual_shell/` for PixiJS desktop environment
- `systems/infinite_map_rs/` has existing RISC-V emulator in Rust
- Uses QEMU for virtualization testing

**Current State:**
- v1.3 shipped: Full PXE boot stack (DHCP, TFTP, HTTP, Menu, Integration)
- 4 new Python server components (~3,658 lines)
- 5 test suites (226 tests)
- Visual shell PXE badge and toggle
- Existing GPU infrastructure: WebGPU compute shaders, WGSL shader code

**Key Files:**
- `systems/visual_shell/web/RTSDesktopObject.js` - Desktop object component (2030 lines)
- `systems/visual_shell/web/CatalogBridge.js` - API client (540 lines)
- `systems/visual_shell/web/DesktopObjectManager.js` - Lifecycle manager (1600+ lines)
- `systems/visual_shell/web/CatalogCacheManager.js` - IndexedDB cache (1340 lines)
- `systems/visual_shell/web/RemoteBootFetcher.js` - Streaming downloads (744 lines)
- `systems/visual_shell/web/ServerSettingsPanel.js` - Settings UI (1100+ lines)
- `systems/pixel_compiler/pxe/dhcp_server.py` - DHCP server (848 lines)
- `systems/pixel_compiler/pxe/tftp_server.py` - TFTP server (750 lines)
- `systems/pixel_compiler/pxe/http_server.py` - HTTP server (662 lines)
- `systems/pixel_compiler/pxe/pxe_cli.py` - CLI interface (754 lines)
- `systems/infinite_map_rs/src/riscv_native/executor.rs` - RISC-V emulator

## Constraints

- **Python 3.12+** - Primary backend language
- **TypeScript/JavaScript** - Visual shell frontend
- **PixiJS v7** - Desktop rendering engine
- **WebGPU** - GPU compute API for shader execution
- **WGSL** - Shader language for GPU kernels
- **QEMU** - Virtualization platform
- **Existing PixelRTS v2 format** - Must maintain backward compatibility
- **Performance** - Boot overhead <10% vs traditional ISO boot

## Key Decisions

| Decision | Rationale | Outcome |
|----------|-----------|---------|
| Use existing PixelRTS v2 format | Leverage invested work, maintain compatibility | ✓ Good |
| FUSE filesystem for direct boot | Clean integration with existing tools | ✓ Shipped v1.0 |
| Vision model for verification | Unique advantage of visual format | ✓ Shipped v1.0 |
| PixiJS v7 for visual shell | Mature 2D WebGL renderer | ✓ Shipped v1.1 |
| REST polling for boot status | Simple, reliable, no WebSocket complexity | ✓ Shipped v1.1 |
| Native IndexedDB for caching | No external dependencies | ✓ Shipped v1.2 |
| Stale-while-revalidate pattern | Responsive UI, fresh data | ✓ Shipped v1.2 |
| Streaming fetch with ReadableStream | True streaming progress | ✓ Shipped v1.2 |
| Exponential backoff retry | Graceful network error handling | ✓ Shipped v1.2 |
| iPXE bootloader for PXE | Supports both BIOS and UEFI via chainload | ✓ Shipped v1.3 |
| asyncio.DatagramProtocol | Async UDP handling for DHCP | ✓ Shipped v1.3 |
| aiohttp.web for HTTP server | Async HTTP with range requests | ✓ Shipped v1.3 |
| PXE badge orange (#ff6600) | Distinguish from other status indicators | ✓ Shipped v1.3 |
| WebGPU compute shaders for RISC-V | Execute kernel on GPU, no CPU emulation | — Pending v1.4 |

---
*Last updated: 2026-02-28 after v1.3 PXE Boot milestone, starting v1.4*
