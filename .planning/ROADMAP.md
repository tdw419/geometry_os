# Roadmap: PixelRTS

## Milestones

- **v1.0 MVP** - Phases 1-4 (shipped 2026-03-08)
- **v1.1 Visual Diff** - Phase 5 (shipped 2026-03-08)
- **v1.2 Network Boot** - Phases 6-8.1 (shipped 2026-03-09)
- **v1.3 Multi-Boot** - Phases 9-11 (shipped 2026-03-09)
- **v1.4 Live Snapshots** - Phases 12-14 (shipped 2026-03-09)
- **v1.5 Commit to File** - Phases 15-17 (shipped 2026-03-09) — [Archive](milestones/v1.5-ROADMAP.md)
- **v1.6 Ephemeral Boot** - Phase 18 (shipped 2026-03-09) — [Archive](milestones/v1.6-ROADMAP.md)
- **v1.7 Vision Integrity** - Phases 19-22 (shipped 2026-03-09) — [Archive](milestones/v1.7-ROADMAP.md)
- **v1.8 Network Boot Substrate** - Phases 23-24 (in progress)

## Current Status

**Milestone v1.8 Network Boot Substrate in progress.** Core components implemented, CLI integration pending.

---

## Phases

### v1.8 Network Boot Substrate

**Milestone Goal:** Distributed Geometry OS nodes can discover peers and sync tectonic state

#### Phase 23: Core Mesh Components
**Goal**: Mesh networking infrastructure for peer discovery and state sync
**Depends on**: Phase 22 (CLI integration)
**Requirements**: PEER-01, PEER-02, PEER-03, REG-01, REG-02, REG-03, SYNC-01, SYNC-02, SYNC-03, SYNC-04, ORCH-01, ORCH-02
**Success Criteria** (what must be TRUE):
  1. Node broadcasts presence on UDP:7331
  2. Node receives peer beacons and tracks peers
  3. Peers connect via WebSocket for state sync
  4. Orb updates propagate across mesh
  5. Ripple events propagate across mesh
**Plans**: 4 (already implemented)

Plans:
- [x] 23-01: MeshBroadcaster for UDP peer discovery
- [x] 23-02: PeerRegistry for mesh node tracking
- [x] 23-03: TectonicSync for WebSocket state sync
- [x] 23-04: NetworkBoot orchestrator

#### Phase 24: CLI Integration
**Goal**: Users can inspect mesh status via CLI
**Depends on**: Phase 23
**Requirements**: ORCH-03, CLI-01, CLI-02, CLI-03
**Success Criteria** (what must be TRUE):
  1. `pixelrts mesh status` shows peer count and connections
  2. `pixelrts mesh discover` triggers immediate discovery
  3. `--json` flag outputs machine-parseable results
  4. Human-readable output shows clear mesh state
**Plans**: 1

Plans:
- [x] 24-01: Add pixelrts mesh CLI commands

## Progress

**Execution Order:**
Phases execute in numeric order: 23 → 24

| Phase | Milestone | Plans Complete | Status | Completed |
|-------|-----------|----------------|--------|-----------|
| 23. Core Mesh | v1.8 | 4/4 | Complete | 2026-03-09 |
| 24. CLI Integration | v1.8 | 1/1 | Complete | 2026-03-09 |

---
*Last updated: 2026-03-09 — v1.8 milestone complete*
