# Roadmap: v1.3 PXE Boot

**Created:** 2026-02-28
**Depth:** Standard
**Coverage:** 16/16 requirements mapped

## Overview

Extend PixelRTS boot capabilities to bare metal machines via PXE. Users can boot any container from the visual shell catalog on networked machines without local storage - the same drag-and-drop experience, now spanning physical hardware.

## Phases

### Phase 12: DHCP Server

**Goal:** PXE clients receive network configuration and boot instructions automatically.

**Dependencies:** None (foundation for PXE stack)

**Requirements:** DHCP-01, DHCP-02, DHCP-03, DHCP-04

**Success Criteria:**
1. User can start DHCP server from command line with interface and IP range options
2. PXE client machine receives IP address when booting on the same network
3. DHCP response includes correct PXE boot server IP and bootloader filename
4. User sees DHCP lease logs showing client MAC addresses and assigned IPs

**Plans:** 4 plans (Complete)

---

### Phase 13: TFTP Server

**Goal:** PXE clients download the iPXE bootloader via TFTP.

**Dependencies:** Phase 12 (DHCP must point clients to TFTP)

**Requirements:** TFTP-01, TFTP-02, TFTP-03, TFTP-04

**Success Criteria:**
1. User can start TFTP server serving the iPXE bootloader
2. PXE client successfully downloads bootloader after receiving DHCP response
3. Multiple PXE clients can boot simultaneously without blocking
4. User sees TFTP transfer logs with file names and transfer sizes

**Plans:** 4 plans (Complete)

---

### Phase 14: HTTP Container Serving

**Goal:** .rts.png containers are available for HTTP download by iPXE clients.

**Dependencies:** Phase 13 (iPXE must be delivered to make HTTP requests)

**Requirements:** HTTP-01, HTTP-02, HTTP-03, HTTP-04

**Success Criteria:**
1. User can serve .rts.png files via HTTP endpoint
2. Existing catalog server provides containers at predictable URLs
3. User can enable/disable PXE availability per container via settings panel
4. Large containers download correctly with HTTP range request support

**Plans:** 4 plans (Complete)

---

### Phase 15: Boot Menu

**Goal:** PXE clients see an interactive menu to select which container to boot.

**Dependencies:** Phase 14 (containers must be available via HTTP)

**Requirements:** MENU-01, MENU-02, MENU-03, MENU-04

**Success Criteria:**
1. PXE client displays menu listing all PXE-enabled containers
2. User can customize container names and descriptions shown in menu
3. Menu displays container metadata (size, OS type) alongside entries
4. User can set default selection and auto-boot timeout in configuration

**Plans:** 4 plans (Complete)

Plans:
- [x] 15-01-PLAN.md - iPXE boot script and menu script endpoints
- [x] 15-02-PLAN.md - Menu configuration (default entry, timeout)
- [x] 15-03-PLAN.md - Menu entry customization (names, descriptions, CLI)
- [x] 15-04-PLAN.md - Boot menu tests (49 tests)

---

### Phase 16: Integration

**Goal:** PXE boot integrates seamlessly with existing v1.2 visual shell infrastructure.

**Dependencies:** Phase 15 (PXE boot must be functional)

**Requirements:** INT-01, INT-02, INT-03, INT-04

**Success Criteria:**
1. RemoteBootFetcher reuses existing download logic for PXE-served containers
2. Visual shell catalog shows PXE badge on containers available for network boot
3. Settings panel includes PXE toggle per container with immediate effect
4. Boot progress visualization works identically for PXE and local boot

**Plans:** 0 plans (Pending)

---

## Progress

| Phase | Goal | Requirements | Plans | Status |
|-------|------|--------------|-------|--------|
| 12 - DHCP Server | PXE clients receive boot instructions | 4 | 4 | Complete |
| 13 - TFTP Server | Bootloader delivered via TFTP | 4 | 4 | Complete |
| 14 - HTTP Serving | Containers available via HTTP | 4 | 4 | Complete |
| 15 - Boot Menu | Interactive container selection | 4 | 4 | Complete |
| 16 - Integration | Unified with v1.2 infrastructure | 4 | 0 | Pending |

**Total:** 16 requirements, 5 phases, 16 plans

---

## Coverage Map

```
DHCP-01 -> Phase 12
DHCP-02 -> Phase 12
DHCP-03 -> Phase 12
DHCP-04 -> Phase 12
TFTP-01 -> Phase 13
TFTP-02 -> Phase 13
TFTP-03 -> Phase 13
TFTP-04 -> Phase 13
HTTP-01 -> Phase 14
HTTP-02 -> Phase 14
HTTP-03 -> Phase 14
HTTP-04 -> Phase 14
MENU-01 -> Phase 15
MENU-02 -> Phase 15
MENU-03 -> Phase 15
MENU-04 -> Phase 15
INT-01 -> Phase 16
INT-02 -> Phase 16
INT-03 -> Phase 16
INT-04 -> Phase 16

Mapped: 16/16 (100%)
```

---
*Roadmap created: 2026-02-28*
*Plans added: 2026-02-28*
