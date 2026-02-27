# PixelRTS Boot Improvement

## What This Is

A transformation of PixelRTS from a novel encoding format into a practical, production-ready OS boot and distribution system. The project improves the existing PixelRTS v2 implementation (PNG-based OS containers with Hilbert curve encoding) to demonstrate real advantages over traditional ISO-based booting.

## Core Value

**Booting an OS should be as visual and intuitive as opening an image file.**

If everything else fails, users must be able to:
1. Drag an `.rts.png` file to boot
2. See what OS they're about to boot (visual preview)
3. Trust the container (vision-based verification)

## Current Milestone: v1.1 Visual Shell Integration

**Goal:** Connect PixelRTS catalog to the PixiJS infinite desktop for spatial OS management

**Target features:**
- Display .rts.png files as interactive desktop objects
- Drag-and-drop positioning on infinite canvas
- One-click boot from visual shell
- Real-time boot progress visualization

## Requirements

### Validated (v1.0)

✓ **PixelRTS v2 encoding/decoding** — existing
  - `systems/pixel_compiler/pixelrts_v2_core.py` - PNG ↔ binary conversion
  - Hilbert curve spatial mapping
  - Metadata in PNG tEXt chunks

✓ **Kernel/initrd extraction** — existing
  - `systems/pixel_compiler/pixelrts_v2_extractor.py` - CLI extraction tool
  - JSON/RTS format parsing
  - SHA256 hash verification

✓ **Basic QEMU boot** — existing
  - Direct kernel boot with `-kernel`/`-initrd`
  - Serial console output
  - Disk image support (qcow2)

✓ **Vision Analysis Pipeline** — v1.0 shipped
  - `pixelrts analyze <file.png>` - Vision analysis and verification
  - Kernel version, distro, architecture detection
  - Tamper detection via entropy analysis

✓ **FUSE Bridge for Direct Boot** — v1.0 shipped
  - `pixelrts boot <file.png>` - Boot without extraction
  - FUSE filesystem presents PNG as kernel/initrd
  - <10% overhead with KVM acceleration

✓ **Visual Installer Engine** — v1.0 shipped
  - `pixelrts install <file.png> <target>` - Install to disk
  - Visual progress feedback
  - Hash verification before write

✓ **Visual Catalog Manager** — v1.0 shipped
  - `pixelrts catalog` - Launch visual gallery
  - Thumbnail generation with metadata
  - Drag-and-drop layout persistence

### Active (v1.1)

- [ ] **SHELL-01**: .rts.png files appear as interactive objects on visual shell desktop
- [ ] **SHELL-02**: Users can drag-and-drop OS containers to arrange on infinite canvas
- [ ] **SHELL-03**: One-click boot from visual shell triggers QEMU with visual feedback
- [ ] **SHELL-04**: Boot progress displayed as visual animation on the desktop object

### Future

- **NETWORK-01**: Boot PixelRTS containers over network (PXE/NBD)
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
- Uses QEMU for virtualization testing

**Current State:**
- v1.0 shipped: analyze, boot, install, catalog CLI commands
- Visual shell has WindowManager, DesktopWindow classes
- Catalog server provides REST API with thumbnails
- Both systems exist but are not connected

**The Problem We're Solving:**
The catalog is a separate web UI. Users should manage OS containers directly on the infinite desktop where they work, not in a separate browser tab.

**Key Files:**
- `systems/pixel_compiler/catalog/` - Catalog components (shipped v1.0)
- `systems/visual_shell/web/WindowManager.js` - Desktop window management
- `systems/visual_shell/web/DesktopWindow.js` - Window instances
- `systems/visual_shell/web/display/pixi_renderer.js` - PixiJS rendering

## Constraints

- **Python 3.12+** - Primary backend language
- **TypeScript/JavaScript** - Visual shell frontend
- **PixiJS** - Desktop rendering engine
- **QEMU** - Virtualization platform
- **Existing PixelRTS v2 format** - Must maintain backward compatibility
- **Performance** - Boot overhead <10% vs traditional ISO boot

## Key Decisions

| Decision | Rationale | Outcome |
|----------|-----------|---------|
| Use existing PixelRTS v2 format | Leverage invested work, maintain compatibility | ✓ Good |
| FUSE filesystem for direct boot | Clean integration with existing tools | ✓ Shipped v1.0 |
| Vision model for verification | Unique advantage of visual format | ✓ Shipped v1.0 |
| PixiJS for visual shell | Mature 2D WebGL renderer | ✓ Existing |
| WebSocket for boot progress | Real-time updates without polling | — Pending |

---
*Last updated: 2026-02-27 for milestone v1.1*
