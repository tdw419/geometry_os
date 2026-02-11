# Requirements: PixelRTS Boot Improvement

**Defined:** 2026-02-11
**Core Value:** Booting an OS should be as visual and intuitive as opening an image file.

## v1 Requirements

Requirements for initial release. Each maps to a roadmap phase.

### Vision Analysis (VISION)

- [ ] **VISION-01**: Vision model can identify kernel version from .rts.png visual patterns
- [ ] **VISION-02**: Vision model can identify OS distribution (Alpine, Ubuntu, etc.) from PNG
- [ ] **VISION-03**: Vision model can identify system architecture (x86_64, ARM64, etc.) from PNG
- [ ] **VISION-04**: Vision model can detect tampering or corruption in OS containers via entropy analysis

### Direct Boot (DIRECT)

- [ ] **DIRECT-01**: User can boot .rts.png files with single command without manual extraction
- [ ] **DIRECT-02**: FUSE filesystem presents .rts.png as /kernel and /initrd files
- [ ] **DIRECT-03**: Boot process completes with <10% overhead compared to traditional ISO boot
- [ ] **DIRECT-04**: FUSE mount properly cleans up after boot (no resource leaks)

### Verification (VERIFY)

- [ ] **VERIFY-01**: System verifies SHA256 hash of extracted kernel/initrd against metadata
- [ ] **VERIFY-02**: Verification failure prevents boot and displays clear error message
- [ ] **VERIFY-03**: Vision-based tamper detection provides additional security verification

### User Experience (UX)

- [ ] **UX-01**: Boot progress is displayed visually (text or graphical) during operations >1 second
- [ ] **UX-02**: User can view OS metadata (kernel version, distro, architecture) before booting
- [ ] **UX-03**: Error messages provide actionable guidance when boot fails

### Integration (INTEGRATION)

- [ ] **INTEGRATION-01**: Existing PixelRTS v2 encoder/decoder is used without modification
- [ ] **INTEGRATION-02**: CLI tool `pixelrts boot <file.png>` works with existing .rts.png files
- [ ] **INTEGRATION-03**: Vision analysis provider pattern supports multiple backends (Claude, LM Studio, local)

## v1.x Requirements

Deferred to after MVP validation.

### Enhanced Security (SECURITY)

- **SECURITY-01**: Vision-based tamper detection produces actionable security report
- **SECURITY-02**: Multi-factor verification (SHA256 + vision analysis + signature)

### Visual Catalog (CATALOG)

- **CATALOG-01**: System displays OS containers as visual thumbnails in gallery view
- **CATALOG-02**: User can boot any OS from catalog with single click
- **CATALOG-03**: Catalog supports spatial arrangement (drag to reorganize)

### Platform Support (PLATFORM)

- **PLATFORM-01**: System supports UEFI boot mode
- **PLATFORM-02**: System supports legacy BIOS boot mode
- **PLATFORM-03**: Boot mode is automatically detected or user-configurable

### Updates (UPDATE)

- **UPDATE-01**: System can download delta updates (only changed bytes/regions)
- **UPDATE-02**: Update process shows visual diff of changes
- **UPDATE-03**: User can review and approve updates before applying

## v2 Requirements

Deferred until product-market fit is established.

### Advanced Visual Features (VISUAL)

- **VISUAL-01**: Boot-time visualization shows OS "loading" as pixels fill in (thermographic effect)
- **VISUAL-02**: Visual entropy heatmap overlay for forensic analysis

### Network (NETWORK)

- **NETWORK-01**: System can boot PixelRTS containers over network (PXE/NBD)
- **NETWORK-02**: Network boot supports multiple clients simultaneously

### Multi-Boot (MULTI)

- **MULTI-01**: Single PNG can store multiple bootable OS variants via metadata tags
- **MULTI-02**: User can select which OS variant to boot from menu

## Out of Scope

Explicitly excluded. Documented to prevent scope creep.

| Feature | Reason |
|---------|--------|
| Real-time ISO→PNG conversion | Adds latency, complexity, breaks single-source-of-truth. Provide CLI tool instead. |
| PNG image editor compatibility | Visual encoding is not human-editable like layers. Provide dedicated analyzer. |
| Video codec boot (MP4/WebM) | Lossy codecs corrupt binary data. PNG (lossless) required. |
| Social sharing of boot images | Large file sizes (10-100MB), privacy concerns. Thumbnail for catalog only. |
| Live modification during boot | Requires complex overlay, breaks verification. Use FUSE read-only + install workflow. |
| Auto-update from network | Breaks reproducibility, security risk. Explicit update command required. |
| Compression optimization (WebP/AVIF) | Lossy formats corrupt data. PNG sufficient with efficient encoding. |
| Multiple filesystem support in PNG | Violates single-responsibility. One kernel/initrd per PNG. |

## Traceability

Which phases cover which requirements. Updated during roadmap creation.

| Requirement | Phase | Status |
|-------------|-------|--------|
| VISION-01 | Phase 1 | Pending |
| VISION-02 | Phase 1 | Pending |
| VISION-03 | Phase 1 | Pending |
| VISION-04 | Phase 1 | Pending |
| DIRECT-01 | Phase 2 | Pending |
| DIRECT-02 | Phase 2 | Pending |
| DIRECT-03 | Phase 2 | Pending |
| DIRECT-04 | Phase 2 | Pending |
| VERIFY-01 | Phase 1 | Pending |
| VERIFY-02 | Phase 1 | Pending |
| VERIFY-03 | Phase 1 | Pending |
| UX-01 | Phase 2 | Pending |
| UX-02 | Phase 1 | Pending |
| UX-03 | Phase 2 | Pending |
| INTEGRATION-01 | Phase 1 | Pending |
| INTEGRATION-02 | Phase 2 | Pending |
| INTEGRATION-03 | Phase 1 | Pending |

**Coverage:**
- v1 requirements: 17 total
- Mapped to phases: 17
- Unmapped: 0 ✓

---
*Requirements defined: 2026-02-11*
*Last updated: 2026-02-11 after initial definition*
