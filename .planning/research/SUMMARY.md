# Project Research Summary

**Project:** PixelRTS v2 Expansion + Network Boot (PXE/NBD) and Delta Updates
**Domain:** Vision-based OS Boot + Network Boot Infrastructure
**Researched:** 2026-02-11 (v1.0/v1.1), 2026-03-08 (v1.2 Network Boot)
**Confidence:** HIGH

## Executive Summary

PixelRTS v2 is a spatial encoding format that stores binary data (OS kernels, initrds, WASM modules) as PNG images using Hilbert space-filling curves. The existing v1.0/v1.1 stack (Python 3.12+, PyFuse3, Pillow, OpenCV, Claude Vision) is validated and shipping. The expansion covers four components: vision analysis pipeline, FUSE bridge for direct boot, installer engine with visual progress, and visual catalog manager. Network boot v1.2 adds PXE/NBD boot and delta update capabilities.

Research indicates the architecture should follow a layered approach with clear boundaries. For network boot, the recommended approach implements a layered server architecture: PXEServer (DHCP+TFTP) for initial boot, NBDServer (nbdkit Python plugin) for block device export, and DeltaServer for bandwidth-efficient updates. The key insight is that PixelRTS's Hilbert curve encoding enables unique optimizations: on-demand region decoding for NBD and visual-diff-aware delta updates.

Critical risks include: (1) DHCP conflicts with existing infrastructure (use proxyDHCP mode), (2) Hilbert curve mismatch between encoder and NBD server (round-trip SHA256 verification), and (3) delta updates applied to PNG instead of extracted binary (ineffective patches). Each has clear mitigation strategies documented in PITFALLS.md.

## Key Findings

### Recommended Stack

The existing PixelRTS v1.0/v1.1 stack is validated and should not be re-researched. Network boot v1.2 adds three new core dependencies.

**Core technologies (v1.0/v1.1 - validated):**
- **Python 3.12+**: Primary implementation language with async/await support
- **PyFuse3 3.4.0+**: FUSE filesystem bindings for virtual file access
- **Pillow 12.1.0+**: PNG/image processing
- **OpenCV 4.14+**: Computer vision operations
- **anthropic 0.40+**: Claude Vision API for visual analysis

**Core technologies (v1.2 NEW - network boot):**
- **tftpy 0.8.6**: Pure Python TFTP server for PXE boot - no native dependencies, embeddable
- **nbdkit 1.40+**: Industry-standard NBD server with Python plugin API for serving .rts.png as block devices
- **pyrsync2 0.2.6**: Pure Python rsync algorithm for delta-based updates - 90%+ bandwidth savings

### Expected Features

**Must have (table stakes):**
- PXE boot server with DHCP proxy mode - users expect network boot to "just work" without breaking existing DHCP
- TFTP file serving for legacy PXE - fallback for older hardware
- NBD block device export - expected for full OS boot over network
- Boot progress indication - network boot takes time, users need feedback
- `pixelrts serve <file.png>` command - single command to start everything

**Should have (competitive):**
- PixelRTS-native NBD plugin - serve .rts.png directly via nbdkit, unique to PixelRTS
- HTTP boot via iPXE chainload - faster than TFTP, modern alternative
- Delta updates via visual diff - leverages Hilbert encoding, unique advantage
- Zero-config server - opinionated defaults, minimal setup friction

**Defer (v2+):**
- Chunked streaming boot - start boot before full download
- TLS/encryption - secure network boot
- Multi-file NBD export - serve multiple .rts.png files simultaneously

### Architecture Approach

Network boot extends the existing layered architecture with a new Network Boot Layer containing PXEServer, NBDServer, and DeltaServer components. Each protocol (DHCP, TFTP, NBD, HTTP) has its own class, orchestrated by NetworkBootManager.

**Major components:**
1. **PXEServer** - DHCP discovery (proxyDHCP mode) + TFTP boot file serving
2. **NBDServer** - nbdkit Python plugin exports PixelRTS as network block device
3. **DeltaServer** - FastAPI HTTP server for delta manifests and patches
4. **NetworkBootManager** - Orchestrates PXE + NBD + Delta services lifecycle

**Key patterns:**
- Stream-On-Demand Decoding: NBD server decodes only requested byte ranges using Hilbert coordinate mapping
- Delta-First Updates: Check for deltas before full download, apply byte-level patches to extracted binary
- Provider Interface: Vision model abstraction enables multiple backends (Claude, LM Studio, mock)

### Critical Pitfalls

1. **DHCP Conflict with Existing Network Infrastructure** - Use proxyDHCP mode that only responds to PXE requests (option 60 = "PXEClient"), or configure existing DHCP with options 66/67.

2. **Hilbert Curve Mismatch Between Encoder and NBD Server** - NBD server must use identical HilbertCurve implementation. Add round-trip SHA256 verification. Include Hilbert order in container metadata.

3. **Delta Update Breaks on PNG Recompression** - Apply delta updates to the extracted binary, not the PNG container. Re-encode to PNG after patching with consistent compression settings.

4. **NBD copyonwrite Memory Exhaustion** - Set explicit diff file size limits. Use copyonwrite only for read-only rootfs. Implement periodic cleanup.

5. **TFTP Timeout on Large PixelRTS Containers** - Use tsize option for progress. Increase blksize to 1468 bytes. Consider HTTP boot for files >10MB.

## Implications for Roadmap

Based on research and existing architecture, suggested phase structure:

### Phase 1: Vision Analysis Pipeline
**Rationale:** Demonstrates PixelRTS unique differentiator before adding network complexity
**Delivers:** Kernel version, OS distro, architecture identification, tamper detection
**Addresses:** VISION-01, VISION-02 (kernel detection, tamper detection)
**Avoids:** Blocking UI by using async/threads for API calls
**Research risk:** LOW - provider pattern well-understood

### Phase 2: FUSE Bridge for Direct Boot
**Rationale:** Removes extraction friction, enables all subsequent "direct from PNG" workflows
**Delivers:** Virtual /kernel and /initrd accessible from PNG
**Addresses:** DIRECT-01, DIRECT-02 (one-command boot, FUSE filesystem)
**Avoids:** Mount leaks by using context managers
**Research risk:** LOW - existing FUSE implementation in codebase

### Phase 3: Visual Installer Engine
**Rationale:** First practical application combining vision verification + FUSE access
**Delivers:** Installation from .rts.png to disk with progress visualization
**Addresses:** INSTALL-01 (visual progress feedback)
**Avoids:** Tight coupling by using provider interfaces
**Research risk:** MEDIUM - disk operations require care

### Phase 4: Visual Catalog Manager
**Rationale:** Polished experience delivering on the "visual OS" promise
**Delivers:** Spatial OS gallery with instant boot capability
**Addresses:** CATALOG-01, CATALOG-02 (thumbnail gallery, one-click boot)
**Avoids:** UI blocking by background thumbnail generation
**Research risk:** LOW technically, HIGH effort for polish

### Phase 5: NBD Server Foundation (Network Boot)
**Rationale:** NBD is the core enabling technology for network boot. Must work before PXE can be useful.
**Delivers:** Can export PixelRTS as NBD block device, mountable via nbd-client
**Addresses:** NBD block device export (table stakes)
**Avoids:** Hilbert curve mismatch - round-trip SHA256 verification built into initial design
**Components:** `network/nbd_server.py`, `network/tests/test_nbd_server.py`, modify `PixelRTSDecoder` for range decoding
**Research risk:** MEDIUM - memory-mapped Hilbert LUT may need performance profiling

### Phase 6: PXE Boot Infrastructure
**Rationale:** With NBD working, add PXE for client discovery and initial boot file transfer.
**Delivers:** Can PXE boot a client that connects to NBD server
**Addresses:** PXE boot server, DHCP proxy mode, TFTP file serving (table stakes)
**Avoids:** DHCP conflicts - proxyDHCP mode from day one
**Components:** `network/pxe_server.py`, `network/ipxe_config.py`, `network/tests/test_pxe_server.py`
**Research risk:** MEDIUM - UEFI vs BIOS PXE differences need hardware testing

### Phase 7: Network Boot Manager Integration
**Rationale:** Combine NBD + PXE into single orchestrated experience with BootBridge integration.
**Delivers:** Single `pixelrts serve --network-boot alpine.rts.png` command
**Addresses:** `pixelrts serve` command, boot progress indication (table stakes)
**Avoids:** TFTP timeout - progress indication via tsize option
**Components:** `network/network_boot_manager.py`, `network/client_registry.py`, extend `BootBridge` with network mode
**Research risk:** LOW - well-documented orchestration patterns

### Phase 8: Delta Updates
**Rationale:** With network boot working, add bandwidth-efficient updates as competitive advantage.
**Delivers:** Can update installed OS with only changed bytes
**Addresses:** Delta updates via visual diff (differentiator), chunk-based delta transfer (differentiator)
**Avoids:** Delta on PNG - apply to extracted binary, verify patch size <20% of source
**Components:** `network/delta_engine.py`, `network/delta_server.py`, `network/tests/test_delta_engine.py`
**Research risk:** LOW - rsync/bsdiff algorithms well-documented

### Phase Ordering Rationale

- **Phases 1-4 (existing plan):** Vision -> FUSE -> Installer -> Catalog validates core value before network complexity
- **Phase 5 (NBD):** Core dependency - PXE needs NBD to serve rootfs
- **Phase 6 (PXE):** Client discovery layer on top of NBD
- **Phase 7 (Manager):** Orchestration unifies NBD + PXE into usable CLI
- **Phase 8 (Delta):** Enhancement after core network boot is validated

This order ensures each phase delivers testable value before the next begins, avoiding "everything half-done" syndrome.

### Research Flags

Phases likely needing deeper research during planning:
- **Phase 5 (NBD):** Memory-mapped Hilbert LUT for low latency - may need performance profiling
- **Phase 6 (PXE):** UEFI vs BIOS PXE differences for target hardware - test on real hardware

Phases with standard patterns (skip research-phase):
- **Phase 7 (Manager):** Well-documented orchestration patterns, existing BootBridge to extend
- **Phase 8 (Delta):** rsync/bsdiff algorithms are well-documented, pyrsync2 is straightforward

## Confidence Assessment

| Area | Confidence | Notes |
|------|------------|-------|
| Stack | HIGH | All v1.2 dependencies are mature with official documentation. tftpy, nbdkit, pyrsync2 all well-maintained. |
| Features | HIGH | Based on iPXE docs, NBD protocol spec, and existing PixelRTS infrastructure. Clear feature dependencies mapped. |
| Architecture | HIGH | Layered server architecture is standard pattern. Stream-on-demand decoding is proven approach. |
| Pitfalls | MEDIUM | Network boot pitfalls are documented from official sources, but PixelRTS-specific integration (Hilbert curve with NBD) needs validation. |

**Overall confidence:** HIGH

### Gaps to Address

- **VLM API specifics:** Claude API vision endpoint details (model pricing, rate limits) need verification during Phase 1
- **Hilbert LUT caching strategy:** Research suggests caching but doesn't specify memory-mapped vs in-memory. Validate during Phase 5 implementation with performance benchmarks.
- **UEFI vs BIOS PXE differences:** Research covers general PXE but target hardware may have specific requirements. Test on real hardware during Phase 6.
- **Concurrent client scaling:** Research suggests 10-100 clients need async NBD, but exact threshold unclear. Load test during Phase 7.
- **Delta patch size thresholds:** Research says "reasonable <20%" but actual results depend on OS update patterns. Measure with real Alpine/Debian updates during Phase 8.
- **Cross-platform FUSE:** Current design assumes Linux; macOS/Dokan support would need investigation

## Sources

### Primary (HIGH confidence)
- **tftpy PyPI** (https://pypi.org/project/tftpy/) - TFTP server implementation
- **nbdkit Python Plugin Docs** (https://libguestfs.org/nbdkit-python-plugin.3.html) - NBD server with Python API
- **pyrsync2 PyPI** (https://pypi.org/project/pyrsync2/) - Pure Python rsync algorithm
- **iPXE Documentation** (https://ipxe.org/docs) - PXE boot chainloading
- **NBD GitHub Repository** (https://github.com/NetworkBlockDevice/nbd) - NBD protocol specification
- **rsync Algorithm Technical Report** (https://rsync.samba.org/tech_report/tech_report.html) - Rolling checksum algorithm
- **pyfuse3** (https://pyfuse3.readthedocs.io/) - FUSE filesystem bindings
- **Pillow** (https://pillow.readthedocs.io/) - Image processing
- **OpenCV** (https://docs.opencv.org/4.x/) - Computer vision

### Secondary (MEDIUM confidence)
- **PixelRTS v2 Design** (`/specs/pixelrts-v2/design.md`) - Existing architecture patterns
- **PixelRTS Boot System** (`/systems/pixel_compiler/pixelrts_boot.py`) - Existing boot infrastructure
- **FUSE Performance Discussion** (https://github.com/libfuse/libfuse/issues/504) - Cache configuration patterns
- **Arch Linux Diskless System** (https://wiki.archlinux.org/title/Diskless_system) - NBD rootfs patterns
- **FUSE in Python guide (2024)** (https://gwolf.org/2024/10/started-a-guide-to-writing-fuse-filesystems-in-python.html) - Implementation patterns

### Tertiary (LOW confidence)
- **Vision model hallucination research** (arXiv 2026) - Binary classification challenges, needs validation with PixelRTS-specific images
- **2026 Secure Boot certificate crisis** - May affect installer, monitor during implementation

---
*Research completed: 2026-03-08*
*Ready for roadmap: yes*
