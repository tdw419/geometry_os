# Requirements: PixelRTS v1.3 Multi-Boot

**Defined:** 2026-03-09
**Core Value:** Booting an OS should be as visual and intuitive as opening an image file.

## v1.3 Requirements

### Core Multi-Boot

- [x] **MULTI-01**: User can boot multiple containers with single CLI command (`pixelrts boot a.rts.png b.rts.png`) — Complete (Phase 9)
- [x] **MULTI-02**: System allocates unique VNC ports and socket paths per container — Complete (Phase 9)
- [x] **MULTI-03**: Partial boot failure triggers cleanup of already-started containers — Complete (Phase 9)

### Boot Ordering

- [ ] **ORDER-01**: User can designate primary container (starts first, stops last)
- [ ] **ORDER-02**: Helper containers wait for primary to launch before starting
- [ ] **ORDER-03**: Shutdown reverses boot order (helpers stop first, primary last)

### Networking

- [x] **NET-01**: Containers can communicate with each other via QEMU socket networking — Complete (Phase 11)
- [x] **NET-02**: No root privileges required for inter-container networking — Complete (Phase 11)

### Status & Management

- [ ] **STATUS-01**: User can view running containers with `pixelrts ps`
- [ ] **STATUS-02**: Status shows container name, VNC port, and state (launching/running/stopped)

## Future Requirements

- [ ] **MULTI-04**: Boot group configuration via YAML file
- [ ] **ORDER-04**: Health-aware startup (wait for primary to be "ready")
- [ ] **NET-03**: Container name → IP discovery via /etc/hosts injection
- [ ] **STATUS-03**: Individual container control (start/stop/restart)
- [ ] **STATUS-04**: Catalog multi-select boot UI

## Out of Scope

| Feature | Reason |
|---------|--------|
| TAP/bridge networking | Requires root, socket netdev is simpler |
| Live migration | Complex, not needed for multi-boot use case |
| Distributed multi-host | Single-machine focus |
| Full orchestration (K8s-style) | Use Docker/Kubernetes for that |
| Shared memory between VMs | Advanced feature, defer |

## Traceability

| Requirement | Phase | Status |
|-------------|-------|--------|
| MULTI-01 | Phase 9 | Complete |
| MULTI-02 | Phase 9 | Complete |
| MULTI-03 | Phase 9 | Complete |
| ORDER-01 | Phase 10 | Complete |
| ORDER-02 | Phase 10 | Complete |
| ORDER-03 | Phase 10 | Complete |
| NET-01 | Phase 11 | Complete |
| NET-02 | Phase 11 | Complete |
| STATUS-01 | Phase 9 | Complete |
| STATUS-02 | Phase 9 | Complete |

**Coverage:**
- v1.3 requirements: 10 total
- Mapped to phases: 10
- Unmapped: 0 ✓

---
*Requirements defined: 2026-03-09*
*Traceability updated: 2026-03-08*
