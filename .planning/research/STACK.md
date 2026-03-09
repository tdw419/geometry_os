# Technology Stack: Vision Integrity

**Project:** PixelRTS Vision Integrity
**Researched:** 2026-03-09
**Mode:** Subsequent milestone (building on existing validated system)

## Executive Summary

Vision Integrity adds cryptographic verification and corruption detection to PixelRTS files. The stack additions are minimal - primarily the `cryptography` library for Ed25519 signatures. All other capabilities leverage existing stack components (SHA256 hashing, Reed-Solomon error correction, PIL image handling).

## Recommended Stack Additions

### New Dependencies

| Library | Version | Purpose | Why This Choice |
|---------|---------|---------|-----------------|
| `cryptography` | >=46.0.0 | Ed25519 signature verification | Industry-standard, pure Python option available, maintained by Python Cryptographic Authority, provides deterministic signatures for reproducibility |

### Existing Dependencies (No Changes)

| Library | Version | Role in Vision Integrity |
|---------|---------|--------------------------|
| `reedsolo` | >=1.7.0 | Corruption detection via Reed-Solomon error correction - already integrated for error correction, reuse for integrity checks |
| `Pillow` | >=10.0.0 | PNG chunk extraction for metadata/signature reading, visual preview generation for mismatch detection |
| `numpy` | >=1.24.0 | Byte array manipulation for hash computation and data comparison |

## Integration Points

### 1. Signature Verification (New)

```python
# Integration with cryptography library
from cryptography.hazmat.primitives.asymmetric.ed25519 import Ed25519PublicKey
from cryptography.exceptions import InvalidSignature

def verify_signature(public_key_bytes: bytes, signature: bytes, data: bytes) -> bool:
    public_key = Ed25519PublicKey.from_public_bytes(public_key_bytes)
    try:
        public_key.verify(signature, data)
        return True
    except InvalidSignature:
        return False
```

**Integration with pixelrts_v2_core.py:**
- Signature stored in PNG tEXt chunk (similar to existing metadata pattern)
- Verify against decoded data bytes (output of `PixelRTSDecoder.decode()`)
- Public key can be embedded or stored in separate keyring

### 2. Corruption Detection (Existing Stack)

```python
# Leverage existing reedsolo integration
# Already in stack for error correction, reuse for integrity
import reedsolo

def detect_corruption(data: bytes, ecc_blocks: int = 16) -> list[int]:
    """Returns indices of corrupted bytes, empty if clean."""
    rs = reedsolo.RSCodec(ecc_blocks)
    # ... existing error correction logic reports corruption locations
```

**Why no new library:** reedsolo already provides error detection. The existing `PixelRTSDecoder` handles Reed-Solomon decoding. Vision integrity adds reporting of detected errors, not new error detection.

### 3. Visual/Data Mismatch Detection (Existing Stack)

```python
# Reuse existing PIL integration from pixelrts_v2_core.py
from PIL import Image

def detect_visual_mismatch(png_bytes: bytes) -> dict:
    # 1. Extract visual RGB data from PNG
    # 2. Decode PixelRTS data via PixelRTSDecoder
    # 3. Compare visual preview (if present) to decoded data
    # 4. Report discrepancies
```

**Why no new library:** PIL already handles PNG reading. The `pixelrts_v2_core.py` already decodes PixelRTS data. Mismatch detection is comparison logic, not a new capability.

### 4. Hash Verification (Existing Stack)

```python
# Already implemented in pixelrts_v2_core.py
class PixelRTSMetadata:
    @staticmethod
    def hash_data(data: bytes) -> str:
        """Calculate SHA256 hash of data."""
        return hashlib.sha256(data).hexdigest()
```

**Why no new library:** SHA256 via `hashlib` (stdlib) is already integrated. No changes needed.

## What NOT to Add and Why

| Library | Why Not |
|---------|---------|
| `pycryptodome` | Redundant with `cryptography` - we only need Ed25519, not a full crypto suite |
| `hashlib-extra` | SHA256 in stdlib is sufficient and already integrated |
| `pngcheck` wrapper | PIL provides all needed PNG chunk access; no external tooling required |
| `opencv-python` | Overkill for mismatch detection; PIL + numpy sufficient for byte comparison |
| `xxhash` / `blake3` | SHA256 already integrated; switching hashes breaks existing files |
| `asn1crypto` | Ed25519 in `cryptography` handles key encoding; no separate ASN.1 library needed |
| `base58` / `bech32` | Key encoding not required for verification; raw bytes sufficient |

## Installation

```bash
# Add to existing requirements.txt
pip install "cryptography>=46.0.0"
```

No changes to existing dependencies required.

## CLI Integration

The `pixelrts verify <file.png>` command will:

1. **Load PNG** - Use existing PIL integration
2. **Extract signature** - Read from tEXt chunk (new code)
3. **Verify signature** - Use cryptography library (new code)
4. **Check hash** - Use existing `hash_data()` method
5. **Detect corruption** - Report from existing Reed-Solomon decode
6. **Compare visual** - Decode and compare to visual preview (new logic, existing stack)

## Version Rationale

### cryptography >= 46.0.0

- **Current stable:** 46.0.5 (as of 2026-03-09)
- **Ed25519 support:** Available since early versions, stable API
- **Why this version:** Includes security fixes, maintained by PyCA (Python Cryptographic Authority)
- **License:** Apache 2.0 / BSD-3 (permissive, compatible with project)
- **Pure Python:** Available via `cryptography` wheel, no system dependencies

### No Version Bumps for Existing

| Library | Current | Why No Bump |
|---------|---------|-------------|
| reedsolo | 1.7.0 | API stable, error correction working |
| Pillow | 10.0.0 | PNG chunk access unchanged in newer versions |
| numpy | 1.24.0 | Byte manipulation API stable |

## Sources

- cryptography library: https://cryptography.io/en/latest/hazmat/primitives/asymmetric/ed25519/
- cryptography PyPI: https://pypi.org/project/cryptography/
- reedsolo documentation: https://pypi.org/project/reedsolo/
- PIL PNG handling: https://pillow.readthedocs.io/en/stable/handbook/image-file-formats.html#png

## Confidence Assessment

| Area | Confidence | Reason |
|------|------------|--------|
| cryptography version | HIGH | Verified from official PyPI and docs |
| Ed25519 API | HIGH | Documented in cryptography.io |
| Integration approach | MEDIUM | Based on code review of pixelrts_v2_core.py, actual integration may reveal edge cases |
| No-new-dependencies assessment | MEDIUM | Confirmed existing capabilities, but runtime testing needed |

## Open Questions

1. **Key storage:** Where should verification public keys live? (keyring file, embedded in CLI, environment variable)
2. **Signature chunk name:** What tEXt chunk key for signatures? (suggest: `PixelRTS-Sig`)
3. **Visual preview format:** Is there an existing visual preview convention, or does this need definition?
