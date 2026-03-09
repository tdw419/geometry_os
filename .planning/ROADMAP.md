# Roadmap: PixelRTS

## Milestones

- **v1.0 PixelRTS Boot** — Phases 1-4 (shipped 2026-03-08)
- **v1.1 Visual Diff** — Phase 5 (shipped 2026-03-08)
- **v1.2 Network Boot** — Phases 6-8.1 (shipped 2026-03-09)

## v1.2 Network Boot (Complete)

**Milestone Goal:** Boot PixelRTS containers over network (PXE/NBD) with bandwidth-efficient delta updates.

### Phase 6: NBD Server + PXE Boot
**Goal**: Users can boot PixelRTS containers over the network using PXE/NBD.
**Requirements**: NETWORK-01, NETWORK-02, NETWORK-03, NETWORK-04, NETWORK-05, NBD-01, NBD-02, NBD-03
**Plans:** 3 plans (all complete)

### Phase 7: HTTP Boot via iPXE
**Goal**: Users can boot via HTTP for faster transfers than legacy TFTP.
**Requirements**: HTTP-01, HTTP-02
**Plans:** 3 plans (all complete)

### Phase 8: Delta Updates
**Goal**: Users can update OS containers by downloading only changed bytes.
**Requirements**: DELTA-01, DELTA-02, DELTA-03
**Plans:** 3 plans (all complete)

### Phase 8.1: Wire Delta HTTP Handler (Gap Closure)
**Goal**: Wire DeltaHTTPHandler to HTTPBootServer so /delta/ endpoints work.
**Gap Closure**: Fixes integration gap from v1.2 audit
**Plans:** 1 plan (complete)

## Progress

| Phase | Milestone | Plans Complete | Status | Completed |
|-------|-----------|----------------|--------|-----------|
| 1. Vision Analysis Pipeline | v1.0 | 8/8 | Complete | 2026-02-14 |
| 2. FUSE Bridge | v1.0 | 6/6 | Complete | 2026-02-14 |
| 3. Visual Installer Engine | v1.0 | 4/4 | Complete | 2026-02-15 |
| 4. Visual Catalog Manager | v1.0 | 4/4 | Complete | 2026-02-17 |
| 5. Visual Diff Engine | v1.1 | 4/4 | Complete | 2026-03-08 |
| 6. NBD Server + PXE Boot | v1.2 | 3/3 | Complete | 2026-03-08 |
| 7. HTTP Boot via iPXE | v1.2 | 3/3 | Complete | 2026-03-08 |
| 8. Delta Updates | v1.2 | 3/3 | Complete | 2026-03-09 |
| 8.1. Wire Delta HTTP Handler | v1.2 | 1/1 | Complete | 2026-03-09 |

---

*Next: `/gsd:new-milestone` to start v1.3*
