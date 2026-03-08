# Requirements: v1.2 Network Boot

**Milestone:** v1.2 Network Boot
**Status:** Active
**Created:** 2026-03-08

## Requirements

### Network Boot (NETWORK)

- [ ] **NETWORK-01**: User can boot PixelRTS containers over network via PXE
- [ ] **NETWORK-02**: DHCP proxy mode responds to PXE requests without conflicting with existing DHCP
- [ ] **NETWORK-03**: TFTP server serves legacy PXE boot files
- [ ] **NETWORK-04**: `pixelrts serve <file.png>` command starts all network boot services
- [ ] **NETWORK-05**: Boot progress indication shows network transfer status

### NBD Block Export (NBD)

- [ ] **NBD-01**: User can serve .rts.png files as NBD block devices
- [ ] **NBD-02**: nbdkit Python plugin decodes PixelRTS v2 containers on-demand
- [ ] **NBD-03**: Range decoding for memory-efficient serving of large containers

### HTTP Boot (HTTP)

- [ ] **HTTP-01**: iPXE chainload enables HTTP boot for faster transfers
- [ ] **HTTP-02**: HTTP server serves kernel/initrd with byte-range support

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
| NETWORK-01 | 6 | Pending |
| NETWORK-02 | 6 | Pending |
| NETWORK-03 | 6 | Pending |
| NETWORK-04 | 6 | Pending |
| NETWORK-05 | 6 | Pending |
| NBD-01 | 6 | Pending |
| NBD-02 | 6 | Pending |
| NBD-03 | 6 | Pending |
| HTTP-01 | 7 | Pending |
| HTTP-02 | 7 | Pending |
| DELTA-01 | 8 | Pending |
| DELTA-02 | 8 | Pending |
| DELTA-03 | 8 | Pending |

---

*Milestone: v1.2 Network Boot*
*Created: 2026-03-08*
