# Roadmap: Visual Shell Integration

## Shipped Milestones

### v1.0: PixelRTS Boot Improvement ✅ SHIPPED 2026-02-27

4 phases, 23 plans, 19 requirements. See [milestones/v1.0-pixelrts-boot-improvement-ROADMAP.md](milestones/v1.0-pixelrts-boot-improvement-ROADMAP.md)

**Delivered:**
- Vision Analysis Pipeline (analyze OS from PNG visuals)
- FUSE Bridge (boot PNG directly without extraction)
- Visual Installer Engine (install to disk with progress)
- Visual Catalog Manager (thumbnail gallery with one-click boot)

**CLI Commands:** `pixelrts analyze|boot|install|catalog`

---

## Active Development

### v1.1: Visual Shell Integration

**Goal:** Connect PixelRTS catalog to PixiJS infinite desktop for spatial OS management

**Started:** 2026-02-27

## Phases

### Phase 5: Desktop Object Integration

**Goal**: Users can see and interact with .rts.png containers as desktop objects

**Depends on**: v1.0 (Visual Catalog Manager)

**Requirements**: DESKTOP-01, DESKTOP-02, DESKTOP-03, DESKTOP-04, BOOT-04

**Plans:**
- [ ] 05-01-PLAN.md — Visual foundation (RTSDesktopObject, CatalogBridge, DesktopObjectManager)
- [ ] 05-02-PLAN.md — Interaction (drag-and-drop, click-to-boot with status)

**Success Criteria:**
1. User opens visual shell and sees .rts.png files as draggable sprites
2. User drags container to new position and position persists after refresh
3. User clicks container and sees metadata tooltip (distro, kernel, arch)
4. User double-clicks container and boot sequence initiates
5. User returns next session and containers are in same positions

**Research flags:**
- Canvas performance: implement visibility culling if >50 objects
- WebSocket state: add reconnection state machine

### Phase 6: Boot Progress Integration

**Goal**: Users see real-time boot progress and status for desktop containers

**Depends on**: Phase 5

**Requirements**: BOOT-01, BOOT-02, BOOT-03

**Success Criteria:**
1. User sees progress bar when booting container (>1s operation)
2. User sees visual status indicator (running=green, stopped=gray, error=red)
3. User sees error message with actionable guidance when boot fails
4. User can distinguish booting/running/stopped/error states visually

**Research flags:**
- QEMU orphaning: implement PID tracking and session timeout
- Boot stages: define explicit markers for progress correlation

---

## Progress

| Phase | Status | Plans | Goal |
|-------|--------|-------|------|
| 5 | Planning | 2 | Desktop Object Integration |
| 6 | Not Started | 0 | Boot Progress Integration |

**Total:** 2 phases, 8 requirements

---

*Last updated: 2026-02-27*
