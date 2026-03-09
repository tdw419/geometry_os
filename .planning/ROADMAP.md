# Roadmap: PixelRTS

## Milestones

- **v1.0 PixelRTS Boot** — Phases 1-4 (shipped 2026-03-08)
- **v1.1 Visual Diff** — Phase 5 (shipped 2026-03-08)
- **v1.2 Network Boot** — Phases 6-8.1 (shipped 2026-03-09)
- **v1.3 Multi-Boot** — Phases 9-11 (in progress)

## v1.2 Network Boot (Complete)

<details>
<summary>v1.2 Network Boot (Phases 6-8.1) - SHIPPED 2026-03-09</summary>

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

</details>

---

## v1.3 Multi-Boot (In Progress)

**Milestone Goal:** Boot multiple PixelRTS containers simultaneously with network connectivity

### Phase 9: Core Multi-Boot Infrastructure
**Goal**: Users can boot multiple containers simultaneously with automatic resource allocation
**Depends on**: Phase 8.1 (existing boot infrastructure)
**Requirements**: MULTI-01, MULTI-02, MULTI-03, STATUS-01, STATUS-02
**Success Criteria** (what must be TRUE):
  1. User can run `pixelrts boot a.rts.png b.rts.png` and both containers start
  2. Each container gets unique VNC port and socket path (no conflicts)
  3. If one container fails to boot, already-started containers are cleaned up
  4. User can run `pixelrts ps` to see running containers with name, VNC port, state
  5. Status shows container states (launching/running/stopped)
**Plans:** 5 plans (complete)

Plans:
- [x] 09-01-PLAN.md — ResourceAllocator for VNC ports and socket paths
- [x] 09-02-PLAN.md — MultiBootManager with concurrent boot orchestration
- [x] 09-03-PLAN.md — Cleanup on partial failure (compensating transactions)
- [x] 09-04-PLAN.md — `pixelrts ps` status command
- [x] 09-05-PLAN.md — CLI multi-file boot support

### Phase 10: Boot Ordering & Dependencies
**Goal**: Users can designate primary/helper containers with ordered startup and shutdown
**Depends on**: Phase 9 (multi-boot foundation)
**Requirements**: ORDER-01, ORDER-02, ORDER-03
**Success Criteria** (what must be TRUE):
  1. User can designate one container as primary (starts first)
  2. Helper containers wait until primary is running before starting
  3. Shutdown reverses boot order (helpers stop first, primary last)
  4. User can observe boot order progress in CLI output
**Plans:** 4 plans (complete)

Plans:
- [x] 10-01-PLAN.md — Container role designation (primary/helper enum, --primary CLI flag)
- [x] 10-02-PLAN.md — Boot dependency ordering with wait logic (primary first, helpers wait)
- [x] 10-03-PLAN.md — Reverse-order graceful shutdown (stop_all_ordered)
- [x] 10-04-PLAN.md — Boot progress visibility (progress_callback, CLI output)

### Phase 11: Virtual Networking
**Goal**: Containers can communicate with each other without root privileges
**Depends on**: Phase 10 (ordered multi-boot)
**Requirements**: NET-01, NET-02
**Success Criteria** (what must be TRUE):
  1. Containers can ping/connect to each other over virtual network
  2. Networking works without root or CAP_NET_ADMIN privileges
  3. Network setup failure falls back gracefully to isolated mode
**Plans:** 3 plans

Plans:
- [ ] 11-01-PLAN.md — VirtualNetwork class with QEMU socket netdev (multicast mesh)
- [ ] 11-02-PLAN.md — NetworkMode enum extension (SOCKET_MCAST, SOCKET_STREAM)
- [ ] 11-03-PLAN.md — Graceful degradation on network failure with fallback to USER mode

## Progress

**Execution Order:**
Phases execute in numeric order: 9 -> 10 -> 11

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
| 9. Core Multi-Boot Infrastructure | v1.3 | 5/5 | Complete | 2026-03-09 |
| 10. Boot Ordering & Dependencies | v1.3 | 4/4 | Complete | 2026-03-09 |
| 11. Virtual Networking | v1.3 | 0/3 | Not started | - |

---

*Next: `/gsd:execute-phase 11` to execute Virtual Networking*
