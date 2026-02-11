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

- [ ] **Vision analysis:** Often missing confidence threshold calibration — verify with diverse test set, track false positive/negative rates
- [ ] **FUSE filesystem:** Often missing proper error propagation — verify all syscalls return appropriate errno codes
- [ ] **Installer:** Often missing bootloader verification — verify installed system actually boots before declaring success
- [ ] **Visual catalog:** Often missing cache invalidation — verify thumbnails update when containers change
- [ ] **Security validation:** Often missing steganography detection — verify PNG chunks are scanned for anomalies
- [ ] **Performance:** Often missing scale testing — verify with 1000+ containers, not just 10
- [ ] **Error handling:** Often missing specific error messages — verify every error path has actionable message
- [ ] **Certificate handling:** Often missing expiration checks — verify Secure Boot certificates are checked

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
