# PixelRTS Boot Improvement

## What This Is

A transformation of PixelRTS from a novel encoding format into a practical, production-ready OS boot and distribution system. The project improves the existing PixelRTS v2 implementation (PNG-based OS containers with Hilbert curve encoding) to demonstrate real advantages over traditional ISO-based booting.

## Core Value

**Booting an OS should be as visual and intuitive as opening an image file.**

If everything else fails, users must be able to:
1. Drag an `.rts.png` file to boot
2. See what OS they're about to boot (visual preview)
3. Trust the container (vision-based verification)

## Current State

**Shipped:** v1.1 Visual Shell Integration (2026-02-27)

OS containers now live directly on the infinite desktop - boot by clicking, arrange by dragging. Users can:
- See .rts.png files as interactive desktop objects
- Drag-and-drop to arrange containers on infinite canvas
- Boot with a single click and watch real-time progress
- See status indicators and error guidance when boot fails

## Requirements

### Validated

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

✓ **Desktop Object Integration** — v1.1 shipped
  - RTSDesktopObject.js - PIXI.Container sprites with thumbnails
  - Drag-and-drop positioning on infinite canvas
  - Click-to-boot with status indicators
  - Position persistence via CatalogBridge

✓ **Boot Progress Visualization** — v1.1 shipped
  - Progress bar overlay with time-based animation
  - Status polling via /api/v1/catalog/{id}/status
  - Error overlay with actionable guidance (ERROR_GUIDANCE)
  - 30-second boot timeout with 4-stage progress

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
- v1.1 shipped: Desktop objects with boot progress visualization
- Visual shell connects to catalog server via REST API
- PixiJS infinite desktop with drag-and-drop
- Real-time boot status polling

**Key Files:**
- `systems/visual_shell/web/RTSDesktopObject.js` - Desktop object component
- `systems/visual_shell/web/CatalogBridge.js` - API client
- `systems/visual_shell/web/DesktopObjectManager.js` - Lifecycle manager
- `systems/pixel_compiler/catalog/catalog_server.py` - Backend API

## Constraints

- **Python 3.12+** - Primary backend language
- **TypeScript/JavaScript** - Visual shell frontend
- **PixiJS v7** - Desktop rendering engine
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
| Position mapping server→client | position.{x,y} → layout.{gridX,gridY} | ✓ Shipped v1.1 |

---
*Last updated: 2026-02-27 after v1.1 milestone completion*
