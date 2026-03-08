# Roadmap: PixelRTS

## Milestones

- ✅ **v1.0 PixelRTS Boot** — Phases 1-4 (shipped 2026-03-08)
- ✅ **v1.1 Visual Diff** — Phase 5 (shipped 2026-03-08)
- 📋 **v1.2 Network Boot** — Planned (PXE/NBD boot, delta updates)

## Phases

<details>
<summary>✅ v1.0 PixelRTS Boot (Phases 1-4) — SHIPPED 2026-03-08</summary>

- [x] Phase 1: Vision Analysis Pipeline (8/8 plans)
- [x] Phase 2: FUSE Bridge for Direct Boot (6/6 plans)
- [x] Phase 3: Visual Installer Engine (4/4 plans)
- [x] Phase 4: Visual Catalog Manager (4/4 plans)

See: `.planning/milestones/v1.0-ROADMAP.md` for full details.

</details>

<details>
<summary>✅ v1.1 Visual Diff (Phase 5) — SHIPPED 2026-03-08</summary>

- [x] Phase 5: Visual Diff Engine (4/4 plans)

**Key features:**
- `pixelrts diff <old> <new>` command
- Byte-level comparison with Hilbert region highlighting
- RGBA channel breakdown
- Rich terminal output with JSON export

See: `.planning/milestones/v1.1-ROADMAP.md` for full details.

</details>

## 📋 v1.2 Network Boot (Planned)

Future phases for network boot capabilities:

- **Phase 6**: PXE/NBD Boot - Boot PixelRTS containers over network
- **Phase 7**: Delta Updates - Download only changed bytes for OS updates

## Progress

| Phase | Milestone | Plans Complete | Status | Completed |
|-------|-----------|----------------|--------|-----------|
| 1. Vision Analysis Pipeline | v1.0 | 8/8 | Complete | 2026-02-14 |
| 2. FUSE Bridge | v1.0 | 6/6 | Complete | 2026-02-14 |
| 3. Visual Installer Engine | v1.0 | 4/4 | Complete | 2026-02-15 |
| 4. Visual Catalog Manager | v1.0 | 4/4 | Complete | 2026-02-17 |
| 5. Visual Diff Engine | v1.1 | 4/4 | Complete | 2026-03-08 |

---

*Ready for v1.2 planning: `/gsd:new-milestone`*
