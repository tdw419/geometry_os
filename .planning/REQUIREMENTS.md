# Requirements: Network Boot

**Defined:** 2026-02-27
**Core Value:** Booting an OS should be as visual and intuitive as opening an image file — from anywhere.

## v1.2 Requirements

Requirements for Network Boot milestone. Each maps to a roadmap phase.

### Remote Boot (RBOOT)

- [ ] **RBOOT-01**: User can boot a container from a remote HTTP URL
- [ ] **RBOOT-02**: User sees download progress (percentage, speed, time remaining)
- [ ] **RBOOT-03**: User can retry failed downloads with exponential backoff
- [ ] **RBOOT-04**: User can boot cached containers offline (cache-first architecture)
- [ ] **RBOOT-05**: User sees hash verification status for downloaded containers

### Remote Catalog (RCAT)

- [ ] **RCAT-01**: User can browse remote catalog servers
- [ ] **RCAT-02**: User sees hybrid view of local + remote catalogs
- [ ] **RCAT-03**: User can filter/search across all catalog sources
- [ ] **RCAT-04**: User can see which server each container comes from

### Cache Management (CACHE)

- [ ] **CACHE-01**: Downloaded containers are cached locally with hash verification
- [ ] **CACHE-02**: Cache uses LRU eviction when size limit reached
- [ ] **CACHE-03**: User can clear cache manually
- [ ] **CACHE-04**: Stale cache is validated with ETag on next access

## v1.x Requirements

Deferred to future releases.

### Network Integration (NETWORK)

- **NETWORK-01**: Boot PixelRTS containers over network (PXE/NBD) — moved to v1.3+
- **NETWORK-02**: Delta-based OS updates — moved to v1.4+

## Out of Scope

Explicitly excluded. Documented to prevent scope creep.

| Feature | Reason |
|---------|--------|
| Auto-updates | Breaks reproducibility — user controls when to update |
| Background downloads | Surprises users, uses bandwidth unexpectedly |
| Centralized registry | Vendor lock-in — support any HTTP server |
| PKI/Signing | Premature complexity — start with open access |
| WebSocket push | REST polling is simpler and already working |
| Resume partial downloads | Restart from beginning for simplicity |

## Traceability

Which phases cover which requirements. Updated during roadmap creation.

| Requirement | Phase | Status |
|-------------|-------|--------|
| CACHE-01 | Phase 7 | Complete |
| CACHE-02 | Phase 7 | Complete |
| CACHE-04 | Phase 7 | Complete |
| RCAT-01 | Phase 8 | Complete |
| RCAT-04 | Phase 8 | Complete |
| RBOOT-01 | Phase 9 | Complete |
| RBOOT-02 | Phase 9 | Complete |
| RBOOT-04 | Phase 9 | Complete |
| RBOOT-05 | Phase 9 | Complete |
| RCAT-02 | Phase 10 | Pending |
| RCAT-03 | Phase 10 | Pending |
| RBOOT-03 | Phase 11 | Pending |
| CACHE-03 | Phase 11 | Pending |

**Coverage:**
- v1.2 requirements: 13 total
- Mapped to phases: 13
- Unmapped: 0

---
*Requirements defined: 2026-02-27*
*Last updated: 2026-02-27*
