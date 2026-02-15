# Roadmap: PixelRTS Boot Improvement

## Overview

PixelRTS Boot Improvement transforms PixelRTS from a novel encoding format into a practical, production-ready OS boot and distribution system. The roadmap progresses from demonstrating PixelRTS's unique visual analysis advantage (Phase 1), to enabling direct PNG booting without extraction (Phase 2), to practical applications with visual installer (Phase 3), and finally to a polished visual catalog experience (Phase 4). Each phase builds on the previous, culminating in a system where booting an OS is as visual and intuitive as opening an image file.

## Phases

**Phase Numbering:**
- Integer phases (1, 2, 3, 4): Planned milestone work
- Decimal phases (2.1, 2.2): Urgent insertions (marked with INSERTED)

Decimal phases appear between their surrounding integers in numeric order.

- [x] **Phase 1: Vision Analysis Pipeline** - Demonstrates PixelRTS unique differentiator
- [x] **Phase 2: FUSE Bridge for Direct Boot** - Enables direct PNG booting without extraction
- [ ] **Phase 3: Visual Installer Engine** - Practical OS installation from .rts.png
- [ ] **Phase 4: Visual Catalog Manager** - Complete visual OS management experience

## Phase Details

### Phase 1: Vision Analysis Pipeline COMPLETE

**Goal**: Users can identify and verify OS containers through visual analysis before booting

**Depends on**: Nothing (first phase)

**Requirements**: VISION-01, VISION-02, VISION-03, VISION-04, VERIFY-01, VERIFY-02, VERIFY-03, UX-02, INTEGRATION-01, INTEGRATION-03

**Success Criteria** (what must be TRUE):
1. User can view OS metadata (kernel version, distro, architecture) from a .rts.png file before booting
2. User receives verification confirmation that the .rts.png container has not been tampered with or corrupted
3. Verification failure prevents boot and displays clear error message with actionable guidance
4. CLI tool `pixelrts analyze <file.png>` returns OS identification and verification results

**Plans**: 8 tasks completed
- [x] Task 1: Web demo foundation
- [x] Task 2: Boot container function
- [x] Task 3: OCR verification loop
- [x] Task 4: UI integration
- [x] Task 5: CLI wrapper
- [x] Task 6: CLI entry point
- [x] Task 7: Integration tests
- [x] Task 8: Project state update

**Completed**: 2026-02-14

### Phase 2: FUSE Bridge for Direct Boot COMPLETE

**Goal**: Users can boot .rts.png files directly without manual extraction steps

**Depends on**: Phase 1

**Requirements**: DIRECT-01, DIRECT-02, DIRECT-03, DIRECT-04, UX-01, UX-03, INTEGRATION-02

**Success Criteria** (what must be TRUE):
1. User can boot any .rts.png file with single command `pixelrts boot <file.png>` without manual extraction
2. FUSE filesystem presents kernel and initrd as readable files at predictable mount points
3. Boot completes with less than 10% overhead compared to traditional ISO boot method
4. Boot progress is displayed visually during operations that take longer than 1 second
5. FUSE mount properly cleans up after boot completes or fails (no resource leaks)

**Plans**: 6 plans completed
- [x] 02-01 - FUSE mount lifecycle (MountHelper class)
- [x] 02-02 - Boot orchestration (BootBridge class)
- [x] 02-03 - Visual progress display (BootProgress)
- [x] 02-04 - Progress integration into BootBridge
- [x] 02-05 - CLI boot subcommand (`pixelrts boot`)
- [x] 02-06 - Unit tests (36 passing)

**Completed**: 2026-02-14

### Phase 3: Visual Installer Engine

**Goal**: Users can install an OS from .rts.png to disk with visual progress feedback

**Depends on**: Phase 2

**Requirements**: INSTALL-01

**Success Criteria** (what must be TRUE):
1. User can install an OS to disk with single command `pixelrts install <file.png> <target>`
2. Installation progress is displayed visually with percentage complete and current operation
3. Installation verifies container integrity before writing to disk
4. Installation can be cancelled safely with partial cleanup

**Plans**: 4 plans
- [ ] 03-01 - Foundation components (InstallProgress, DiskWriter)
- [ ] 03-02 - InstallEngine orchestrator class
- [ ] 03-03 - CLI install subcommand and unit tests
- [ ] 03-04 - Human verification of install flow

### Phase 4: Visual Catalog Manager

**Goal**: Users can browse and boot OS containers from a visual thumbnail gallery

**Depends on**: Phase 3

**Requirements**: Future v1.x requirements (CATALOG-*)

**Success Criteria** (what must be TRUE):
1. User can view all discovered .rts.png files as visual thumbnails in gallery view
2. User can boot any OS from catalog with single click
3. Catalog displays OS metadata (kernel version, distro) with each thumbnail
4. Catalog supports spatial arrangement with drag-to-reorganize

**Plans**: TBD

## Progress

**Execution Order:**
Phases execute in numeric order: 1 -> 2 -> 3 -> 4

| Phase | Plans Complete | Status | Completed |
|-------|----------------|--------|-----------|
| 1. Vision Analysis Pipeline | 8/8 | Complete | 2026-02-14 |
| 2. FUSE Bridge for Direct Boot | 6/6 | Complete | 2026-02-14 |
| 3. Visual Installer Engine | 0/4 | Not started | - |
| 4. Visual Catalog Manager | 0/TBD | Not started | - |
