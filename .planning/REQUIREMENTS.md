# Requirements: PXE Boot

**Defined:** 2026-02-28
**Core Value:** Booting an OS should be as visual and intuitive as opening an image file — from anywhere, including bare metal.

## v1.3 Requirements

Requirements for PXE Boot milestone. Each maps to a roadmap phase.

### DHCP Server (DHCP)

- [x] **DHCP-01**: User can configure DHCP server to respond to PXE client requests
- [x] **DHCP-02**: User can specify network interface for DHCP service
- [x] **DHCP-03**: User can configure IP range for PXE clients
- [x] **DHCP-04**: DHCP responses include PXE boot server and filename options

### TFTP Server (TFTP)

- [x] **TFTP-01**: User can start TFTP server for bootloader delivery
- [x] **TFTP-02**: User can serve iPXE bootloader to PXE clients
- [x] **TFTP-03**: TFTP server handles concurrent client connections
- [x] **TFTP-04**: User sees TFTP transfer logs for debugging

### HTTP Container Serving (HTTP)

- [x] **HTTP-01**: User can serve .rts.png containers via HTTP for PXE boot
- [x] **HTTP-02**: HTTP server integrates with existing catalog infrastructure
- [x] **HTTP-03**: User can select which containers are available for PXE boot
- [x] **HTTP-04**: HTTP server supports range requests for large containers

### Boot Menu (MENU)

- [ ] **MENU-01**: PXE client sees boot menu with available containers
- [ ] **MENU-02**: User can customize boot menu entries (name, description)
- [ ] **MENU-03**: Boot menu shows container thumbnails/metadata
- [ ] **MENU-04**: User can set default boot entry and timeout

### Integration (INT)

- [ ] **INT-01**: PXE boot uses existing RemoteBootFetcher for container download
- [ ] **INT-02**: PXE containers appear in visual shell catalog with PXE badge
- [ ] **INT-03**: User can toggle PXE availability per container from settings
- [ ] **INT-04**: PXE boot status integrates with existing boot progress visualization

## v1.x Requirements

Deferred to future releases.

### Network Integration (NETWORK)

- **NETWORK-02**: Delta-based OS updates — moved to v1.4+

## Out of Scope

Explicitly excluded. Documented to prevent scope creep.

| Feature | Reason |
|---------|--------|
| DNS server | Use existing network DNS |
| Full PXE provisioner | Focus on boot, not provisioning |
| UEFI HTTP Boot | iPXE chainload supports both BIOS and UEFI |
| Multiple network interfaces | Single interface sufficient for v1.3 |
| PXE authentication | Open network for v1.3 |

## Traceability

Which phases cover which requirements. Updated during roadmap creation.

| Requirement | Phase | Status |
|-------------|-------|--------|
| DHCP-01 | Phase 12 | Complete |
| DHCP-02 | Phase 12 | Complete |
| DHCP-03 | Phase 12 | Complete |
| DHCP-04 | Phase 12 | Complete |
| TFTP-01 | Phase 13 | Complete |
| TFTP-02 | Phase 13 | Complete |
| TFTP-03 | Phase 13 | Complete |
| TFTP-04 | Phase 13 | Complete |
| HTTP-01 | Phase 14 | Complete |
| HTTP-02 | Phase 14 | Complete |
| HTTP-03 | Phase 14 | Complete |
| HTTP-04 | Phase 14 | Complete |
| MENU-01 | Phase 15 | Pending |
| MENU-02 | Phase 15 | Pending |
| MENU-03 | Phase 15 | Pending |
| MENU-04 | Phase 15 | Pending |
| INT-01 | Phase 16 | Pending |
| INT-02 | Phase 16 | Pending |
| INT-03 | Phase 16 | Pending |
| INT-04 | Phase 16 | Pending |

**Coverage:**
- v1.3 requirements: 16 total
- Mapped to phases: 16
- Unmapped: 0

---
*Requirements defined: 2026-02-28*
