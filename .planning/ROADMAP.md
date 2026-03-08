# Roadmap: PixelRTS v1.1 Visual Diff

## Milestones

- ✅ **v1.0 PixelRTS Boot** — Phases 1-4 (shipped 2026-03-08)
- 🚧 **v1.1 Visual Diff** — Phase 5 (in progress)

## Phases

<details>
<summary>✅ v1.0 PixelRTS Boot (Phases 1-4) — SHIPPED 2026-03-08</summary>

- [x] Phase 1: Vision Analysis Pipeline (8/8 plans) — completed 2026-02-14
- [x] Phase 2: FUSE Bridge for Direct Boot (6/6 plans) — completed 2026-02-14
- [x] Phase 3: Visual Installer Engine (4/4 plans) — completed 2026-02-15
- [x] Phase 4: Visual Catalog Manager (4/4 plans) — completed 2026-02-17

See: `.planning/milestones/v1.0-ROADMAP.md` for full details.

</details>

### Phase 5: Visual Diff Engine

**Goal**: Users can compare two .rts.png files and see visual diff of changes

**Depends on**: Phase 1 (existing PixelRTS v2 encoding)

**Requirements**: VISUAL-01, VISUAL-02, VISUAL-03, VISUAL-04

**Success Criteria** (what must be TRUE):
1. User can run `pixelrts diff old.rts.png new.rts.png` and see visual comparison
2. Diff highlights changed pixel regions in the Hilbert-encoded space
3. Byte-level statistics show added, removed, and changed bytes
4. Output works in both terminal (text stats) and browser (visual overlay)

**Plans**: 4 tasks
- [ ] 05-01: PixelRtsDiff core class
- [ ] 05-02: Hilbert region highlighter
- [ ] 05-03: Byte statistics calculator
- [ ] 05-04: CLI diff command

## Progress

| Phase | Milestone | Plans Complete | Status | Completed |
|-------|-----------|----------------|--------|-----------|
| 1. Vision Analysis Pipeline | v1.0 | 8/8 | Complete | 2026-02-14 |
| 2. FUSE Bridge | v1.0 | 6/6 | Complete | 2026-02-14 |
| 3. Visual Installer Engine | v1.0 | 4/4 | Complete | 2026-02-15 |
| 4. Visual Catalog Manager | v1.0 | 4/4 | Complete | 2026-02-17 |
| 5. Visual Diff Engine | v1.1 | 0/4 | Not started | - |

---
*Ready to plan: `/gsd:plan-phase 5`*
