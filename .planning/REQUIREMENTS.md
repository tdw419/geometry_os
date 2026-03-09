# Requirements: v1.2 Network Boot

**Milestone:** v1.2 Network Boot
**Status:** Active
**Created:** 2026-03-08

## Requirements

### Network Boot (NETWORK)

- [x] **NETWORK-01**: User can boot PixelRTS containers over network via PXE
- [x] **NETWORK-02**: DHCP proxy mode responds to PXE requests without conflicting with existing DHCP
- [x] **NETWORK-03**: TFTP server serves legacy PXE boot files
- [x] **NETWORK-04**: `pixelrts serve <file.png>` command starts all network boot services
- [x] **NETWORK-05**: Boot progress indication shows network transfer status

### NBD Block Export (NBD)

- [x] **NBD-01**: User can serve .rts.png files as NBD block devices
- [x] **NBD-02**: nbdkit Python plugin decodes PixelRTS v2 containers on-demand
- [x] **NBD-03**: Range decoding for memory-efficient serving of large containers

### HTTP Boot (HTTP)

- [x] **HTTP-01**: iPXE chainload enables HTTP boot for faster transfers
- [x] **HTTP-02**: HTTP server serves kernel/initrd with byte-range support

### Delta Updates (DELTA)

- [ ] **DELTA-01**: User can generate delta manifest between two .rts.png versions
- [ ] **DELTA-02**: Client can apply delta patch to update local copy
- [ ] **DELTA-03**: Delta transfer leverages existing PixelRTSDiffer infrastructure

## Future Requirements

- [ ] **NETWORK-06**: Visual boot menu with catalog integration
- [ ] **NBD-04**: TLS/encryption for secure network boot
- [ ] **DELTA-04**: Chunked streaming boot (start before full download)

## Out of Scope

- **Full DHCP server** — Use proxy mode only to avoid network conflicts
- **Cloud provider integration** — Focus on local/bare-metal network boot
- **Multicast boot** — Too complex for v1.2
- **Live migration** — Not needed for boot/install use case

## Traceability

| Requirement | Phase | Status |
|-------------|-------|--------|
| NETWORK-01 | 6 | Complete |
| NETWORK-02 | 6 | Complete |
| NETWORK-03 | 6 | Complete |
| NETWORK-04 | 6 | Complete |
| NETWORK-05 | 6 | Complete |
| NBD-01 | 6 | Complete |
| NBD-02 | 6 | Complete |
| NBD-03 | 6 | Complete |
| HTTP-01 | 7 | Complete |
| HTTP-02 | 7 | Complete |
| DELTA-01 | 8 | Pending |
| DELTA-02 | 8 | Pending |
| DELTA-03 | 8 | Pending |

---

*Milestone: v1.2 Network Boot*
*Created: 2026-03-08*
