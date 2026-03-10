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

**Milestone v1.9 Distributed Boot in progress.** Remote boot, migration, and load balancing.

---

## Phases

### v1.9 Distributed Boot

**Milestone Goal:** Boot containers on remote peers and migrate workloads across the mesh

#### Phase 25: Remote Boot Protocol
**Goal**: Boot containers on remote peers via mesh
**Depends on**: Phase 24 (CLI integration)
**Requirements**: DIST-01, DIST-02, DIST-03, DIST-04, DIST-05
**Success Criteria** (what must be TRUE):
  1. `pixelrts boot --peer <hostname> file.rts.png` boots on remote node
  2. Boot progress streams back to caller
  3. VNC port forwarded for console access
  4. Remote boot failures propagate to caller
**Plans**: 4 (to be created)

Plans:
- [ ] 25-01: RemoteBootClient for initiating remote boots
- [ ] 25-02: RemoteBootServer for handling boot requests
- [ ] 25-03: BootProgress streaming protocol
- [ ] 25-04: CLI integration for remote boot

#### Phase 26: Container Migration
**Goal**: Migrate running containers between peers
**Depends on**: Phase 25
**Requirements**: MIGR-01, MIGR-02, MIGR-03, MIGR-04, MIGR-05
**Success Criteria** (what must be TRUE):
  1. `pixelrts migrate <container> <target>` initiates migration
  2. VM memory state transferred via mesh
  3. Container resumes on target with preserved state
  4. VNC connection re-established automatically
**Plans**: 5 (to be created)

Plans:
- [ ] 26-01: ContainerCheckpoint for state capture
- [ ] 26-02: StateTransfer for mesh transfer
- [ ] 26-03: ContainerRestore on target peer
- [ ] 26-04: NetworkReconnection after migration
- [ ] 26-05: CLI integration for migration

#### Phase 27: Load Balancing
**Goal**: Automatic container placement based on peer capacity
**Depends on**: Phase 26
**Requirements**: LB-01, LB-02, LB-03, LB-04
**Success Criteria** (what must be TRUE):
  1. `pixelrts boot --auto-place file.rts.png` selects best peer
  2. Peer metrics exchanged via mesh
  3. Overloaded peers trigger automatic migration
  4. Dashboard shows cluster-wide resource usage
**Plans**: 4 (to be created)

Plans:
- [ ] 27-01: PeerResourceMonitor for capacity tracking
- [ ] 27-02: CapacityRouter for boot routing
- [ ] 27-03: OverloadDetector for migration triggers
- [ ] 27-04: Cluster dashboard integration

---

### v1.8 Network Boot Substrate (Complete)

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
