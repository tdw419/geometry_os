# Feature Research

**Domain:** Vision-based OS Boot System (PixelRTS v2 Enhancement)
**Researched:** 2026-02-11 (updated 2026-02-27)
**Confidence:** HIGH (codebase-verified for visual shell integration)

---

## Part 1: Core PixelRTS Features (Original Research)

### Table Stakes (Users Expect These)

Features users assume exist. Missing these = product feels incomplete.

| Feature | Why Expected | Complexity | Notes |
|---------|--------------|------------|-------|
| **One-command boot** | Users expect to launch OS from a file without manual extraction steps | MEDIUM | Competitors like Ventoy offer drag-and-drop ISO booting; extraction friction is a non-starter |
| **Visual OS identification** | Users need to know which OS they're about to boot before committing | LOW | rEFInd, GRUB themes show OS icons; text-only menus feel dated |
| **Boot verification** | Security-conscious users expect verification that boot media hasn't been tampered with | HIGH | SHA256 checksums are standard; Secure Boot is expected on modern systems |
| **Progress feedback** | Installation/boot operations taking >1 second must show progress | LOW | UX best practice: show progress for operations exceeding 1 second |
| **Error handling** | Clear error messages when boot fails; no silent failures | MEDIUM | Users need actionable feedback when boot doesn't work |
| **Multi-format support** | Support for common OS image formats (ISO, embedded kernels) | HIGH | Ventoy supports ISO/WIM/IMG/VHD/EFI; single-format limits utility |
| **Metadata display** | Show kernel version, distro name, architecture at boot time | LOW | Standard in GRUB/rEFInd boot menus; critical for multi-OS setups |
| **Dual boot (UEFI/Legacy)** | Support both modern UEFI and legacy BIOS boot modes | HIGH | Ventoy, Rufus both support dual-mode partitioning; essential for compatibility |

### Differentiators (Competitive Advantage)

Features that set the product apart. Not required, but valuable.

| Feature | Value Proposition | Complexity | Notes |
|---------|-------------------|------------|-------|
| **Vision-based OS identification** | Identifies kernel/distro/architecture from visual patterns in PNG - no parsing required | HIGH | Unique to PixelRTS visual encoding; competitors use filesystem parsing |
| **Vision-based tamper detection** | Detects corruption/tampering by analyzing visual entropy patterns in PNG | HIGH | Leveraging visual format for security; traditional tools can't do this |
| **Direct PNG boot without extraction** | Boot directly from .rts.png using FUSE/VFS layer - no intermediate files | HIGH | Ventoy/ISO tools still need extraction or loop mounts; this is truly seamless |
| **Spatial OS catalog** | Visual gallery where OS containers appear as thumbnails in spatial arrangement | MEDIUM | Inspired by rEFInd but more immersive; plays to "opening an image" metaphor |
| **Delta updates via visual diff** | Download only changed pixels/regions for OS updates using visual comparison | HIGH | Bandwidth-efficient; unique advantage of 2D visual encoding |
| **Drag-and-boot to any device** | Universal boot - same .rts.png works on USB, network, cloud, local disk | MEDIUM | Portability beyond traditional ISO limitations |
| **Visual entropy heatmap** | Shows data density/entropy overlay for forensic analysis of OS containers | LOW | Educational/debugging value; demonstrates unique properties of visual encoding |
| **Boot-time visualization** | Show the OS "loading" visually as pixels fill in (thermographic effect) | LOW | Delightful UX that reinforces visual metaphor; technical novelty |
| **Single-file multiboot** | Store multiple bootable OS variants in single PNG using metadata tags | MEDIUM | Ventoy requires filesystem; this enables single-image multiboot |

### Anti-Features (Commonly Requested, Often Problematic)

Features that seem good but create problems.

| Feature | Why Requested | Why Problematic | Alternative |
|---------|---------------|-----------------|-------------|
| **Real-time conversion** | Users want to "convert ISO to PNG on the fly" | Adds latency, complexity, and potential data loss; breaks "single source of truth" principle | Provide simple CLI tool `pixelrt-convert` that users run once; keeps format deterministic |
| **PNG image editor compatibility** | "Open in Photoshop to edit kernel" | Fundamental misunderstanding - visual encoding is not human-editable like layers | Provide dedicated visual analyzer that shows structure, not pixel editor |
| **Video codec boot** | "Boot from MP4/WebM container" | Video codecs are lossy and frame-based; destroys data integrity | Stick to PNG (lossless) for data integrity; could use video for marketing/demos |
| **Social sharing of boot images** | "Tweet my OS image" | Large file sizes (10-100MB), privacy concerns, little actual utility | Provide thumbnail generation for catalog/sharing metadata only |
| **Live modification during boot** | "Edit kernel while booted from PNG" | Requires complex overlay filesystem, breaks verification model | Use FUSE for read-only boot; provide separate installation workflow for persistent changes |
| **Auto-update from network** | "Always download latest OS version on boot" | Breaks reproducibility, security risk, potential for forced updates | Explicit update command that shows changes; user maintains control |
| **Compression optimization** | "Use WebP/AVIF for smaller files" | Lossy formats corrupt binary data; added codec dependencies | PNG is sufficient; focus on efficient encoding (Hilbert curve, RGBA packing) |
| **Multiple filesystem support in PNG** | "Store ext4, FAT32, NTFS in same PNG" | Violates single-responsibility principle; mounting complexity explodes | One kernel/initrd per PNG; use catalog for multi-OS management |

---

## Part 2: Visual Shell Integration (Subsequent Milestone)

**Focus:** Connect PixelRTS catalog to PixiJS infinite desktop
**Use Cases:** Display OS containers as visual objects, drag-and-drop arrangement, one-click boot with visual feedback

### Table Stakes for Visual Shell (Users Expect These)

| Feature | Why Expected | Complexity | Notes |
|---------|--------------|------------|-------|
| **Visual Container Display** | Users expect to SEE their containers as visual objects, not just CLI entries | LOW | Already implemented in SpatialCatalog with thumbnail sprites |
| **Drag-and-Drop Arrangement** | Standard desktop paradigm - users expect to organize by dragging | MEDIUM | Partially implemented; needs full drag event handling |
| **One-Click Boot** | "Double-click to open" is the universal desktop convention | MEDIUM | API endpoint exists; needs UI wiring in catalog view |
| **Boot Progress Indicator** | Users need feedback during long operations (>1 second) | LOW | LoadingIndicator component exists; needs boot-specific states |
| **Status Visualization** | Users expect visual status (running/stopped/error) | MEDIUM | Requires state polling or WebSocket updates |
| **Metadata Display** | Users want to see what they're booting before clicking | LOW | Already implemented: distro, kernel, architecture labels |
| **Context Menu** | Right-click for actions is standard desktop pattern | MEDIUM | Needs implementation for boot/configure/delete options |
| **Zoom/Pan Navigation** | Infinite canvas must support standard navigation | LOW | ViewportManager already handles this |

### Differentiators for Visual Shell (Competitive Advantage)

| Feature | Value Proposition | Complexity | Notes |
|---------|-------------------|------------|-------|
| **Proximity-Based Boot** | Boot by "approaching" in 3D space - unique spatial interaction | HIGH | VisualBootLoader has framework; needs spatial-to-boot wiring |
| **Live Texture Swap** | See live VM output IN the catalog view, not separate window | HIGH | Requires VNC/WebSocket framebuffer streaming |
| **Spatial Persistence** | Container arrangement persists across sessions | LOW | SpatialLayoutManager already saves to `~/.rts/catalog_layout.json` |
| **Thermographic Boot Visualization** | Watch OS "load" as pixels fill in during boot | HIGH | Differentiator for visual boot experience |
| **Visual Entropy Heatmap** | Forensic overlay for security analysis | MEDIUM | Exists in codebase; could apply to boot containers |
| **Multi-Container Orchestration** | Drag containers near each other to create clusters/networks | HIGH | Unique spatial networking concept |
| **Real-Time Resource Display** | CPU/RAM usage visualized on container sprite | MEDIUM | Would require backend metrics streaming |
| **Snapshot Thumbnails** | Visual diff showing container state changes | HIGH | Leverages existing vision analysis infrastructure |

### Anti-Features for Visual Shell (Commonly Requested, Often Problematic)

| Feature | Why Requested | Why Problematic | Alternative |
|---------|---------------|-----------------|-------------|
| **Real-Time Container Editing** | "Edit container config visually" | Breaks verification model; creates hidden state | Explicit "Edit Mode" with save/commit workflow |
| **Auto-Boot on Hover** | "Boot when I look at it" | Too easy to accidentally boot; resource waste | Proximity arming + explicit confirm (double-click or Enter) |
| **Nested Container View** | "Show containers inside containers" | Infinite complexity; navigation confusion | Flat catalog with grouping/filtering; tags instead of nesting |
| **Social Container Sharing** | "Share my container setup" | Large file sizes (10-100MB); privacy concerns | Export config file; share separately from runtime |
| **Live Container Modification** | "Modify running container visually" | Requires complex overlay; breaks reproducibility | Immutable containers; derive new container from running state |
| **Drag-to-Resize Containers** | "Make this container bigger" | Confuses visual size with resource allocation | Explicit resource panel; visual size is display-only |
| **Auto-Arrange Grid** | "Organize my containers for me" | Loses spatial meaning user created | Manual arrangement with optional snap-to-grid helper |
| **Real-Time Collaboration** | "See others' cursors on canvas" | Adds WebSocket complexity; low value for single-user | Consider for future multi-user version |

---

## Feature Dependencies

### Core PixelRTS Dependencies

```
[Vision-based OS identification]
    └──requires──> [PixelRTS v2 encoding]
                       └──requires──> [Hilbert curve LUT generation]

[Vision-based tamper detection]
    └──requires──> [Vision-based OS identification]
                       └──enhances──> [Boot verification]

[Direct PNG boot without extraction]
    └──requires──> [FUSE/VFS layer implementation]
                       └──requires──> [PixelRTS v2 decoder]

[Spatial OS catalog]
    └──requires──> [Vision-based OS identification]
    └──requires──> [Thumbnail generation]
    └──enhances──> [One-command boot]

[Delta updates via visual diff]
    └──requires──> [PixelRTS v2 chunk-based encoding]
    └──requires──> [Region comparison algorithm]

[Multi-format support]
    └──conflicts──> [Single PNG format focus]
```

### Visual Shell Integration Dependencies

```
[Visual Container Display]
    └──requires──> [Thumbnail Generation] (already complete)
    └──requires──> [SpatialCatalog Component] (already complete)

[One-Click Boot]
    └──requires──> [Boot API Endpoint] (already complete)
    └──requires──> [Boot Progress Indicator]
    └──requires──> [Status Visualization]

[Drag-and-Drop Arrangement]
    └──requires──> [Spatial Layout Persistence] (already complete)
    └──requires──> [Drag Event Handlers]

[Live Texture Display]
    └──requires──> [VNC/WebSocket Bridge]
    └──requires──> [Texture Swap Mechanism]
    └──requires──> [One-Click Boot] (must boot first to get live texture)

[Proximity-Based Boot]
    └──requires──> [VisualBootLoader] (framework exists)
    └──requires──> [Camera Position Tracking]
    └──conflicts──> [One-Click Boot] (different interaction models; pick one primary)

[Context Menu]
    └──requires──> [DesktopWindow Component] (exists)
    └──enhances──> [One-Click Boot] (alternative trigger)
```

### Dependency Notes

**Core PixelRTS:**
- **Vision-based OS identification requires PixelRTS v2 encoding**: The visual patterns are only meaningful if we control the encoding method
- **Vision-based tamper detection enhances Boot verification**: Adds visual analysis layer to traditional cryptographic verification
- **Spatial OS catalog enhances One-command boot**: Makes visual selection easier, but boot can work without it
- **Multi-format support conflicts with Single PNG format focus**: Supporting ISO/WIM/etc dilutes the unique value proposition; keep format opinionated

**Visual Shell Integration:**
- **One-Click Boot requires Boot Progress Indicator:** Users clicking boot need feedback; >1s operations without feedback feel broken
- **Live Texture Display requires VNC Bridge:** Must establish framebuffer connection to display live VM output
- **Proximity-Based Boot conflicts with One-Click Boot:** Both are boot triggers; proximity is unique differentiator, click is table stakes. Recommend: Click is primary, proximity is optional mode.
- **Context Menu enhances One-Click Boot:** Provides alternative boot path with more options (boot with config, delete, etc.)

---

## MVP Definition

### Core PixelRTS v1 (Complete)

- [x] **Vision-based OS identification** — Core differentiator; demonstrates why visual format matters
- [x] **Direct PNG boot without extraction** — Removes friction; delivers on "drag to boot" promise
- [x] **Basic boot verification (SHA256)** — Table stakes for any boot system
- [x] **Progress feedback during boot** — UX requirement; prevents "is it working?" uncertainty
- [x] **Metadata display (kernel/distro/arch)** — Users need to know what they're booting

### Visual Shell Integration v1 (Subsequent Milestone)

Minimum viable integration — what's needed to connect catalog to desktop.

- [x] **Visual Container Display** — SpatialCatalog already renders thumbnails as PixiJS sprites
- [x] **Metadata Display** — Distro, kernel, architecture labels shown on hover
- [x] **Spatial Layout Persistence** — Positions saved to `~/.rts/catalog_layout.json`
- [ ] **Drag-and-Drop Arrangement** — Full drag event handling (partially implemented)
- [ ] **One-Click Boot** — Wire sprite click to boot API endpoint
- [ ] **Boot Progress Indicator** — Show LoadingIndicator during boot operation
- [ ] **Status Visualization** — Visual distinction for running/stopped/error states
- [ ] **Context Menu** — Right-click menu with boot/configure/delete options

### Add After Validation (v1.x)

Features to add once core integration is working.

- [ ] **Live Texture Display** — Show live VM output in container sprite after boot
- [ ] **Real-Time Resource Display** — CPU/RAM usage overlay on running containers
- [ ] **Proximity Boot Mode** — Optional spatial boot trigger
- [ ] **Multi-Container Selection** — Shift+click to select multiple, batch operations
- [ ] **Container Grouping** — Visual grouping/labeling of related containers
- [ ] **Vision-based tamper detection** — Advanced security; validates unique visual approach
- [ ] **Delta updates** — Efficiency play; unique advantage of 2D encoding
- [ ] **Dual boot (UEFI/Legacy)** — Broadens compatibility; needed for production use

### Future Consideration (v2+)

Features to defer until product-market fit is established.

- [ ] **Thermographic Boot Visualization** — Delightful but not essential
- [ ] **Visual Networking** — Drag containers near each other to create networks
- [ ] **Snapshot Thumbnails** — Visual diff of container state changes
- [ ] **Multi-User Collaboration** — Shared canvas with cursor presence
- [ ] **Network boot (PXE/NBD)** — Infrastructure complexity; defer until core works locally
- [ ] **Single-file multiboot** — Interesting but complex; validate single-OS use first

---

## Feature Prioritization Matrix

### Core PixelRTS

| Feature | User Value | Implementation Cost | Priority | Status |
|---------|------------|---------------------|----------|--------|
| Vision-based OS identification | HIGH | HIGH | P1 | Complete |
| Direct PNG boot without extraction | HIGH | HIGH | P1 | Complete |
| Basic boot verification (SHA256) | HIGH | LOW | P1 | Complete |
| Progress feedback during boot | MEDIUM | LOW | P1 | Complete |
| Metadata display | HIGH | LOW | P1 | Complete |
| Vision-based tamper detection | HIGH | HIGH | P2 | Deferred |
| Spatial OS catalog with thumbnails | MEDIUM | MEDIUM | P2 | Complete |
| Dual boot (UEFI/Legacy) | HIGH | HIGH | P2 | Deferred |
| Delta updates | MEDIUM | HIGH | P2 | Deferred |
| Boot-time visualization | LOW | MEDIUM | P3 | Deferred |
| Visual entropy heatmap | LOW | LOW | P3 | Deferred |

### Visual Shell Integration

| Feature | User Value | Implementation Cost | Priority | Status |
|---------|------------|---------------------|----------|--------|
| One-Click Boot | HIGH | LOW | P1 | Pending |
| Boot Progress Indicator | HIGH | LOW | P1 | Pending |
| Drag-and-Drop Arrangement | HIGH | MEDIUM | P1 | Partial |
| Status Visualization | HIGH | MEDIUM | P1 | Pending |
| Context Menu | MEDIUM | MEDIUM | P2 | Pending |
| Live Texture Display | HIGH | HIGH | P2 | Pending |
| Real-Time Resource Display | MEDIUM | MEDIUM | P2 | Pending |
| Proximity Boot Mode | MEDIUM | MEDIUM | P3 | Pending |
| Multi-Container Selection | MEDIUM | MEDIUM | P3 | Pending |
| Thermographic Boot Visualization | LOW | HIGH | P3 | Pending |

**Priority key:**
- P1: Must have for launch (MVP)
- P2: Should have, add when possible
- P3: Nice to have, future consideration

---

## Existing Implementation Status

Based on codebase analysis, these components already exist:

| Component | File | Status |
|-----------|------|--------|
| SpatialCatalog | `systems/visual_shell/web/spatial_catalog.js` | Implemented - renders thumbnails, handles hover |
| VisualBootLoader | `systems/visual_shell/web/visual_boot_loader.js` | Framework exists - proximity boot concept |
| LoadingIndicator | `systems/visual_shell/web/loading_indicator.js` | Implemented - animated spinner with message |
| WindowManager | `systems/visual_shell/web/WindowManager.js` | Implemented - window creation/management |
| DesktopWindow | `systems/visual_shell/web/DesktopWindow.js` | Implemented - draggable window component |
| CatalogScanner | `systems/pixel_compiler/catalog/catalog_scanner.py` | Implemented - discovers .rts.png files |
| CatalogServer API | Phase 4 complete | Implemented - `/api/v1/catalog`, boot endpoints |
| SpatialLayoutManager | Phase 4 complete | Implemented - persists layout to JSON |
| InfiniteMap | `systems/visual_shell/web/infinite_map.js` | Implemented - infinite canvas with tiles |
| ViewportManager | `systems/visual_shell/web/viewport_manager.js` | Implemented - pan/zoom controls |

---

## Expected Behavior Patterns

### Visual Container Management (Industry Standard)

1. **Thumbnail Grid View** — Containers displayed as visual cards in grid layout
2. **Hover for Details** — Mouse hover reveals metadata without clicking
3. **Click to Select** — Single click selects container (shows detail panel)
4. **Double-Click to Open/Boot** — Double-click triggers primary action
5. **Right-Click for Context Menu** — Alternative actions available via menu
6. **Drag to Reorganize** — Drag-drop for spatial arrangement
7. **Visual Status Indicators** — Color/border indicates running/stopped/error
8. **Progress Feedback** — Loading spinners/progress bars for operations

### Geometry OS Specific Patterns

1. **Spatial Navigation** — Pan/zoom to navigate infinite canvas
2. **Proximity Interactions** — Approaching containers can trigger actions (optional mode)
3. **Infinite Canvas** — No fixed grid; containers placed anywhere
4. **Texture Swapping** — Static thumbnail becomes live VM output when running
5. **Spatial Persistence** — Arrangement saved and restored across sessions

---

## Competitor Feature Analysis

| Feature | Ventoy | Rufus | rEFInd | GRUB | Our Approach |
|---------|--------|-------|--------|------|--------------|
| **Multi-format support** | ISO/WIM/IMG/VHD/EFI | ISO only | EFI only | Multiple | PNG only (opinionated) |
| **Multiboot from single file** | Multiple ISOs on USB | Single ISO | Multiple entries | Multiple entries | Single PNG, multi-OS via metadata |
| **Visual boot menu** | Basic text menu | No menu | ★★★★★ GUI | ★★★☆☆ themed | ★★★★★ Visual-first |
| **OS identification** | Filename-based | User-selected | Icon-based | Text-based | Vision-based (visual patterns) |
| **Tamper detection** | None | None | None | None | Visual entropy analysis |
| **Direct boot without extraction** | Yes (FAT partition) | No (writes to USB) | Yes (EFI) | Yes | Yes (FUSE from PNG) |
| **Progress feedback** | Boot-time console | Write progress | None | None | Visual progress + console |
| **Updates** | Replace ISO files | Re-create USB | Update entries | Update config | Delta updates via visual diff |
| **Cross-platform** | Windows/Linux | Windows only | Any OS with UEFI | Linux mostly | Any OS with PNG/FUSE support |
| **Visual shell integration** | None | None | None | None | Infinite canvas with drag-drop |

---

## Sources

### Boot Manager & Visual Features
- [rEFInd Boot Manager](https://www.rodsbooks.com/refind/) - Visual boot manager with GUI, themes, icons
- [GRUB Themes Collection](https://www.gnome-look.org/browse?cat=109&order=latest) - Community themes for GRUB
- [Ventoy Official Documentation](https://www.ventoy.net/en/doc_start.html) - Multi-boot USB with visual menu
- [Ventoy Features Comparison](https://www.ventoy.net/en/doc_vtip.html) - Feature comparisons with other tools

### Boot Security & Verification
- [UEFI Secure Boot](https://uefi.org/specifications) - Industry standard for boot verification
- [wolfBoot Verified Boot](https://github.com/wolfSSL/wolfBoot) - Open-source secure bootloader

### Installer UX Best Practices
- [Nielsen Norman Group - Progress Indicators](https://www.nngroup.com/articles/progress-indicators-use-cases/) - UX best practices for progress feedback
- [Material Design Progress Indicators](https://material.io/components/progress-indicators) - Design guidelines

### FUSE & Boot Integration
- [Booting Linux from FUSE Filesystem (Ersei, July 2024)](https://ersei.net/en/blog/fuse-boot) - Proof of concept for FUSE-based booting
- [QEMU FUSE Block Export](https://www.qemu.org/docs/master/tools/qemu-storage-daemon.html) - FUSE integration for virtual images

### Codebase Analysis
- `systems/visual_shell/web/spatial_catalog.js` - Catalog UI implementation
- `systems/visual_shell/web/visual_boot_loader.js` - Boot interaction framework
- `systems/visual_shell/web/DesktopWindow.js` - Window component
- `systems/visual_shell/web/WindowManager.js` - Window management
- `systems/visual_shell/web/loading_indicator.js` - Progress indicator
- `systems/pixel_compiler/catalog/catalog_scanner.py` - Catalog backend
- `.planning/milestones/v1.0-pixelrts-boot-improvement-REQUIREMENTS.md` - Requirements traceability
- `.planning/phases/04-visual-catalog-manager/04-VERIFICATION.md` - Phase 4 verification

---
*Feature research for: Vision-based OS Boot System + Visual Shell Integration*
*Originally researched: 2026-02-11*
*Updated with visual shell integration: 2026-02-27*
