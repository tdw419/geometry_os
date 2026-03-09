# Requirements: Network Boot Substrate

**Defined:** 2026-03-09
**Core Value:** Distributed Geometry OS nodes can discover peers and share tectonic state

## v1.8 Requirements

### Peer Discovery

- [x] **PEER-01**: Node can broadcast presence via UDP multicast
- [x] **PEER-02**: Node can receive peer beacons from mesh
- [x] **PEER-03**: Node can track discovered peers with metadata (hostname, bounds, orb_count)

### Peer Registry

- [x] **REG-01**: Registry tracks peer beacons with timestamps
- [x] **REG-02**: Registry removes stale peers (timeout-based cleanup)
- [x] **REG-03**: Registry provides active peer list

### Tectonic Sync

- [x] **SYNC-01**: Node can accept WebSocket connections from peers
- [x] **SYNC-02**: Node can connect to peer WebSocket servers
- [x] **SYNC-03**: Orb position updates sync across mesh
- [x] **SYNC-04**: Ripple events sync across mesh

### Orchestration

- [x] **ORCH-01**: NetworkBoot orchestrates broadcaster, registry, sync
- [x] **ORCH-02**: NetworkBoot connects to GravityEngine for state sync
- [ ] **ORCH-03**: NetworkBoot provides status via CLI command

### CLI Integration

- [ ] **CLI-01**: `pixelrts mesh status` shows peer count and active connections
- [ ] **CLI-02**: `pixelrts mesh discover` triggers immediate peer discovery
- [ ] **CLI-03**: JSON output via `--json` flag

## Future Requirements

### Advanced Mesh

- **MESH-01**: Peer authentication via Ed25519 signatures
- **MESH-02**: Encrypted peer communication
- **MESH-03**: Mesh-wide boot orchestration (coordinate container startup)

### Distributed Boot

- **DIST-01**: Boot container on remote peer
- **DIST-02**: Container migration between peers
- **DIST-03**: Load balancing across mesh

## Out of Scope

| Feature | Reason |
|---------|--------|
| WAN/Internet mesh | LAN focus first |
| Peer-to-peer file transfer | Use existing NBD/HTTP |
| Consensus protocols | Simple sync sufficient |
| Mesh routing | Direct connections only |

## Traceability

| Requirement | Phase | Status |
|-------------|-------|--------|
| PEER-01 | Phase 23 | Complete |
| PEER-02 | Phase 23 | Complete |
| PEER-03 | Phase 23 | Complete |
| REG-01 | Phase 23 | Complete |
| REG-02 | Phase 23 | Complete |
| REG-03 | Phase 23 | Complete |
| SYNC-01 | Phase 23 | Complete |
| SYNC-02 | Phase 23 | Complete |
| SYNC-03 | Phase 23 | Complete |
| SYNC-04 | Phase 23 | Complete |
| ORCH-01 | Phase 23 | Complete |
| ORCH-02 | Phase 23 | Complete |
| ORCH-03 | Phase 24 | Complete |
| CLI-01 | Phase 24 | Complete |
| CLI-02 | Phase 24 | Complete |
| CLI-03 | Phase 24 | Complete |

**Coverage:**
- v1.8 requirements: 16 total
- Mapped to phases: 16
- Unmapped: 0 ✓

---
*Requirements defined: 2026-03-09*
