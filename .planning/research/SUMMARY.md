# Project Research Summary

**Project:** Vision Integrity Verification for PixelRTS
**Domain:** PNG-based OS container integrity verification
**Researched:** 2026-03-09
**Confidence:** MEDIUM-HIGH

## Executive Summary

Vision Integrity adds cryptographic verification and corruption detection to PixelRTS PNG container files, enabling users to verify that OS images haven't been tampered with or corrupted. This is a security-focused feature that extends the existing PixelRTS system with integrity guarantees.

The recommended approach is a **minimal addition architecture**: only one new dependency (cryptography>=46.0.0 for Ed25519 signatures), leveraging existing SHA256 hashing, Reed-Solomon error correction, and PIL image handling. The architecture follows a **verification chain pattern** with composable VerificationStep classes that allow partial success reporting and early termination on critical failures.

Key risks include confusing PNG's built-in CRC with data integrity (they serve different purposes), false positives in tampering detection (entropy-based detection needs tuning), and key management complexity for signature verification. Mitigation: clear separation of structure vs. semantic verification, conservative anomaly thresholds, and a simple keyring approach initially.

## Key Findings

### Recommended Stack

The stack addition is minimal. Vision Integrity primarily leverages existing validated components with one cryptographic addition:

**Core technologies:**
- `cryptography>=46.0.0` — Ed25519 signature verification — industry-standard, maintained by PyCA, pure Python option
- `reedsolo>=1.7.0` (existing) — Corruption detection via Reed-Solomon error correction — already integrated, reuse for integrity reporting
- `Pillow>=10.0.0` (existing) — PNG chunk extraction and visual comparison — no new dependencies needed
- `hashlib` (stdlib, existing) — SHA256 hash computation — already integrated in PixelRTSMetadata

**What NOT to add:**
- No pycryptodome (redundant with cryptography)
- No opencv (PIL + numpy sufficient)
- No alternative hashes (SHA256 already standardized)

### Expected Features

**Must have (table stakes):**
- PNG structure validation — verify valid PNG signature and chunk structure
- Hash verification — confirm decoded data matches metadata hash
- Clear pass/fail output — human-readable CLI output with specific failure reasons
- Corruption detection — report Reed-Solomon detected errors

**Should have (differentiators):**
- Visual/data consistency check — detect if visual pixels differ from encoded data
- Cryptographic signatures — Ed25519 signature verification for tampering detection
- Segment-specific verification — verify individual regions (kernel, initrd, disk) independently
- JSON output — machine-parseable results for automation

**Defer (v2+):**
- Real-time monitoring — continuous integrity watching
- Auto-repair — attempt to fix corrupted segments
- Remote attestation — network-based verification protocol
- Multi-signature support — require multiple keys

### Architecture Approach

The architecture uses a **verification chain pattern** with composable steps, each responsible for a specific verification domain. A central `VisionIntegrityVerifier` orchestrates the pipeline, while `VerificationContext` provides shared state and lazy data access.

**Major components:**
1. **VisionIntegrityVerifier** — Main orchestrator that runs verification steps in sequence, supports strict mode (stop on first failure)
2. **VerificationContext** — Shared state abstraction with lazy decoding, metadata access, and cached results
3. **StructureVerifier** — PNG signature validation, chunk structure verification, metadata consistency
4. **ConsistencyVerifier** — Hash verification using existing PixelRTSDecoder, visual vs encoded data comparison
5. **SegmentIntegrityChecker** — Region-specific verification using decode_range() for efficiency
6. **SignatureVerifier** — Ed25519 signature validation against data hash

**Key patterns:**
- **VerificationStep** abstract base class with composable steps
- **Result aggregation** with per-component status and CLI formatting
- **Lazy decoding** via VerificationContext to avoid redundant work
- **Integration with existing components** — PixelRTSDecoder, PixelRTSMetadata, infinite_map_integrity patterns

### Critical Pitfalls

1. **Don't duplicate PNG's built-in CRC** — PNG chunks have CRC32 for transport integrity. This is separate from semantic data integrity. Distinguish: CRC catches file corruption, hash verification catches data tampering. Both are needed, don't confuse them.

2. **Distinguish corruption from tampering** — Reed-Solomon errors indicate random corruption (bit flips, disk errors). Hash mismatches and signature failures indicate intentional modification. Different root causes, different user responses.

3. **Key management complexity** — Ed25519 signatures require key distribution. Start simple: embedded public key in CLI for verification, environment variable for custom keys. Defer keyring files and remote key fetch to v2.

4. **False positives in tampering detection** — Entropy analysis can flag legitimate high-entropy regions (compressed data, encryption) as suspicious. Use conservative thresholds and clear "anomaly" vs "failure" distinction.

5. **Performance at scale** — Full decode of 1GB container takes ~5s. Use range-based verification for segments, lazy decoding, and consider parallel verification of independent checks.

## Implications for Roadmap

Based on research, suggested phase structure:

### Phase 1: Core Verification Infrastructure
**Rationale:** Foundation needed before any verification logic — establishes patterns and data flow
**Delivers:** VerificationContext, VerificationStep base, VerificationResult with CLI formatting
**Addresses:** Table stakes feature of clear pass/fail output
**Avoids:** Anti-pattern of monolithic verifier (enables composability from start)
**Research needed:** No — standard patterns from infinite_map_integrity.py

### Phase 2: Basic Verifiers (Structure + Consistency)
**Rationale:** First actual verification capability — minimal viable feature
**Delivers:** StructureVerifier for PNG validation, ConsistencyVerifier for hash matching
**Uses:** Existing PixelRTSDecoder.decode(), PixelRTSMetadata.hash_data()
**Implements:** Architecture components StructureVerifier and ConsistencyVerifier
**Addresses:** Table stakes features (PNG structure, hash verification)
**Avoids:** Duplicate decoding anti-pattern (reuses existing decoder)
**Research needed:** No — well-documented PNG structure, existing hash code

### Phase 3: Segment Integrity
**Rationale:** Enables efficient verification of large containers without full decode
**Delivers:** SegmentIntegrityChecker with range-based verification
**Uses:** Existing PixelRTSDecoder.decode_range() for partial extraction
**Implements:** Architecture component SegmentIntegrityChecker
**Addresses:** Differentiator feature of segment-specific verification
**Avoids:** Performance pitfall at scale (range decode is ~1ms vs ~5s for 1GB)
**Research needed:** Minimal — decode_range() already exists, just need to wire it up

### Phase 4: Cryptographic Signatures
**Rationale:** Security feature for tampering detection — highest-value differentiator
**Delivers:** SignatureVerifier with Ed25519 validation, basic key management
**Uses:** cryptography>=46.0.0 (new dependency), signature from PNG tEXt chunk
**Implements:** Architecture component SignatureVerifier
**Addresses:** Differentiator feature of cryptographic signatures
**Avoids:** Key management complexity pitfall (start with embedded key + env var)
**Research needed:** Yes — key storage approach needs validation during implementation

### Phase 5: CLI Integration
**Rationale:** User-facing interface to verification capabilities
**Delivers:** `pixelrts verify <file>` command with human-readable and JSON output
**Uses:** All verification components from phases 1-4
**Addresses:** Table stakes feature of clear pass/fail output
**Research needed:** No — standard CLI patterns from pixelrts_cli.py

### Phase 6: Boot Integration (Optional)
**Rationale:** Pre-boot verification for security-sensitive use cases
**Delivers:** verify_integrity flag in BootBridge.boot()
**Uses:** VisionIntegrityVerifier, raises BootError on failure
**Addresses:** Security use case of verified boot
**Research needed:** Minimal — integration point already identified in boot_bridge.py

### Phase Ordering Rationale

- **Dependencies first:** Phase 1 establishes patterns that all other phases use
- **Incremental value:** Each phase after Phase 1 delivers usable verification capability
- **Leverage existing:** Phases 2-3 reuse existing decoder infrastructure, minimizing new code
- **Security last in chain:** Phase 4 adds security layer after basic verification works
- **User-facing last:** Phase 5 makes all verification accessible after components are stable

### Research Flags

Phases likely needing deeper research during planning:
- **Phase 4 (Cryptographic Signatures):** Key management approach needs validation — where to store public keys, how to handle key rotation, signature chunk naming convention (suggest: PixelRTS-Sig)
- **Phase 3 (Segment Integrity):** Metadata format for segment definitions may need extension if current format insufficient

Phases with standard patterns (skip research-phase):
- **Phase 1 (Core Infrastructure):** Well-documented chain-of-responsibility pattern, reference infinite_map_integrity.py
- **Phase 2 (Basic Verifiers):** PNG structure well-documented, hash verification code exists
- **Phase 5 (CLI Integration):** Standard CLI patterns, existing pixelrts_cli.py provides reference

## Confidence Assessment

| Area | Confidence | Notes |
|------|------------|-------|
| Stack | HIGH | Verified from official PyPI and cryptography.io documentation |
| Features | MEDIUM | Inferred from domain knowledge and existing codebase analysis |
| Architecture | HIGH | Based on codebase analysis of pixel_compiler/ and existing patterns |
| Pitfalls | MEDIUM | Inferred from domain expertise and common integrity verification challenges |

**Overall confidence:** MEDIUM-HIGH

### Gaps to Address

1. **Key storage approach:** STACK.md identifies this as an open question. During Phase 4 planning, decide: embedded key vs. keyring file vs. environment variable. Recommendation: Start with embedded + env var override for simplicity.

2. **Signature chunk naming:** Open question from STACK.md. Suggest `PixelRTS-Sig` during Phase 4 implementation.

3. **Visual preview format:** ARCHITECTURE.md mentions comparing to "visual preview" but format not defined. During Phase 2, determine if existing convention exists or needs definition.

4. **Segment metadata format:** Phase 3 needs to verify that current metadata format supports segment definitions. If not, extend format.

5. **Performance benchmarks:** ARCHITECTURE.md provides estimates but actual benchmarks needed during implementation. Add benchmark tests to Phase 2.

## Sources

### Primary (HIGH confidence)
- cryptography library documentation — https://cryptography.io/en/latest/hazmat/primitives/asymmetric/ed25519/
- cryptography PyPI — https://pypi.org/project/cryptography/
- Existing codebase analysis — `/home/jericho/zion/projects/geometry_os/geometry_os/systems/pixel_compiler/`

### Secondary (MEDIUM confidence)
- reedsolo documentation — https://pypi.org/project/reedsolo/
- PIL PNG handling — https://pillow.readthedocs.io/en/stable/handbook/image-file-formats.html#png
- Pattern reference — `infinite_map_integrity.py` (ChecksumCalculator, IntegrityScanner)
- Decoder reference — `pixelrts_v2_core.py` (PixelRTSDecoder, PixelRTSMetadata)

### Tertiary (inferred from domain knowledge)
- Expected features table — inferred from standard integrity verification tools
- Critical pitfalls — inferred from common integrity verification challenges
- Key management complexity — inferred from cryptographic system design experience

---
*Research completed: 2026-03-09*
*Ready for roadmap: yes*
*Note: Features and Pitfalls researchers failed due to rate limits — findings inferred from successful research*
