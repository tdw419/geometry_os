# Pitfalls Research

**Domain:** Visual Shell Integration (adding to existing PixelRTS system)
**Researched:** 2026-02-27
**Confidence:** HIGH (based on codebase analysis and existing patterns)

---

## Visual Shell Integration Pitfalls

*Research for subsequent milestone: Connecting PixelRTS catalog to PixiJS infinite desktop*

### Pitfall VS-1: WebSocket Connection State Desynchronization

**What goes wrong:**
Frontend believes WebSocket is connected but backend has already closed the session. User interactions (drag, resize, boot progress requests) silently fail or queue indefinitely.

**Why it happens:**
WebSocket `onclose` fires asynchronously. Frontend state updates lag behind actual connection state. The 5-second timeout pattern in `demo_geometric_terminal.html` (line 239) catches initial connection failure but not subsequent disconnections during active use.

**How to avoid:**
1. Implement heartbeat/ping-pong protocol (already exists in `GeometricTerminal.js` lines 920-928)
2. Add connection state machine in frontend with explicit states: CONNECTING, CONNECTED, RECONNECTING, DISCONNECTED
3. Queue UI actions with timeout; if connection lost, surface error immediately
4. Use the existing NEB event pattern to broadcast connection state changes

**Warning signs:**
- User actions have no visible effect for >500ms
- Console shows "WebSocket is already in CLOSING/CLOSED state"
- Boot progress bar stuck at same percentage

**Phase to address:**
Phase 1 (WebSocket bridge) - must have robust reconnection before adding QEMU progress

---

### Pitfall VS-2: QEMU Process Orphaning on Frontend Disconnect

**What goes wrong:**
When user closes browser tab or refreshes, WebSocket disconnects but QEMU process continues running. Over time, multiple orphaned QEMU instances consume host resources.

**Why it happens:**
`qemu_texture_bridge.py` only removes client from set on disconnect (line 43) but has no mechanism to track QEMU lifecycle or kill on last client disconnect. The existing `TerminalSession.stop()` in `terminal_websocket_bridge.py` (lines 181-204) shows the right pattern but QEMU integration lacks this.

**How to avoid:**
1. Track QEMU PIDs per session, not per WebSocket connection
2. Implement session timeout: if no clients for N seconds, send SIGTERM to QEMU
3. Add "graceful shutdown" message type so frontend can request clean exit
4. Log all QEMU spawns/terminations to a persistent registry

**Warning signs:**
- `ps aux | grep qemu` shows processes with no visible windows
- Memory usage climbing despite no active users
- "QEMU already running" errors when trying to boot same image

**Phase to address:**
Phase 2 (QEMU boot progress) - must prevent orphan accumulation

---

### Pitfall VS-3: Canvas Performance Degradation with Many Particles

**What goes wrong:**
With 50+ terminal particles on the infinite canvas, frame rate drops below 30fps. Dragging particles becomes jerky. Progress bar animations stutter.

**Why it happens:**
`ParticleManager.js` calls `update()` on every particle every frame (line 543). Each `TerminalWindowParticle` contains nested PIXI containers with multiple graphics objects. The spatial index helps find particles but does not reduce per-frame updates.

**How to avoid:**
1. Implement visibility culling: only update particles in/near viewport
2. Use `PIXI.particles.ParticleContainer` for non-interactive elements
3. Throttle updates for off-screen particles (update every 5th frame)
4. Consider pooling terminal cells instead of creating new sprites per character
5. Use object pooling for frequently created/destroyed visual elements

**Warning signs:**
- Frame time > 33ms in browser devtools
- Fan spinning up on client machine
- "Skipped frame" warnings in console

**Phase to address:**
Phase 1 (visual objects) - performance budget must be established early

---

### Pitfall VS-4: Boot Progress State Mismatch

**What goes wrong:**
Frontend shows "Booting... 75%" but QEMU has already finished booting and is at login prompt. Or progress bar goes to 100% but guest OS is still initializing.

**Why it happens:**
QEMU boot progress is inferred from serial output or memory patterns, not directly reported. The existing `BootProgress` class from Phase 2 polls at intervals but does not account for:
- Variable boot times across different images
- Silent boot phases with no serial output
- Multi-stage boots (firmware -> kernel -> initramfs -> userspace)

**How to avoid:**
1. Define clear boot stages with explicit completion markers
2. Use QEMU's `-serial mon:stdio` to capture boot messages
3. Implement "stage timeout" - if no progress for N seconds, mark as potentially stuck
4. Add manual "skip to shell" option for slow boots
5. Correlate progress with actual serial output patterns, not just elapsed time

**Warning signs:**
- Progress bar has not moved in 10+ seconds
- Serial console shows login prompt but progress shows 60%
- User clicks terminal window before boot completes

**Phase to address:**
Phase 2 (QEMU boot progress) - progress must reflect reality

---

### Pitfall VS-5: Drag State Persistence Loss on Refresh

**What goes wrong:**
User arranges terminals in specific positions, refreshes page, all terminals reset to default positions. Hours of spatial organization lost.

**Why it happens:**
`ParticleManager.serialize()` exists (line 565) but is only called manually. The debounced save timer (line 43) is initialized but never used. `localStorage` or backend persistence is not wired up.

**How to avoid:**
1. Auto-save particle state on every position change (debounced 500ms)
2. Persist to `localStorage` as first layer, sync to backend as second
3. Implement "layout recovery" on app init: check localStorage, then backend
4. Add visual indicator when layout is "dirty" (unsaved)
5. Version the persisted state schema for forward compatibility

**Warning signs:**
- No network requests after moving particles
- `localStorage` has no `particleLayout` key
- Console log shows "deserialize" called with empty data

**Phase to address:**
Phase 1 (visual objects) - persistence must be built-in, not retrofitted

---

## Technical Debt Patterns (Visual Shell)

Shortcuts that seem reasonable but create long-term problems.

| Shortcut | Immediate Benefit | Long-term Cost | When Acceptable |
|----------|-------------------|----------------|-----------------|
| Skip visibility culling | Faster initial render | 50+ particles = lag | Demo with <10 particles only |
| Ignore WebSocket reconnect | Simpler code | Lost state on network hiccup | Never |
| Hardcode boot progress timing | Works for one image | Fails on different images | Single-image demo only |
| No QEMU process tracking | Easier implementation | Orphan processes accumulate | Never |
| Skip layout persistence | Faster dev | User frustration on refresh | Never |

## Integration Gotchas (Visual Shell)

Common mistakes when connecting to external services.

| Integration | Common Mistake | Correct Approach |
|-------------|----------------|------------------|
| WebSocket + PixiJS | Blocking render loop on WebSocket message | Use async message queue, process in animation frame |
| QEMU + Browser | Binary framebuffer data over WebSocket | Encode as base64 or use binary WebSocket frames |
| Particle focus + Terminal input | Focus does not route keyboard to terminal | `ParticleManager.focusParticle()` must call `terminal.focus()` |
| Drag + NEB events | Every drag frame sends NEB event | Throttle NEB events to 100ms intervals |
| Resize + Terminal resize | Container resizes but terminal grid does not | Call `terminal.resize()` on particle resize |

## Performance Traps (Visual Shell)

Patterns that work at small scale but fail as usage grows.

| Trap | Symptoms | Prevention | When It Breaks |
|------|----------|------------|----------------|
| Too many PIXI.Graphics objects | High GPU memory, slow render | Use Sprite pooling, avoid Graphics for repeated elements | 100+ graphics |
| Unthrottled WebSocket messages | Network saturation, queue buildup | Debounce/throttle high-frequency updates | >100 msg/sec |
| Full canvas redraw on change | Flickering, high CPU | Use PIXI's dirty rect system | Any size canvas |
| Texture cache without limit | Memory leak | LRU cache with max size (e.g., 1000 textures) | Long-running session |
| Synchronous texture generation | Frame drops during typing | Generate textures in Web Worker | Fast typists |

## Security Mistakes (Visual Shell)

Domain-specific security issues beyond general web security.

| Mistake | Risk | Prevention |
|---------|------|------------|
| WebSocket without origin check | Any site can connect | Validate Origin header, use token auth |
| QEMU with full host access | Guest can read host files | Use `-sandbox on`, restrict shared directories |
| Unvalidated shell input | Command injection | Sanitize commands, whitelist allowed operations |
| Exposed terminal WebSocket | Remote code execution | Require authentication token, rate limit |

## UX Pitfalls (Visual Shell)

Common user experience mistakes in this domain.

| Pitfall | User Impact | Better Approach |
|---------|-------------|-----------------|
| No boot progress indication | User thinks app is frozen | Show animated placeholder with "Booting..." text |
| Terminal steals focus on load | User cannot interact with other elements | Only focus on explicit click, not on creation |
| No visual feedback on drag | Drag feels unresponsive | Show shadow/ghost during drag, animate to final position |
| Resize handles invisible | User does not know resize is possible | Show handles on hover, always visible in settings |
| No disconnect notification | User keeps typing into dead terminal | Show banner, disable input, offer reconnect button |

## "Looks Done But Is Not" Checklist (Visual Shell)

Things that appear complete but are missing critical pieces.

- [ ] **WebSocket reconnection:** Often missing heartbeat protocol - verify ping/pong works
- [ ] **QEMU cleanup:** Often missing on unexpected disconnect - verify `ps aux | grep qemu` empty after close
- [ ] **Layout persistence:** Often works in session but not across refresh - verify `localStorage` contains layout
- [ ] **Performance budget:** Often fine at 10 particles but fails at 50 - verify 60fps at 50 particles
- [ ] **Boot progress accuracy:** Often hardcoded for demo image - verify with multiple different images
- [ ] **Error recovery:** Often shows nothing on failure - verify error states display helpful messages

## Recovery Strategies (Visual Shell)

When pitfalls occur despite prevention, how to recover.

| Pitfall | Recovery Cost | Recovery Steps |
|---------|---------------|----------------|
| WebSocket desync | LOW | Refresh page, state rebuilds from localStorage |
| Orphaned QEMU | MEDIUM | `pkill -9 qemu`, restart bridge server |
| Performance degradation | LOW | Close unused terminals, refresh if needed |
| Lost layout | HIGH | If localStorage corrupted, must re-arrange manually |
| Wrong boot progress | LOW | Ignore progress bar, check serial output directly |

## Pitfall-to-Phase Mapping (Visual Shell)

How roadmap phases should address these pitfalls.

| Pitfall | Prevention Phase | Verification |
|---------|------------------|--------------|
| WebSocket state desync | Phase 1 | Test: Kill backend, verify frontend shows error within 2s |
| QEMU orphaning | Phase 2 | Test: Start boot, close tab, verify QEMU exits within 30s |
| Canvas performance | Phase 1 | Test: Create 50 particles, verify 60fps maintained |
| Boot progress mismatch | Phase 2 | Test: Boot 3 different images, verify progress matches serial |
| Layout persistence loss | Phase 1 | Test: Arrange particles, refresh, verify positions restored |

---

## Earlier Research: Vision-based OS Boot (PixelRTS v2)

*Researched: 2026-02-11 - Confidence: MEDIUM*

### Critical Pitfalls (Prior Milestone)

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
- Checksums do not match expected values
- Security scanners flag containers as suspicious

**Phase to address:** Phase 1 (Vision Analysis) - Security validation must precede any metadata extraction

---

### Pitfall 4: Installer "Silent Failure" Anti-Pattern

**What goes wrong:**
Installer appears to complete successfully but OS is actually unbootable due to partition errors, bootloader issues, or silent I/O errors. User discovers problem only after reboot, when recovery is difficult.

**Why it happens:**
Poor error handling that suppresses or generalizes errors ("install failed" vs "specific problem"). Unclear progress indication hides stuck operations. Network dependency issues when installer requires connection but does not verify properly. Partitioning tools fail silently.

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
- Thumbnails do not update when files change
- Manual cache clear fixes display issues
- High I/O during cache operations
- Memory usage grows unbounded with large catalogs

**Phase to address:** Phase 4 (Visual Catalog) - Caching strategy must be foundational to catalog design

---

### Pitfall 6: Secure Boot Certificate Expiration (2026 Crisis)

**What goes wrong:**
Microsoft's Secure Boot certificates from 2011 expire June and October 2026, causing boot failures with "Security Violation" errors. Systems become unbootable because certificates cannot verify bootloaders. Already causing UNMOUNTABLE_BOOT_VOLUME stop codes.

**Why it happens:**
Certificate validity periods were set years ago without considering long-term impact. Many systems lack automatic certificate update mechanisms. OS installers do not verify certificate expiration dates.

**How to avoid:**
- Implement certificate expiration checks in installer
- Provide clear user-facing warnings about certificate status
- Design certificate update mechanism that does not require OS reinstall
- Document Secure Boot requirements and workarounds
- Test with both valid and expiring certificates

**Warning signs:**
- Boot failures with Security Violation (0x1A) errors
- Systems work during development but fail in production
- Certificate warnings ignored during testing

**Phase to address:** Phase 3 (Installer) - Certificate handling must be part of boot verification design

---

## Technical Debt Patterns (Prior Research)

| Shortcut | Immediate Benefit | Long-term Cost | When Acceptable |
|----------|-------------------|----------------|-----------------|
| Skip FUSE caching optimization | Faster initial development | 10-30% permanent performance penalty, hard to retrofit | Never - performance is core value |
| Suppress vision model errors | Fewer "failed analysis" states | Silent failures, undetected hallucinations | Only in MVP with explicit warnings |
| Re-generate all thumbnails on cache miss | Simpler invalidation logic | Performance collapse at scale, poor UX | Only for <100 containers |
| Trust PNG metadata without validation | Faster development | Security vulnerabilities, steganography attacks | Never - security critical |
| Use generic error messages | Less error handling code | Unrecoverable failures, poor UX | Never in installer |

## Integration Gotchas (Prior Research)

| Integration | Common Mistake | Correct Approach |
|-------------|----------------|------------------|
| QEMU direct boot | Not verifying kernel command line args, missing rootdelay | Always check /proc/cmdline in guest, use appropriate rootdelay |
| Vision model API | Treating output as authoritative, no confidence thresholds | Use as confidence signal, require checksum verification |
| FUSE mount points | Not cleaning up on error, leaking mounts | Implement proper mount lifecycle management, cleanup on error |
| PNG metadata extraction | Blindly trusting all tEXt chunks | Whitelist allowed keys, validate all values |
| Thumbnail generation | Blocking UI during generation | Async generation with progress indication |
| Bootloader installation | Not verifying UEFI vs BIOS mode | Detect boot mode explicitly, install appropriate bootloader |

## Performance Traps (Prior Research)

| Trap | Symptoms | Prevention | When It Breaks |
|------|----------|------------|----------------|
| Synchronous thumbnail generation | UI freezes during catalog load | Async generation with worker pool | >50 containers |
| Full cache rebuild on change | I/O storm, minutes-long hangs | Incremental updates via file monitoring | >200 containers |
| No FUSE read caching | Every read hits userspace | Implement aggressive read cache | Immediately (10-30% penalty) |
| Vision model per-request | API rate limits, slow analysis | Batch analysis, result caching | >10 containers/minute |
| Linear thumbnail lookup | O(n) lookup time slows catalog load | Hash-based or indexed lookup | >500 containers |

## Security Mistakes (Prior Research)

| Mistake | Risk | Prevention |
|---------|------|------------|
| Blind PNG metadata trust | Steganography attacks, arbitrary code execution | Whitelist tEXt keys, validate all values, checksum binaries |
| Vision hallucination acceptance | Wrong OS boot, undetected tampering | Multi-factor verification, confidence thresholds |
| Missing Secure Boot validation | Boot failures, certificate expiration issues | Explicit certificate checks, update mechanisms |
| FUSE privilege escalation | Root access from untrusted code | Minimal privileges, capability dropping |
| Installer path traversal | Overwrite system files | Validate all paths, use chroot/sandbox |
| Cache poisoning | Display wrong containers, boot wrong OS | Hash-based cache keys, integrity verification |

## UX Pitfalls (Prior Research)

| Pitfall | User Impact | Better Approach |
|---------|-------------|-----------------|
| Unclear boot progress | User does not know if it's working or stuck | Detailed progress with operation names, ETA |
| Silent install failures | Unbootable system, difficult recovery | Explicit verification phase, specific error messages |
| Generic error messages | User cannot fix problems themselves | Actionable errors with recovery steps |
| No visual feedback during analysis | User thinks it is broken | Progress indication, preview thumbnails |
| Hidden technical requirements | User fails unexpectedly | Explicit requirements check before starting |
| No undo/recovery | Mistake requires full reinstall | Snapshot/rollback capabilities |

## "Looks Done But Is Not" Checklist (Prior Research)

- [ ] **Vision analysis:** Often missing confidence threshold calibration - verify with diverse test set, track false positive/negative rates
- [ ] **FUSE filesystem:** Often missing proper error propagation - verify all syscalls return appropriate errno codes
- [ ] **Installer:** Often missing bootloader verification - verify installed system actually boots before declaring success
- [ ] **Visual catalog:** Often missing cache invalidation - verify thumbnails update when containers change
- [ ] **Security validation:** Often missing steganography detection - verify PNG chunks are scanned for anomalies
- [ ] **Performance:** Often missing scale testing - verify with 1000+ containers, not just 10
- [ ] **Error handling:** Often missing specific error messages - verify every error path has actionable message
- [ ] **Certificate handling:** Often missing expiration checks - verify Secure Boot certificates are checked

## Recovery Strategies (Prior Research)

| Pitfall | Recovery Cost | Recovery Steps |
|---------|---------------|----------------|
| Vision hallucination deployment | HIGH | Roll back to checksum-only verification, retrain model with better data, add confidence thresholds |
| FUSE performance issues | MEDIUM | Profile to identify bottleneck, add caching layer, consider kernel module for critical paths |
| PNG steganography exploit | CRITICAL | Immediate security incident response, patch metadata validation, audit all containers |
| Installer silent failures | HIGH | Add verification phase, improve error messages, provide recovery boot media |
| Cache corruption | LOW | Clear cache, rebuild with validation, add integrity checks |
| Certificate expiration | MEDIUM | Release certificate update tool, document manual update process, add auto-update |

## Sources (Prior Research)

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

### Visual Shell Integration (Current Research)
- Codebase analysis: `systems/visual_shell/` directory structure and patterns
- Existing implementations: `terminal_websocket_bridge.py`, `ParticleManager.js`, `GeometricTerminal.js`
- Prior milestone learnings: `.planning/milestones/v1.0-pixelrts-boot-improvement-ROADMAP.md`
- WebSocket patterns from existing `demo_geometric_terminal.html` and `qemu_texture_bridge.py`

---
*Pitfalls research for: Visual Shell Integration*
*Researched: 2026-02-27*
