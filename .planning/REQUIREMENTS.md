# Requirements: PixelRTS Vision Integrity

**Defined:** 2026-03-09
**Core Value:** Users can trust that .rts.png files haven't been corrupted or tampered with

## v1.7 Requirements

### Core Verification

- [ ] **VERIFY-01**: User can verify PNG structure integrity (valid PNG, readable chunks)
- [ ] **VERIFY-02**: User can verify hash consistency (metadata SHA256 matches decoded data)
- [ ] **VERIFY-03**: User can verify kernel/initrd/disk segment integrity via range decode

### Cryptographic

- [ ] **CRYPTO-01**: User can verify Ed25519 cryptographic signature against embedded public key
- [ ] **CRYPTO-02**: User can sign a .rts.png file with private key (adds signature chunk)

### CLI

- [ ] **CLI-01**: `pixelrts verify <file.png>` command with pass/fail exit code
- [ ] **CLI-02**: JSON output via `--json` flag for scripting
- [ ] **CLI-03**: Verbose output via `--verbose` flag showing each verification step

## Future Requirements

### Boot Integration

- **BOOT-01**: Automatic verification before boot (via `--verify` flag)
- **BOOT-02**: Block boot on verification failure (configurable)

### Advanced

- **ADV-01**: Visual preview vs encoded data consistency check
- **ADV-02**: Key management (keyring, trusted keys list)
- **ADV-03**: Batch verification of multiple files

## Out of Scope

| Feature | Reason |
|---------|--------|
| Auto-verify on boot by default | Explicit command first |
| Real-time file monitoring | Not core to verification |
| Auto-repair | Too complex for v1 |
| Key management UI | CLI-only for v1 |
| Custom hash algorithms | SHA256 is sufficient |
| Remote key servers | Local keys only for v1 |

## Traceability

| Requirement | Phase | Status |
|-------------|-------|--------|
| VERIFY-01 | Phase 19 | Pending |
| VERIFY-02 | Phase 19 | Pending |
| VERIFY-03 | Phase 20 | Pending |
| CRYPTO-01 | Phase 21 | Pending |
| CRYPTO-02 | Phase 21 | Pending |
| CLI-01 | Phase 22 | Pending |
| CLI-02 | Phase 22 | Pending |
| CLI-03 | Phase 22 | Pending |

**Coverage:**
- v1.7 requirements: 8 total
- Mapped to phases: 8
- Unmapped: 0 ✓

---
*Requirements defined: 2026-03-09*
