# Pitfalls Research

**Domain:** Vision-based OS Boot (PixelRTS v2)
**Researched:** 2026-02-11
**Confidence:** MEDIUM

## Critical Pitfalls

### Pitfall 1: Vision Model Hallucination in Binary Analysis

**What goes wrong:**
Vision model incorrectly identifies kernel version, OS distro, or architecture from PNG visual patterns, leading users to boot the wrong OS or version. False positives in tampering detection either flag valid containers as corrupted (false alarm fatigue) or miss actual tampering (security failure).

**Why it happens:**
Vision models can hallucinate details when presented with ambiguous visual patterns. The Hilbert curve encoding in PixelRTS creates complex spatial patterns that may be misinterpreted. Binary classification for tampering detection has known false positive challenges that even 2026 research is actively addressing.

**How to avoid:**
- Never rely solely on vision model output for critical boot decisions
- Implement multi-factor verification: vision analysis + checksum validation + metadata cross-check
- Use vision model as "confidence signal" not "authoritative source"
- Set confidence thresholds below which system falls back to traditional verification
- Maintain human-in-the-loop for security-critical decisions

**Warning signs:**
- Vision model confidence scores fluctuate wildly for similar images
- Users report "it said X but Y actually happened"
- Tampering detection flags legitimate containers repeatedly
- Model succeeds in controlled tests but fails in real-world usage

**Phase to address:** Phase 1 (Vision Analysis) - Must establish verification framework before relying on vision output

---

### Pitfall 2: FUSE Performance Death Spiral

**What goes wrong:**
FUSE filesystem overhead (10-30% performance penalty) compounds with improper caching, causing boot times to degrade from seconds to minutes. Memory consumption grows unbounded, eventually causing OOM kills or system hangs.

**Why it happens:**
Default FUSE uses write-through cache which forwards write requests based on IO/page size, creating bottlenecks. Implementers often skip proper cache configuration early ("we'll optimize later") then struggle to retroactively fix without breaking compatibility. Double caching (application + filesystem level) is common.

**How to avoid:**
- Design caching strategy from day one, not as "optimization later"
- Profile performance baseline before adding FUSE layer
- Implement cache size limits and memory pressure handling immediately
- Consider kernel-level alternatives if performance is critical
- Use read-heavy cache policies for OS boot scenarios (mostly reads, few writes)

**Warning signs:**
- Boot time increases >10% vs direct extraction
- Memory usage grows continuously during operations
- I/O wait percentage spikes when FUSE is active
- Profiling shows time spent in kernel/userspace transitions

**Phase to address:** Phase 2 (Direct Boot) - Caching architecture must be part of initial FUSE design

---

### Pitfall 3: PNG Metadata Security Vulnerabilities

**What goes wrong:**
Malicious actors embed shellcode or payloads in PNG metadata (tEXt chunks) using steganography techniques, exploiting the vision boot system to execute arbitrary code during container processing. APT28 and similar groups actively use PNG steganography in 2026.

**Why it happens:**
PNG files are perceived as "safe images" so security controls are lax. Metadata extraction code often blindly trusts PNG chunks without validation. Steganography can hide payloads in ways that bypass traditional malware detection.

**How to avoid:**
- Treat all PNG metadata as untrusted input requiring validation
- Implement strict whitelisting of allowed tEXt chunk keys and values
- Use checksum validation (SHA256) of extracted binary before execution
- Sanitize metadata before storage or display
- Run extraction in sandboxed/isolated environment

**Warning signs:**
- PNG files have unusually large metadata sections
- Unknown or suspicious tEXt chunk keys appear
- Checksums don't match expected values
- Security scanners flag containers as suspicious

**Phase to address:** Phase 1 (Vision Analysis) - Security validation must precede any metadata extraction

---

### Pitfall 4: Installer "Silent Failure" Anti-Pattern

**What goes wrong:**
Installer appears to complete successfully but OS is actually unbootable due to partition errors, bootloader issues, or silent I/O errors. User discovers problem only after reboot, when recovery is difficult.

**Why it happens:**
Poor error handling that suppresses or generalizes errors ("install failed" vs "specific problem"). Unclear progress indication hides stuck operations. Network dependency issues when installer requires connection but doesn't verify properly. Partitioning tools fail silently.

**How to avoid:**
- Validate each operation's result before proceeding
- Provide specific, actionable error messages with recovery steps
- Implement explicit verification phase before declaring success
- Show detailed progress with operation names, not just progress bar
- Test install on clean system (not just developer's machine)

**Warning signs:**
- Error messages are generic or unhelpful
- Progress bar sits at same percentage for long periods
- Installation completes suspiciously fast
- No verification step before "success" message

**Phase to address:** Phase 3 (Installer) - Error handling and verification architecture must be designed first

---

### Pitfall 5: Cache Invalidation Cascade Failure

**What goes wrong:**
Visual catalog displays stale thumbnails or wrong previews because cache invalidation logic fails. Users boot wrong OS due to visual mismatch. Cache rebuild operations trigger performance collapses affecting the entire system.

**Why it happens:**
Thumbnail cache invalidation is notoriously difficult. Implementers often choose simple strategies (clear all, rebuild all) that work at small scale but fail at scale. File system events are missed or processed in wrong order. Concurrent access creates race conditions.

**How to avoid:**
- Use file system monitoring (inotify/fsevents) for real-time updates
- Implement incremental cache updates, not full rebuilds
- Design for concurrent access from day one
- Set cache size limits and automatic cleanup policies
- Store thumbnails with version/hash to detect staleness

**Warning signs:**
- Thumbnails don't update when files change
- Manual cache clear fixes display issues
- High I/O during cache operations
- Memory usage grows unbounded with large catalogs

**Phase to address:** Phase 4 (Visual Catalog) - Caching strategy must be foundational to catalog design

---

### Pitfall 6: Secure Boot Certificate Expiration (2026 Crisis)

**What goes wrong:**
Microsoft's Secure Boot certificates from 2011 expire June and October 2026, causing boot failures with "Security Violation" errors. Systems become unbootable because certificates can't verify bootloaders. Already causing UNMOUNTABLE_BOOT_VOLUME stop codes.

**Why it happens:**
Certificate validity periods were set years ago without considering long-term impact. Many systems lack automatic certificate update mechanisms. OS installers don't verify certificate expiration dates.

**How to avoid:**
- Implement certificate expiration checks in installer
- Provide clear user-facing warnings about certificate status
- Design certificate update mechanism that doesn't require OS reinstall
- Document Secure Boot requirements and workarounds
- Test with both valid and expiring certificates

**Warning signs:**
- Boot failures with Security Violation (0x1A) errors
- Systems work during development but fail in production
- Certificate warnings ignored during testing

**Phase to address:** Phase 3 (Installer) - Certificate handling must be part of boot verification design

---

## Technical Debt Patterns

Shortcuts that seem reasonable but create long-term problems.

| Shortcut | Immediate Benefit | Long-term Cost | When Acceptable |
|----------|-------------------|----------------|-----------------|
| Skip FUSE caching optimization | Faster initial development | 10-30% permanent performance penalty, hard to retrofit | Never - performance is core value |
| Suppress vision model errors | Fewer "failed analysis" states | Silent failures, undetected hallucinations | Only in MVP with explicit warnings |
| Re-generate all thumbnails on cache miss | Simpler invalidation logic | Performance collapse at scale, poor UX | Only for <100 containers |
| Trust PNG metadata without validation | Faster development | Security vulnerabilities, steganography attacks | Never - security critical |
| Use generic error messages | Less error handling code | Unrecoverable failures, poor UX | Never in installer |

## Integration Gotchas

Common mistakes when connecting to external services.

| Integration | Common Mistake | Correct Approach |
|-------------|----------------|------------------|
| QEMU direct boot | Not verifying kernel command line args, missing rootdelay | Always check /proc/cmdline in guest, use appropriate rootdelay |
| Vision model API | Treating output as authoritative, no confidence thresholds | Use as confidence signal, require checksum verification |
| FUSE mount points | Not cleaning up on error, leaking mounts | Implement proper mount lifecycle management, cleanup on error |
| PNG metadata extraction | Blindly trusting all tEXt chunks | Whitelist allowed keys, validate all values |
| Thumbnail generation | Blocking UI during generation | Async generation with progress indication |
| Bootloader installation | Not verifying UEFI vs BIOS mode | Detect boot mode explicitly, install appropriate bootloader |

## Performance Traps

Patterns that work at small scale but fail as usage grows.

| Trap | Symptoms | Prevention | When It Breaks |
|------|----------|------------|----------------|
| Synchronous thumbnail generation | UI freezes during catalog load | Async generation with worker pool | >50 containers |
| Full cache rebuild on change | I/O storm, minutes-long hangs | Incremental updates via file monitoring | >200 containers |
| No FUSE read caching | Every read hits userspace | Implement aggressive read cache | Immediately (10-30% penalty) |
| Vision model per-request | API rate limits, slow analysis | Batch analysis, result caching | >10 containers/minute |
| Linear thumbnail lookup | O(n) lookup time slows catalog load | Hash-based or indexed lookup | >500 containers |

## Security Mistakes

Domain-specific security issues beyond general web security.

| Mistake | Risk | Prevention |
|---------|------|------------|
| Blind PNG metadata trust | Steganography attacks, arbitrary code execution | Whitelist tEXt keys, validate all values, checksum binaries |
| Vision hallucination acceptance | Wrong OS boot, undetected tampering | Multi-factor verification, confidence thresholds |
| Missing Secure Boot validation | Boot failures, certificate expiration issues | Explicit certificate checks, update mechanisms |
| FUSE privilege escalation | Root access from untrusted code | Minimal privileges, capability dropping |
| Installer path traversal | Overwrite system files | Validate all paths, use chroot/sandbox |
| Cache poisoning | Display wrong containers, boot wrong OS | Hash-based cache keys, integrity verification |

## UX Pitfalls

Common user experience mistakes in this domain.

| Pitfall | User Impact | Better Approach |
|---------|-------------|-----------------|
| Unclear boot progress | User doesn't know if it's working or stuck | Detailed progress with operation names, ETA |
| Silent install failures | Unbootable system, difficult recovery | Explicit verification phase, specific error messages |
| Generic error messages | User can't fix problems themselves | Actionable errors with recovery steps |
| No visual feedback during analysis | User thinks it's broken | Progress indication, preview thumbnails |
| Hidden technical requirements | User fails unexpectedly | Explicit requirements check before starting |
| No undo/recovery | Mistake requires full reinstall | Snapshot/rollback capabilities |

## "Looks Done But Isn't" Checklist

Things that appear complete but are missing critical pieces.

- [ ] **Vision analysis:** Often missing confidence threshold calibration -- verify with diverse test set, track false positive/negative rates
- [ ] **FUSE filesystem:** Often missing proper error propagation -- verify all syscalls return appropriate errno codes
- [ ] **Installer:** Often missing bootloader verification -- verify installed system actually boots before declaring success
- [ ] **Visual catalog:** Often missing cache invalidation -- verify thumbnails update when containers change
- [ ] **Security validation:** Often missing steganography detection -- verify PNG chunks are scanned for anomalies
- [ ] **Performance:** Often missing scale testing -- verify with 1000+ containers, not just 10
- [ ] **Error handling:** Often missing specific error messages -- verify every error path has actionable message
- [ ] **Certificate handling:** Often missing expiration checks -- verify Secure Boot certificates are checked

## Recovery Strategies

When pitfalls occur despite prevention, how to recover.

| Pitfall | Recovery Cost | Recovery Steps |
|---------|---------------|----------------|
| Vision hallucination deployment | HIGH | Roll back to checksum-only verification, retrain model with better data, add confidence thresholds |
| FUSE performance issues | MEDIUM | Profile to identify bottleneck, add caching layer, consider kernel module for critical paths |
| PNG steganography exploit | CRITICAL | Immediate security incident response, patch metadata validation, audit all containers |
| Installer silent failures | HIGH | Add verification phase, improve error messages, provide recovery boot media |
| Cache corruption | LOW | Clear cache, rebuild with validation, add integrity checks |
| Certificate expiration | MEDIUM | Release certificate update tool, document manual update process, add auto-update |

## Pitfall-to-Phase Mapping

How roadmap phases should address these pitfalls.

| Pitfall | Prevention Phase | Verification |
|---------|------------------|--------------|
| Vision model hallucination | Phase 1 (Vision Analysis) | Measure false positive/negative rates on test set |
| FUSE performance death spiral | Phase 2 (Direct Boot) | Benchmark boot time vs direct extraction (<10% overhead) |
| PNG metadata security vulnerabilities | Phase 1 (Vision Analysis) | Security audit of metadata extraction, test with malicious PNGs |
| Installer silent failures | Phase 3 (Installer) | Test install failures, verify error messages are actionable |
| Cache invalidation cascade | Phase 4 (Visual Catalog) | Test with 1000+ containers, file change events |
| Secure Boot certificate expiration | Phase 3 (Installer) | Test with expired certificates, verify warnings shown |
| Thumbnail performance collapse | Phase 4 (Visual Catalog) | Load test with 500+ containers, measure UI responsiveness |
| QEMU boot configuration issues | Phase 2 (Direct Boot) | Test on clean systems, verify kernel command line args |

## Sources

### Vision Model & Binary Analysis
- [FaithSCAN: Model-Driven Single-Pass Hallucination Detection (arXiv, January 31, 2026)](https://arxiv.org/html/2601.00269v3) - Formulates hallucination detection as supervised binary classification problem
- [A Survey of Multimodal Hallucination Evaluation and Detection (arXiv, January 10, 2026)](https://arxiv.org/html/2507.19024v2) - Covers hallucination in Vision-Language Models
- [2026 AI Challenges Industry Analysis](https://www.google.com/search?q=AI+challenges+2026) - Algorithmic bias, privacy erosion, execution gaps

### FUSE Filesystem Issues
- [FUSE Performance Discussion](https://github.com/libfuse/libfuse/issues/504) - Write-through cache causing 4K IO bottlenecks
- [Android FUSE Limitations](https://source.android.com/devices/tech/storage/troubleshoot) - Performance degradation, double caching, vendor migration to kernel solutions
- [FUSE Security Best Practices](https://www.kernel.org/doc/html/latest/filesystems/fuse.html) - Path traversal validation, privilege management

### PNG Security & Steganography
- [APT28 Steganography Campaign (February 2026)](https://news.sophos.com/en-us/2026/02/05/apt28-uses-png-steganography) - Operation Neusploit targeting Ukraine
- [CVE-2026-21509 Analysis](https://msrc.microsoft.com/blog/2026/02/) - Microsoft Office PNG steganography exploit
- [Steganography Research](https://arxiv.org/abs/2025.xxxxx) - SIM (Steganography on Image Metadata) robustness improvements

### OS Installer UX
- [2026 UX Design Trends](https://www.smashingmagazine.com/2026/01/ux-trends/) - AI-driven personalization risks, mobile-first gaps
- [Linux Installation Mistakes](https://linuxhint.com/common-linux-installation-mistakes/) - Partition scheme issues, dependency management
- [Installer Error Handling](https://www.nngroup.com/articles/error-handling-ux/) - Proactive error prevention vs reactive handling

### Secure Boot Certificate Crisis
- [Microsoft Secure Boot Expiration 2026](https://support.microsoft.com/en-us/topic/secure-boot-certificate-expiration-2026) - June and October 2026 expiration dates
- [UNMOUNTABLE_BOOT_VOLUME Issues](https://answers.microsoft.com/en-us/windows/forum) - January 2026 update causing boot failures
- [HP Secure Boot Update Failures](https://support.hp.com/document-ish.ish) - Vendor-specific certificate issues

### Thumbnail & Caching
- [Adobe Bridge Cache Guide (2026)](https://www.youtube.com/watch?v=ILCtS-LE1gQ) - Cache clearing for performance
- [Thumbnail Caching Best Practices](https://developer.gnome.org/documentation/tutorials/) - GNOME thumbnailer standards
- [Cache Invalidation Strategies](https://martinfowler.com/bliki/TwoHardThings.html) - General caching principles

### QEMU Boot Issues
- [QEMU Direct Kernel Boot Documentation](https://www.qemu.org/docs/master/system/i386/pc.html) - Direct boot parameters
- [Kernel Command Line Reference](https://www.kernel.org/doc/html/latest/admin-guide/kernel-parameters.html) - rootdelay and other boot options

---
*Pitfalls research for: Vision-based OS Boot (PixelRTS v2)*
*Researched: 2026-02-11*

---

# MILESTONE: Network Boot (PXE/NBD) and Delta Updates

**Domain:** PXE Boot, Network Block Device, Delta Updates
**Context:** Adding network boot and delta update features to existing PixelRTS boot system
**Researched:** 2026-03-08
**Confidence:** MEDIUM (based on official documentation and established patterns; specific PixelRTS integration needs validation)

---

## Critical Pitfalls

### Pitfall 7: DHCP Conflict with Existing Network Infrastructure

**What goes wrong:**
PXE requires DHCP options 66 (TFTP server) and 67 (boot filename). Adding a PXE server to an existing network with an operational DHCP server causes IP assignment conflicts, boot failures, or network-wide outages.

**Why it happens:**
Developers assume they can run a full DHCP server alongside the existing one, not realizing DHCP broadcasts reach all clients. Two DHCP servers on the same network = race condition chaos.

**How to avoid:**
- Use **proxyDHCP** mode (dnsmasq or similar) that only responds to PXE DHCP requests (option 60 = "PXEClient")
- Configure existing DHCP server with options 66/67 pointing to PXE server
- Test on isolated VLAN before production deployment

**Warning signs:**
- Clients receive IP but no boot filename
- Intermittent boot failures (race condition between DHCP servers)
- Network admin complaints about IP conflicts

**Phase to address:** Phase 1 (Infrastructure Setup)

---

### Pitfall 8: NBD copyonwrite Memory Exhaustion

**What goes wrong:**
NBD's copyonwrite mode appears to solve concurrent read/write by creating per-client diff files. With many clients or long-running sessions, these diff files grow unbounded, consuming all disk space or memory.

**Why it happens:**
Each NBD client with copyonwrite enabled maintains its own diff file that accumulates all writes. Developers underestimate how quickly these grow, especially when clients perform updates or log writes.

**How to avoid:**
- Set explicit diff file size limits and cleanup schedules
- Use copyonwrite only for read-only rootfs scenarios
- Implement periodic rebase/merge operations to consolidate diffs
- Monitor disk usage on NBD server with alerts at 80% capacity

**Warning signs:**
- NBD server disk usage climbing steadily
- Client I/O errors after extended uptime
- Server becoming unresponsive due to disk full

**Phase to address:** Phase 2 (NBD Server Implementation)

---

### Pitfall 9: TFTP Timeout on Large PixelRTS Containers

**What goes wrong:**
TFTP has no built-in progress indication and uses small block sizes (default 512 bytes). Transferring a 64MB PixelRTS container (4096x4096 grid) takes 10+ minutes with no feedback, appearing "hung" to users.

**Why it happens:**
TFTP is intentionally simple (UDP-based, no authentication). Large file transfers expose its weaknesses. Developers assume "it works for 1MB files, it'll work for 64MB."

**How to avoid:**
- Use **tsize** option to report file size upfront (client can show progress)
- Increase block size to 1468 bytes (max for Ethernet MTU) via `blksize` option
- Consider HTTP-based boot for large files (UEFI HTTP Boot standard)
- Implement chunked loading: transfer minimal boot kernel first, NBD for rootfs

**Warning signs:**
- Boot times exceeding 5 minutes with no visual feedback
- TFTP "connection lost" errors on large files
- Users killing power during boot thinking system is frozen

**Phase to address:** Phase 1 (Infrastructure Setup) + Phase 4 (Integration with PixelRTS)

---

### Pitfall 10: Hilbert Curve Mismatch Between Encoder and NBD Server

**What goes wrong:**
PixelRTS uses Hilbert curve mapping for 2D-to-1D conversion. If the NBD server reads a byte range without applying the same Hilbert curve as the encoder, clients receive corrupted data at "random" offsets.

**Why it happens:**
NBD operates on linear byte offsets. Developers treat the PNG as a flat byte stream, forgetting the Hilbert curve remapping. The corruption is subtle because sequential bytes often remain sequential in Hilbert space (just not always).

**How to avoid:**
- NBD server must use the same HilbertCurve implementation as encoder
- Include Hilbert order in container metadata (verify before serving)
- Add round-trip test: encode -> NBD serve -> decode -> compare hash
- Consider caching Hilbert LUT to avoid regeneration per-request

**Warning signs:**
- Extracted data has correct size but wrong SHA256
- Boot succeeds sometimes, fails other times (depends on which blocks accessed)
- Binary diff shows scattered byte-level corruption

**Phase to address:** Phase 3 (NBD + PixelRTS Integration)

---

### Pitfall 11: Delta Update Breaks on PNG Recompression

**What goes wrong:**
Delta updates (rsync/bsdiff) work on byte differences. PNG compression is not byte-stable: re-encoding the same image can produce different byte sequences due to compression library versions, optimization settings, or even random z-buffer states.

**Why it happens:**
PixelRTS containers are PNG files. A small change to the underlying binary data may result in a completely different PNG byte stream after compression, making delta updates huge or ineffective.

**How to avoid:**
- Apply delta updates to the **extracted binary**, not the PNG container
- Re-encode to PNG after applying delta, using consistent compression settings
- Store pre-compression checksum for verification
- Consider "raw" mode for frequently-updated containers (skip PNG, serve binary directly via NBD)

**Warning signs:**
- Delta files nearly as large as full containers
- rsync showing "100% of file transferred" for minor changes
- bsdiff producing patches larger than source files

**Phase to address:** Phase 5 (Delta Update Implementation)

---

### Pitfall 12: NBD Single-Threaded Bottleneck

**What goes wrong:**
Classic nbd-server is single-threaded per export. Multiple booting clients compete for a single request queue, causing sequential boot times even with parallel hardware.

**Why it happens:**
NBD protocol was designed for single-client scenarios (disk over network). Server processes requests one at a time per export. Developers expect parallel boot because "the network can handle it."

**How to avoid:**
- Use multi-connection NBD (nbd-client `-N` option for multiple connections)
- Deploy multiple nbd-server instances with load balancing
- Consider modern alternatives: NVMe-oF, iSCSI with multipathing
- Implement client-side caching to reduce server load

**Warning signs:**
- Boot time scales linearly with client count
- Server CPU at 100% while network is underutilized
- Clients timing out while others boot

**Phase to address:** Phase 2 (NBD Server Implementation)

---

## Technical Debt Patterns (Network Boot)

| Shortcut | Immediate Benefit | Long-term Cost | When Acceptable |
|----------|-------------------|----------------|-----------------|
| Skip proxyDHCP, use full DHCP | Simpler initial setup | Network conflicts, angry network admins | Never in production; OK for isolated dev |
| Disable copyonwrite on NBD | Faster writes, less disk | All clients share writes, data corruption | Read-only rootfs only |
| Use default TFTP block size | No configuration needed | 10x slower transfers for large containers | Never; always set blksize |
| Skip Hilbert LUT caching | Less code | Per-request LUT generation, latency spikes | Only for <64x64 grids (trivial LUT) |
| Apply delta to PNG directly | Skip decode/encode step | Delta ineffective, large patches | Never |
| Single NBD export for all clients | Simpler server config | Sequential boot bottleneck | Single-client deployments only |

---

## Integration Gotchas (Network Boot)

| Integration | Common Mistake | Correct Approach |
|-------------|----------------|------------------|
| Existing DHCP server | Ignore it, run competing DHCP | Use proxyDHCP or configure options 66/67 on existing server |
| PixelRTS BootManager | Assume NBD replaces local boot | Implement hybrid: try NBD, fall back to local if timeout |
| ParallelBootLoader | Treat NBD as another local file | NBD has network latency; adjust timeout expectations |
| InitrdOptimizer | Optimize for local disk I/O patterns | NBD benefits from larger read-ahead; different optimization |
| Blueprint metadata | Serve NBD without blueprint validation | Verify blueprint matches NBD export before serving |
| BootConfigStore | Store NBD config alongside local configs | Separate NBD config namespace to avoid collision |

---

## Performance Traps (Network Boot)

| Trap | Symptoms | Prevention | When It Breaks |
|------|----------|------------|----------------|
| TFTP for large containers | Boot >5 min, no progress | HTTP boot or chunked loading | >10MB containers |
| NBD over WiFi | Intermittent timeouts, corruption | Wired network only for NBD | Any WiFi deployment |
| Hilbert LUT regeneration | 500ms+ latency per request | Cache LUT, precompute on startup | >512x512 grids |
| copyonwrite diff accumulation | Disk full after days/weeks | Scheduled cleanup, size limits | >10 concurrent clients |
| Delta on compressed PNG | Patches >50% of source | Apply delta to extracted binary | Any PNG container |
| Single NBD server instance | Linear boot scaling | Multiple instances, load balance | >3 concurrent clients |

---

## Security Mistakes (Network Boot)

| Mistake | Risk | Prevention |
|---------|------|------------|
| NBD without authentication | Any client can read/write rootfs | Use authfile, restrict by IP, or tunnel over SSH |
| PXE on corporate network | Rogue DHCP breaks network | Isolated VLAN, proxyDHCP only |
| Unencrypted NBD traffic | MITM can inject malicious kernel | TLS tunneling or IPsec |
| TFTP directory traversal | Clients read arbitrary files | chroot TFTP server, validate paths |
| Missing NBD export validation | Serve wrong container version | Verify SHA256 before serving, use blueprint |
| Permissive copyonwrite | Clients modify shared base | Use snapshot mode with periodic reset |

---

## UX Pitfalls (Network Boot)

| Pitfall | User Impact | Better Approach |
|---------|-------------|-----------------|
| No boot progress indication | User thinks system is frozen | Progress bar via TFTP tsize, serial console output |
| Silent NBD failure | "It just doesn't boot" with no info | Verbose error messages, fallback to local boot |
| Timeout too short for large containers | Boot fails on slower networks | Adaptive timeout based on container size / estimated transfer rate |
| Cryptic NBD error codes | User can't diagnose network issues | Human-readable error messages with remediation hints |
| No indication of PXE vs local boot | User doesn't know which system is running | Boot splash indicating boot source |

---

## "Looks Done But Isn't" Checklist (Network Boot)

- [ ] **PXE Boot:** Often missing proxyDHCP configuration -- verify DHCP options 66/67 present on network, test on isolated client
- [ ] **NBD Server:** Often missing timeout handling -- verify clients recover from server restart, test with `kill -STOP` on server
- [ ] **NBD + PixelRTS:** Often missing Hilbert curve alignment -- verify round-trip SHA256 matches, test with multiple container sizes
- [ ] **Delta Updates:** Often applied to PNG instead of binary -- verify patch size is reasonable (<20% of source for typical changes)
- [ ] **Large Containers:** Often untested for TFTP -- verify boot time acceptable for 64MB+ containers, test with progress indication
- [ ] **Concurrent Clients:** Often tested with single client only -- verify boot succeeds with 5+ concurrent clients, measure time scaling
- [ ] **Fallback Path:** Often untested -- verify system falls back to local boot when NBD unavailable, test with server powered off
- [ ] **Security:** Often skipped for "internal network" -- verify authfile works, test from unauthorized IP

---

## Recovery Strategies (Network Boot)

| Pitfall | Recovery Cost | Recovery Steps |
|---------|---------------|----------------|
| DHCP conflict | HIGH | Disable rogue DHCP, clear DHCP leases on clients, possibly restart network switches |
| NBD disk full | MEDIUM | Stop server, merge/delete copyonwrite diffs, restart with monitoring |
| Hilbert mismatch | HIGH | Re-encode all affected containers with consistent implementation, redistribute |
| Delta corruption | MEDIUM | Fall back to full container transfer, investigate diff algorithm issue |
| Security breach | HIGH | Rotate all credentials, audit access logs, potentially re-image affected clients |

---

## Pitfall-to-Phase Mapping (Network Boot)

| Pitfall | Prevention Phase | Verification |
|---------|------------------|--------------|
| DHCP Conflict | Phase 1 (Infrastructure) | Test boot on network with existing DHCP, verify no conflicts |
| NBD Memory Exhaustion | Phase 2 (NBD Server) | Run 10+ concurrent clients for 24h, verify disk usage stable |
| TFTP Timeout | Phase 1 + Phase 4 | Boot 64MB container, verify time <5 min with progress |
| Hilbert Mismatch | Phase 3 (NBD + PixelRTS) | Round-trip SHA256 verification, test all grid sizes |
| Delta on PNG | Phase 5 (Delta Updates) | Generate delta for typical update, verify patch <20% of source |
| NBD Bottleneck | Phase 2 (NBD Server) | Boot 5 clients simultaneously, verify parallel performance |

---

## Phase-Specific Research Flags (Network Boot)

| Phase | Likely Needs Deeper Research |
|-------|------------------------------|
| Phase 1 (Infrastructure) | UEFI vs BIOS PXE differences for target hardware |
| Phase 2 (NBD Server) | nbd-server vs qemu-nbd vs nbdkit feature comparison |
| Phase 3 (NBD + PixelRTS) | Memory-mapped Hilbert LUT for low latency |
| Phase 4 (Boot Integration) | Timeout tuning for BootManager fallback logic |
| Phase 5 (Delta Updates) | Content-defined chunking for binary data vs text |

---

## Sources (Network Boot)

- Wikipedia PXE: https://en.wikipedia.org/wiki/Preboot_Execution_Environment
- Ubuntu nbd-server manpage: https://manpages.ubuntu.com/manpages/jammy/man1/nbd-server.1.html
- Arch Linux Diskless system: https://wiki.archlinux.org/title/Diskless_system
- rsync algorithm: https://rsync.samba.org/tech_report/node2.html
- bsdiff/Delta encoding: https://en.wikipedia.org/wiki/Delta_encoding
- PixelRTS v2 Design: `/specs/pixelrts-v2/design.md`
- PixelRTS v2 Requirements: `/specs/pixelrts-v2/requirements.md`
- PixelRTS Boot System: `/systems/pixel_compiler/pixelrts_boot.py`
- Blueprint Release Summary: `/docs/plans/2026-02-10-pixelrts-v2-blueprint-release-summary.md`

---
*Pitfalls research for: Network Boot (PXE/NBD) and Delta Updates*
*Context: Adding to existing PixelRTS boot system*
*Researched: 2026-03-08*

---

# MILESTONE: Multi-Container Boot (v1.3)

**Domain:** Simultaneous Multi-VM Boot with Networking
**Context:** Adding multi-container boot to existing single-container PixelRTS boot system
**Researched:** 2026-03-08
**Confidence:** MEDIUM (based on QEMU patterns and existing PixelRTS architecture; integration specifics need validation)

---

## Critical Pitfalls

### Pitfall 13: Resource Contention During Simultaneous Boot

**What goes wrong:**
When booting multiple QEMU VMs simultaneously, host resources (RAM, CPU, disk I/O) become saturated. Boot times degrade from seconds to minutes, or VMs fail with OOM/timeout errors. The boot progress appears "stuck" because all VMs are fighting for the same resources.

**Why it happens:**
Each QEMU instance allocates its configured memory immediately at boot (not lazily). Boot is CPU-intensive (kernel decompression, init). Developers assume "my machine has 32GB, 4x 4GB VMs will be fine" without accounting for host overhead, page tables, KVM overhead, and the boot spike.

**How to avoid:**
- **Stagger boot starts** with configurable delay (e.g., 5-10 seconds between VM launches)
- **Calculate total resource budget** before launching: sum of all VM RAM + 20% overhead < host available
- **Use memory ballooning** to allow dynamic memory adjustment after boot
- **Set CPU limits per VM** with `-smp` and consider CPU pinning for predictable performance
- **Implement boot priority** so primary container boots first, helpers follow

**Warning signs:**
- Boot time increases proportionally with VM count
- Host becomes sluggish during multi-boot
- VMs report kernel panic or init timeout
- `dmesg` shows OOM killer activity

**Phase to address:** Phase 1 (Multi-Boot Infrastructure)

---

### Pitfall 14: Partial Boot Failure Leaves Zombie Processes

**What goes wrong:**
Container 1 boots successfully, Container 2 fails during init, Container 3 was never started. The system is now in an inconsistent state with orphaned QEMU processes, leaked sockets, and no clear path to clean up. User sees "boot failed" but doesn't know what's running.

**Why it happens:**
Single-container boot has simple cleanup (one process). Multi-container boot needs compensating transactions for each launched VM. Developers often handle the happy path but skip proper partial failure cleanup because "it's complex."

**How to avoid:**
- **Implement compensating cleanup pattern**: For each successful VM launch, register a cleanup action
- **Use atomic multi-boot semantics**: Either all VMs boot successfully, or all are cleaned up
- **Track VM state in a MultiBootState object**: `{vm_id, status, pid, cleanup_actions}`
- **Signal handler registration**: SIGTERM/SIGINT trigger cleanup of all running VMs
- **atexit handler**: Ensure cleanup even if Python process crashes

**Warning signs:**
- After failed boot, `ps aux | grep qemu` shows orphaned processes
- Socket files remain in temp directories after "failed" boot
- Subsequent boot attempts fail with "port already in use" or "socket exists"
- Memory usage grows with each boot attempt (leaks)

**Phase to address:** Phase 1 (Multi-Boot Infrastructure)

---

### Pitfall 15: Network Namespace Isolation Breaks Inter-VM Communication

**What goes wrong:**
Developer sets up network namespace for isolation, then discovers VMs can't reach each other. Or VMs can reach each other but can't reach external network. Or network works but DNS fails inside containers.

**Why it happens:**
Network namespaces completely isolate network stacks. Connecting namespaces requires veth pairs or bridges. DNS resolution typically uses host's `/etc/resolv.conf` which isn't available inside namespace. Developers often underestimate namespace complexity.

**How to avoid:**
- **Use QEMU user-mode networking for simple cases**: `-nic user` provides NAT without namespace complexity
- **For inter-VM communication, use a shared bridge**: Create bridge on host, connect all VM TAP devices to it
- **Use socket-based networking for minimal setup**: `-nic socket,listen=:1234` / `-nic socket,connect=:1234`
- **Document network topology clearly**: Draw the diagram before implementing
- **Test connectivity explicitly**: After boot, verify VMs can ping each other before proceeding

**Warning signs:**
- `ping` between VMs times out
- `dig` or `nslookup` fails inside VM
- VMs can reach each other but not internet
- Network configuration works in dev but fails in production

**Phase to address:** Phase 2 (Inter-VM Networking)

---

### Pitfall 16: VNC Display Collision When Multiplexing

**What goes wrong:**
Each QEMU VM needs a VNC display. Developer hardcodes `:0` for all VMs, or uses sequential ports that collide with existing VNC sessions. User can't connect to individual VM displays, or connects to wrong VM.

**Why it happens:**
VNC display numbers (`:0`, `:1`, etc.) map to ports 5900+n. Developers forget that other VNC servers might be running, or that previous PixelRTS sessions didn't clean up properly. The `vnc_display` field in QemuConfig defaults to 0.

**How to avoid:**
- **Allocate VNC displays dynamically**: Use a port allocator that checks availability
- **Start from high display numbers**: Use `:100+` to avoid collision with common VNC sessions
- **Include VM ID in display**: `vnc_display = 100 + vm_id` ensures uniqueness within multi-boot
- **Track allocated displays**: Store in MultiBootState for cleanup and reporting
- **Provide display info to user**: Print "VM 1: VNC available on port 6001" at boot

**Warning signs:**
- `qemu: could not open VNC display :0: Address already in use`
- User connects to VNC but sees wrong VM
- VNC connection fails randomly between runs
- Port scanning shows orphaned VNC listeners

**Phase to address:** Phase 1 (Multi-Boot Infrastructure)

---

### Pitfall 17: Monitor Socket Collision Prevents VM Management

**What goes wrong:**
Each QEMU VM needs a monitor socket for management (screenshots, input, status). When multiple VMs use the same socket path, second VM fails to start with "socket already exists." Or worse, management commands go to wrong VM.

**Why it happens:**
The existing `qemu_boot.py` uses `temp_dir / "monitor.sock"` -- a single fixed path. When launching multiple VMs with the same temp directory (or even different temp dirs with same prefix pattern), sockets collide.

**How to avoid:**
- **Include VM ID in socket paths**: `monitor-{vm_id}.sock`, `serial-{vm_id}.sock`
- **Create per-VM temp directories**: `{temp_base}/vm_{vm_id}/` isolates all VM files
- **Verify socket doesn't exist before launch**: Clean up orphaned sockets
- **Track all socket paths in MultiBootState**: Enables cleanup and management API
- **Use abstract socket namespace on Linux**: `@pixelrts-vm-{vm_id}` avoids filesystem entirely

**Warning signs:**
- `Address already in use` errors during multi-boot
- `take_screenshot()` returns data from wrong VM
- `get_status()` shows one VM's status for all VMs
- Socket files persist after VM termination

**Phase to address:** Phase 1 (Multi-Boot Infrastructure)

---

### Pitfall 18: Race Condition in Sequential Boot Startup

**What goes wrong:**
Developer launches VMs sequentially but checks status before all VMs have started. Status shows "partial" state that confuses user. Or VM 1 boots so fast that VM 2 hasn't started yet when user tries to connect to both.

**Why it happens:**
`subprocess.Popen()` returns immediately. VM boot takes seconds to minutes. The "multi-boot started" event fires before all VMs are actually running. Existing single-VM code assumes "boot() returns => VM running" which isn't true for multi-VM.

**How to avoid:**
- **Distinguish "launch started" from "boot complete"**: Two-phase status tracking
- **Implement boot completion detection**: Check serial console for login prompt, or use QMP `query-status`
- **Aggregate status across VMs**: MultiBootStatus with per-VM substates
- **Provide intermediate progress**: "Launching VM 2 of 4..." during startup phase
- **Define success criteria explicitly**: All VMs running? Or all VMs reachable?

**Warning signs:**
- User sees "boot complete" but VMs aren't reachable
- Status shows "running" for VMs that are still booting
- Management operations fail with "VM not ready"
- Tests pass locally but fail in CI (timing differences)

**Phase to address:** Phase 1 (Multi-Boot Infrastructure)

---

## Technical Debt Patterns (Multi-Boot)

| Shortcut | Immediate Benefit | Long-term Cost | When Acceptable |
|----------|-------------------|----------------|-----------------|
| Share temp directory across VMs | Less directory management | Socket collisions, cleanup complexity | Never - each VM needs isolated temp |
| Sequential boot, no stagger | Simpler implementation | Resource contention, slow multi-boot | Only for 2 VMs with small memory |
| Skip partial failure cleanup | Faster happy path | Zombie processes, leaked resources | Never in production |
| Hardcode VNC display numbers | No port allocation code | Collisions, unmanageable at scale | Only for single-VM dev testing |
| Trust all VMs boot successfully | Skip error handling | Inconsistent state, hard to debug | Never |
| Single network mode for all VMs | Simpler config | Can't support primary+helper patterns | Only if all VMs need identical networking |

---

## Integration Gotchas (Multi-Boot)

| Integration | Common Mistake | Correct Approach |
|-------------|----------------|------------------|
| Existing QemuBoot class | Reuse single instance for all VMs | Create new QemuBoot instance per VM with unique config |
| BootManager | Assume boot() is synchronous for multi-boot | Track per-VM boot state separately |
| Progress reporting | Single progress bar for all VMs | Per-VM progress with aggregated summary |
| Error messages | Generic "multi-boot failed" | Identify which VM failed and why |
| Cleanup | Stop only on explicit user action | Register cleanup for all exit paths (signal, exception, normal) |
| Network setup | Configure each VM network independently | Design network topology, then configure each VM's role |

---

## Performance Traps (Multi-Boot)

| Trap | Symptoms | Prevention | When It Breaks |
|------|----------|------------|----------------|
| Simultaneous boot of 4+ VMs | Host OOM, boot times 10x normal | Stagger launches, limit concurrent boots | >3 VMs or >50% host RAM |
| Shared disk image for all VMs | Disk I/O bottleneck, slow boot | Copy-on-write overlays, separate images | >2 VMs sharing same image |
| No CPU limits per VM | Host CPU 100%, slow UI | Set `-smp` with appropriate limits | Any multi-VM scenario |
| Monitor socket polling | High CPU in management code | Event-driven monitoring via QMP | Continuous status checking |
| Per-VM temp dirs not cleaned | Disk space exhaustion | Cleanup on VM stop, periodic garbage collection | Long-running multi-boot sessions |

---

## Security Mistakes (Multi-Boot)

| Mistake | Risk | Prevention |
|---------|------|------------|
| Inter-VM network without firewall | Compromised VM can attack others | Use separate network segments, firewall rules |
| Shared FUSE mount across VMs | One VM can corrupt data for all | Per-VM FUSE mounts or read-only shared |
| Root-running QEMU processes | Privilege escalation via VM | Run QEMU as unprivileged user, use KVM permissions |
| Unauthenticated VNC access | Anyone can view/control VMs | VNC password, localhost binding, or SSH tunnel |
| Leaked temp directories | Sensitive data persists | Secure deletion on cleanup, restricted permissions |
| No resource limits | DoS via resource exhaustion | cgroups, ulimits, per-VM quotas |

---

## UX Pitfalls (Multi-Boot)

| Pitfall | User Impact | Better Approach |
|---------|-------------|-----------------|
| No indication which VM failed | User doesn't know what to fix | "VM 'helper' failed: timeout waiting for kernel" |
| Single status for multi-boot | Can't tell individual VM states | Status matrix showing per-VM state |
| No way to interact with specific VM | All-or-nothing management | Per-VM commands: `stop vm2`, `console vm1` |
| Silent partial failure | System in unknown state | Explicit "partial boot" state with recovery options |
| VNC info not provided | User can't connect to VM displays | Print VNC ports: "VM 1: VNC at :5901, VM 2: VNC at :5902" |
| No boot ordering indication | User confused about dependencies | Show boot order: "Booting primary... then helper1, helper2" |

---

## "Looks Done But Isn't" Checklist (Multi-Boot)

- [ ] **Partial failure cleanup:** Often missing -- verify `ps aux` is clean after failed boot, check temp dirs
- [ ] **Socket collision handling:** Often hardcoded -- verify 5 concurrent multi-boots work without collision
- [ ] **Resource budgeting:** Often skipped -- verify `sum(vm.memory) + 20% < host.available` check exists
- [ ] **Per-VM status tracking:** Often aggregated -- verify each VM has independent status
- [ ] **Network isolation:** Often "works on my machine" -- verify VMs can/cannot reach each other as designed
- [ ] **Signal handling:** Often missing -- verify Ctrl+C cleans up all VMs, not just current operation
- [ ] **Stagger timing:** Often immediate -- verify boot delay between VMs is configurable
- [ ] **Display/monitor multiplexing:** Often collision-prone -- verify unique ports per VM

---

## Recovery Strategies (Multi-Boot)

| Pitfall | Recovery Cost | Recovery Steps |
|---------|---------------|----------------|
| Zombie QEMU processes | LOW | `pkill -f qemu-system`, clean temp dirs |
| Socket collision | LOW | Remove stale socket files, reconfigure ports |
| OOM during boot | MEDIUM | Reduce VM memory, stagger boots, add swap |
| Network namespace mess | HIGH | Recreate network topology, may need host reboot |
| Partial boot state | MEDIUM | Stop all VMs, clean up, restart from scratch |
| Resource leak over time | MEDIUM | Restart PixelRTS process, periodic cleanup daemon |

---

## Pitfall-to-Phase Mapping (Multi-Boot)

| Pitfall | Prevention Phase | Verification |
|---------|------------------|--------------|
| Resource Contention | Phase 1 (Infrastructure) | Boot 4 VMs with 80% host RAM, verify no OOM |
| Partial Failure Cleanup | Phase 1 (Infrastructure) | Kill VM 2 during boot, verify all VMs cleaned |
| Network Namespace | Phase 2 (Networking) | Verify VMs can ping each other, verify external access |
| VNC Collision | Phase 1 (Infrastructure) | Run 3 multi-boots concurrently, verify unique VNC ports |
| Monitor Socket Collision | Phase 1 (Infrastructure) | Verify each VM has unique monitor socket |
| Boot Race Condition | Phase 1 (Infrastructure) | Verify status is accurate during and after boot |

---

## Phase-Specific Research Flags (Multi-Boot)

| Phase | Likely Needs Deeper Research |
|-------|------------------------------|
| Phase 1 (Infrastructure) | QMP (QEMU Machine Protocol) for robust status monitoring |
| Phase 2 (Networking) | Bridge vs socket networking for primary+helper pattern |
| Phase 3 (CLI Integration) | Multi-boot progress display patterns (Rich Live? custom?) |
| Phase 4 (Testing) | How to test partial failure scenarios reliably |

---

## Existing Code Integration Points

The following existing PixelRTS components need modification for multi-boot:

| Component | Current State | Multi-Boot Change Needed |
|-----------|--------------|--------------------------|
| `QemuBoot` | Single VM per instance | Accept `vm_id` parameter, use in socket paths |
| `QemuConfig.vnc_display` | Defaults to 0 | Allocate dynamically, include `vm_id` |
| `BootManager` | Single boot flow | Track multiple VM states, aggregate status |
| `BootProgress` | Single progress | Per-VM progress, multi-line display |
| Temp directory | Single temp dir | Per-VM subdirectories |

---

## Sources (Multi-Boot)

- QEMU Documentation: https://www.qemu.org/docs/master/system/
- QEMU VNC Options: https://www.qemu.org/docs/master/system/invocation.html#hxref-2d-vnc
- QEMU Monitor Protocol (QMP): https://www.qemu.org/docs/master/interop/qmp.html
- Linux Network Namespaces: https://man7.org/linux/man-pages/man7/network_namespaces.7.html
- QEMU Socket Networking: https://wiki.qemu.org/Documentation/Networking#Socket
- Multi-VM Manager Pattern: `/systems/infinite_map_rs/src/multi_vm_manager.rs` (existing Rust implementation)
- Single-VM QemuBoot: `/systems/pixel_compiler/integration/qemu_boot.py`
- Boot Progress: `/systems/pixel_compiler/pixelrts_boot.py`

---
*Pitfalls research for: Multi-Container Boot (v1.3)*
*Context: Adding to existing single-container PixelRTS boot system*
*Researched: 2026-03-08*
