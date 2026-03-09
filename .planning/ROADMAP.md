# Roadmap: PixelRTS

## Milestones

- **v1.0 MVP** - Phases 1-4 (shipped 2026-03-08)
- **v1.1 Visual Diff** - Phase 5 (shipped 2026-03-08)
- **v1.2 Network Boot** - Phases 6-8.1 (shipped 2026-03-09)
- **v1.3 Multi-Boot** - Phases 9-11 (shipped 2026-03-09)
- **v1.4 Live Snapshots** - Phases 12-14 (shipped 2026-03-09)
- **v1.5 Commit to File** - Phases 15-17 (shipped 2026-03-09) — [Archive](milestones/v1.5-ROADMAP.md)

## Current Status

**Milestone v1.6: Ephemeral Boot**

### Phase 18: Ephemeral Boot

**Goal**: Users can boot containers with `--ephemeral` flag to discard changes on exit.
**Requirements**: EPHEM-01, EPHEM-02, EPHEM-03, EPHEM-04, EPHEM-05, EPHEM-06, EPHEM-07, EPHEM-08
**Plans**: 8 plans

Plans:
- [ ] 18-01-PLAN.md — EphemeralBooter class with temp file management
- [ ] 18-02-PLAN.md — ContainerInfo ephemeral tracking
- [ ] 18-03-PLAN.md — CLI --ephemeral flag for single boot
- [ ] 18-04-PLAN.md — Multi-boot ephemeral support
- [ ] 18-05-PLAN.md — ps command [E] indicator
- [ ] 18-06-PLAN.md — Crash cleanup via atexit/signal handlers
- [ ] 18-07-PLAN.md — Commit support for ephemeral containers
- [ ] 18-08-PLAN.md — End-to-end verification checkpoint

**Success criteria**:
1. `pixelrts boot --ephemeral file.rts.png` starts container
2. Changes made inside container are NOT written to original file
3. Container exits cleanly with no leftover temp files
4. `pixelrts ps` shows `[E]` indicator for ephemeral containers
5. Ephemeral works with multi-boot
6. Ephemeral works with vm-snapshot type
7. Crash cleanup removes temp files
8. `pixelrts commit` can save ephemeral changes before exit

---

*Last updated: 2026-03-09*
