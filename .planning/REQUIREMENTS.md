# Requirements: Distributed Boot

**Defined:** 2026-03-10
**Core Value:** Boot containers on remote peers and migrate workloads across the mesh

## v1.9 Requirements

### Remote Boot Protocol

- [ ] **DIST-01**: User can boot container on remote peer via CLI
- [ ] **DIST-02**: Boot progress streams back to caller
- [ ] **DIST-03**: VNC port forwarded for console access
- [ ] **DIST-04**: Remote boot failures propagate to caller
- [ ] **DIST-05**: Remote boot cancellation support

### Container Migration

- [ ] **MIGR-01**: Checkpoint running container state
- [ ] **MIGR-02**: Transfer state to target peer
- [ ] **MIGR-03**: Restore container on target peer
- [ ] **MIGR-04**: Network reconnection after migration
- [ ] **MIGR-05**: Migration progress tracking

### Load Balancing

- [ ] **LB-01**: Peer resource reporting (CPU, memory, disk)
- [ ] **LB-02**: Capacity-aware boot routing
- [ ] **LB-03**: Overload detection triggers migration
- [ ] **LB-04**: Cluster-wide resource dashboard

## Out of Scope

| Feature | Reason |
|---------|--------|
| Cross-WAN migration | LAN focus first |
| Live migration with zero downtime | Checkpoint/restore sufficient |
| GPU workload migration | Complex, defer to v2.0 |

## Traceability

| Requirement | Phase | Status |
|-------------|-------|--------|
| DIST-01 | Phase 25 | Pending |
| DIST-02 | Phase 25 | Pending |
| DIST-03 | Phase 25 | Pending |
| DIST-04 | Phase 25 | Pending |
| DIST-05 | Phase 25 | Pending |
| MIGR-01 | Phase 26 | Pending |
| MIGR-02 | Phase 26 | Pending |
| MIGR-03 | Phase 26 | Pending |
| MIGR-04 | Phase 26 | Pending |
| MIGR-05 | Phase 26 | Pending |
| LB-01 | Phase 27 | Pending |
| LB-02 | Phase 27 | Pending |
| LB-03 | Phase 27 | Pending |
| LB-04 | Phase 27 | Pending |

---
*Requirements defined: 2026-03-10*
