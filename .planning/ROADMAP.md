# Roadmap: PixelRTS

## Milestones

- **v1.0 MVP** - Phases 1-4 (shipped 2026-03-08)
- **v1.1 Visual Diff** - Phase 5 (shipped 2026-03-08)
- **v1.2 Network Boot** - Phases 6-8.1 (shipped 2026-03-09)
- **v1.3 Multi-Boot** - Phases 9-11 (shipped 2026-03-09)
- **v1.4 Live Snapshots** - Phases 12-14 (shipped 2026-03-09)
- **v1.5 Commit to File** - Phases 15-17 (shipped 2026-03-09) — [Archive](milestones/v1.5-ROADMAP.md)
- **v1.6 Ephemeral Boot** - Phase 18 (shipped 2026-03-09) — [Archive](milestones/v1.6-ROADMAP.md)
- **v1.7 Vision Integrity** - Phases 19-22 (in progress)

## Current Status

**Milestone v1.7 Vision Integrity started.** Ready for Phase 19 planning.

---

## Phases

### v1.7 Vision Integrity

**Milestone Goal:** Users can verify .rts.png file integrity before booting

#### Phase 19: Basic Verification
**Goal**: Users can verify PNG structure and hash consistency
**Depends on**: Phase 18 (Ephemeral boot complete)
**Requirements**: VERIFY-01, VERIFY-02
**Success Criteria** (what must be TRUE):
  1. User can run a verification check on any .rts.png file
  2. Invalid PNG files are detected and reported with specific error
  3. Hash mismatch between metadata and decoded data is detected
  4. Verification returns clear pass/fail status
**Plans**: 2

Plans:
- [x] 19-01: Verification infrastructure and structure validation
- [x] 19-02: Hash consistency verification

#### Phase 20: Segment Integrity
**Goal**: Users can verify individual segments (kernel, initrd, disk) without full decode
**Depends on**: Phase 19
**Requirements**: VERIFY-03
**Success Criteria** (what must be TRUE):
  1. User can verify kernel segment integrity independently
  2. User can verify initrd segment integrity independently
  3. User can verify disk segment integrity independently
  4. Range-based verification is faster than full decode for large files
**Plans**: 1

Plans:
- [x] 20-01: Segment integrity checker with range decode

#### Phase 21: Cryptographic Signatures
**Goal**: Users can verify and create Ed25519 cryptographic signatures
**Depends on**: Phase 20
**Requirements**: CRYPTO-01, CRYPTO-02
**Success Criteria** (what must be TRUE):
  1. User can verify file signature against embedded public key
  2. User can sign a .rts.png file with their private key
  3. Signature is stored in PNG tEXt chunk
  4. Unsigned files report as "unsigned" (not "failed")
**Plans**: 2

Plans:
- [ ] 21-01: Signature verification
- [ ] 21-02: File signing

#### Phase 22: CLI Integration
**Goal**: Users can verify files via unified CLI command
**Depends on**: Phase 21
**Requirements**: CLI-01, CLI-02, CLI-03
**Success Criteria** (what must be TRUE):
  1. `pixelrts verify <file.png>` command returns exit code 0 on pass, non-zero on fail
  2. `--json` flag outputs machine-parseable results
  3. `--verbose` flag shows each verification step with details
  4. Human-readable output shows clear pass/fail with reasons
**Plans**: 1

Plans:
- [ ] 22-01: CLI verify command implementation

## Progress

**Execution Order:**
Phases execute in numeric order: 19 → 20 → 21 → 22

| Phase | Milestone | Plans Complete | Status | Completed |
|-------|-----------|----------------|--------|-----------|
| 19. Basic Verification | v1.7 | 0/2 | Not started | - |
| 20. Segment Integrity | v1.7 | 1/1 | ✓ Complete | 2026-03-09 |
| 21. Cryptographic Signatures | v1.7 | 0/2 | Not started | - |
| 22. CLI Integration | v1.7 | 0/1 | Not started | - |

---
*Last updated: 2026-03-09 — v1.7 Vision Integrity roadmap created*
