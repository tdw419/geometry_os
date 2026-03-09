# Phase 21: Cryptographic Signatures - Research

**Researched:** 2026-03-09
**Domain:** Ed25519 cryptographic signing/verification, PNG metadata embedding
**Confidence:** HIGH

## Summary

This phase implements Ed25519 cryptographic signatures for PixelRTS boot images. The project already uses the `cryptography` library extensively for Ed25519 operations (see `systems/visual_shell/swarm/task_signer.py`), so we will continue with this pattern rather than introducing PyNaCl as a new dependency.

The signature system will:
1. Store the public key in PNG tEXt metadata alongside existing PixelRTS metadata
2. Store the signature in a separate tEXt chunk
3. Allow environment variable override (`PIXELRTS_PUBLIC_KEY`) for custom verification keys
4. Follow the existing `VerificationStep` pattern established in Phases 19-20

**Primary recommendation:** Use `cryptography` library's `Ed25519PrivateKey`/`Ed25519PublicKey` classes, store signature and public key in PNG tEXt chunks, integrate as `SignatureVerifier` in existing verification pipeline.

## Standard Stack

The established libraries/tools for this domain:

### Core
| Library | Version | Purpose | Why Standard |
|---------|---------|---------|--------------|
| `cryptography` | 40.0+ | Ed25519 signing/verification | Already used in project, well-maintained, pure Rust backend |

### Supporting
| Library | Version | Purpose | When to Use |
|---------|---------|---------|-------------|
| `PIL/Pillow` | 10.0+ | PNG tEXt chunk access | Already used for image operations |

### Alternatives Considered
| Instead of | Could Use | Tradeoff |
|------------|-----------|----------|
| `cryptography` | `PyNaCl` | PyNaCl has cleaner API but adds new dependency; cryptography already in project |
| Embedded signature | Detached `.sig` file | Embedded is self-contained; detached allows key rotation but requires file management |

**Installation:**
```bash
# Already installed - no new dependencies needed
pip install cryptography  # if not present
```

## Architecture Patterns

### Recommended Project Structure
```
systems/pixel_compiler/verification/
├── signature_verifier.py    # NEW: SignatureVerifier class
├── signature_signer.py      # NEW: File signing functionality
├── base.py                  # EXISTING: VerificationStep base class
├── context.py               # EXISTING: VerificationContext
├── result.py                # EXISTING: StepResult, VerificationStatus
└── __init__.py              # UPDATE: Export new classes
```

### Pattern 1: SignatureVerifier (Verification)
**What:** VerificationStep that validates Ed25519 signature against embedded or env-var public key
**When to use:** During verification pipeline execution
**Example:**
```python
# Source: Based on cryptography.io docs and project patterns
from cryptography.hazmat.primitives.asymmetric.ed25519 import Ed25519PublicKey
from cryptography.exceptions import InvalidSignature
import os

class SignatureVerifier(VerificationStep):
    """
    Verifies Ed25519 signature against embedded or environment public key.

    Returns:
    - PASS if signature valid
    - FAIL if signature invalid
    - SKIP if no signature present (unsigned file)
    """

    @property
    def name(self) -> str:
        return "signature"

    @property
    def description(self) -> str:
        return "Verifies Ed25519 cryptographic signature"

    def verify(self, context: VerificationContext) -> StepResult:
        start_time = time.time()

        # Get public key (env var override takes precedence)
        public_key_bytes = self._get_public_key(context)
        if public_key_bytes is None:
            return StepResult(
                step_name=self.name,
                status=VerificationStatus.SKIP,
                message="No public key available for verification",
                duration_ms=(time.time() - start_time) * 1000
            )

        # Get signature from PNG metadata
        signature_bytes = self._get_signature(context)
        if signature_bytes is None:
            return StepResult(
                step_name=self.name,
                status=VerificationStatus.SKIP,
                message="File is not signed",
                duration_ms=(time.time() - start_time) * 1000
            )

        # Get data to verify (hash of decoded data, not full data)
        data_hash = self._get_data_hash(context)
        if data_hash is None:
            return StepResult(
                step_name=self.name,
                status=VerificationStatus.FAIL,
                message="Cannot compute data hash for verification",
                duration_ms=(time.time() - start_time) * 1000
            )

        # Perform verification
        try:
            public_key = Ed25519PublicKey.from_public_bytes(public_key_bytes)
            public_key.verify(signature_bytes, data_hash)
            return StepResult(
                step_name=self.name,
                status=VerificationStatus.PASS,
                message="Signature verification passed",
                details={"public_key": public_key_bytes.hex()[:16] + "..."},
                duration_ms=(time.time() - start_time) * 1000
            )
        except InvalidSignature:
            return StepResult(
                step_name=self.name,
                status=VerificationStatus.FAIL,
                message="Signature verification failed - file may be tampered",
                duration_ms=(time.time() - start_time) * 1000
            )

    def _get_public_key(self, context: VerificationContext) -> Optional[bytes]:
        """Get public key from env var or metadata."""
        # Env var override
        env_key = os.environ.get("PIXELRTS_PUBLIC_KEY")
        if env_key:
            return bytes.fromhex(env_key)

        # Embedded in metadata
        metadata = context.metadata
        if metadata and "signature" in metadata:
            pubkey_hex = metadata["signature"].get("public_key")
            if pubkey_hex:
                return bytes.fromhex(pubkey_hex)
        return None

    def _get_signature(self, context: VerificationContext) -> Optional[bytes]:
        """Get signature from PNG tEXt chunk or metadata."""
        metadata = context.metadata
        if metadata and "signature" in metadata:
            sig_hex = metadata["signature"].get("value")
            if sig_hex:
                return bytes.fromhex(sig_hex)
        return None

    def _get_data_hash(self, context: VerificationContext) -> Optional[bytes]:
        """Get the hash to verify - use SHA256 of decoded data."""
        # Reuse existing hash from consistency verification
        metadata = context.metadata
        if metadata and "hashes" in metadata:
            data_hash_hex = metadata["hashes"].get("data")
            if data_hash_hex:
                return bytes.fromhex(data_hash_hex)
        return None
```

### Pattern 2: File Signing
**What:** Functionality to sign a .rts.png file with private key
**When to use:** When creating signed boot images
**Example:**
```python
# Source: Based on cryptography.io docs
from cryptography.hazmat.primitives.asymmetric.ed25519 import Ed25519PrivateKey
from cryptography.hazmat.primitives import serialization
from pathlib import Path
from PIL import Image
from io import BytesIO
import json

class FileSigner:
    """Signs PixelRTS files with Ed25519."""

    def __init__(self, private_key: Ed25519PrivateKey):
        self.private_key = private_key
        self.public_key = private_key.public_key()

    def sign_file(self, png_path: Path, output_path: Path = None) -> Path:
        """
        Sign a .rts.png file and add signature to metadata.

        Args:
            png_path: Path to the file to sign
            output_path: Optional output path (defaults to overwriting input)

        Returns:
            Path to the signed file
        """
        output_path = output_path or png_path

        # Read existing PNG
        png_data = png_path.read_bytes()
        img = Image.open(BytesIO(png_data))

        # Get existing metadata
        metadata = self._extract_metadata(img)
        if metadata is None:
            raise ValueError("Not a valid PixelRTS file")

        # Get data hash to sign
        data_hash_hex = metadata.get("hashes", {}).get("data")
        if data_hash_hex is None:
            raise ValueError("No data hash found in metadata")
        data_hash = bytes.fromhex(data_hash_hex)

        # Sign the hash
        signature = self.private_key.sign(data_hash)

        # Add signature info to metadata
        metadata["signature"] = {
            "algorithm": "Ed25519",
            "public_key": self.public_key.public_bytes_raw().hex(),
            "value": signature.hex()
        }

        # Update PNG with new metadata
        self._update_metadata(img, metadata)

        # Save
        buffer = BytesIO()
        img.save(buffer, format="PNG")
        output_path.write_bytes(buffer.getvalue())

        return output_path

    @staticmethod
    def generate_keypair() -> tuple[Ed25519PrivateKey, bytes]:
        """Generate a new Ed25519 keypair."""
        private_key = Ed25519PrivateKey.generate()
        public_key_bytes = private_key.public_key().public_bytes_raw()
        return private_key, public_key_bytes

    @staticmethod
    def save_private_key(private_key: Ed25519PrivateKey, path: Path) -> None:
        """Save private key to file (PEM format)."""
        pem = private_key.private_bytes(
            encoding=serialization.Encoding.PEM,
            format=serialization.PrivateFormat.PKCS8,
            encryption_algorithm=serialization.NoEncryption()
        )
        path.write_bytes(pem)

    @staticmethod
    def load_private_key(path: Path) -> Ed25519PrivateKey:
        """Load private key from PEM file."""
        pem_data = path.read_bytes()
        return serialization.load_pem_private_key(pem_data, password=None)
```

### Anti-Patterns to Avoid
- **Signing the entire PNG file**: Sign the data hash instead (already in metadata), avoids re-encoding issues
- **Storing signature in separate file**: Embed in PNG metadata for self-contained verification
- **Using RSA signatures**: Ed25519 is faster, smaller signatures (64 bytes vs 256+), and more secure
- **Signing raw decoded data directly**: Always sign the hash for performance with large files

## Don't Hand-Roll

Problems that look simple but have existing solutions:

| Problem | Don't Build | Use Instead | Why |
|---------|-------------|-------------|-----|
| Ed25519 signing | Custom crypto implementation | `cryptography.hazmat.primitives.asymmetric.ed25519` | Crypto is hard to get right; use battle-tested library |
| Key serialization | Custom binary format | PEM/PKCS8 or raw bytes | Standard formats, interoperable |
| PNG metadata access | Custom chunk parsing | PIL `Image.text` property | Handles encoding, chunk ordering |
| Signature encoding | Custom hex format | Standard hex encoding | 64 bytes = 128 hex chars |

**Key insight:** Ed25519 signatures are always exactly 64 bytes. Public keys are always 32 bytes. No variable-length handling needed.

## Common Pitfalls

### Pitfall 1: Signing the Wrong Data
**What goes wrong:** Signing the PNG file bytes instead of the decoded data hash causes verification failures when PNG is re-encoded
**Why it happens:** PNG encoding is not deterministic (metadata order, compression can vary)
**How to avoid:** Always sign the SHA256 hash of decoded data (already stored in `metadata["hashes"]["data"]`)
**Warning signs:** Signature fails after re-saving PNG even with no data changes

### Pitfall 2: Key Management Confusion
**What goes wrong:** Users don't know which key to use for verification
**Why it happens:** Multiple keys (embedded, env var, keyring) without clear precedence
**How to avoid:** Document precedence clearly: env var > embedded > fail
**Warning signs:** Verification works locally but fails in production

### Pitfall 3: Missing Public Key
**What goes wrong:** File is signed but no public key available for verification
**Why it happens:** Public key not embedded, env var not set
**How to avoid:** Always embed public key when signing; provide clear error message when no key available
**Warning signs:** "No public key available" error during verification

### Pitfall 4: Treating Unsigned as Failed
**What goes wrong:** Unsigned files reported as FAILED instead of SKIP
**Why it happens:** Conflating "not signed" with "signature invalid"
**How to avoid:** Return SKIP for unsigned files, FAIL only for invalid signatures
**Warning signs:** All legacy files show as failed after adding signature verification

## Code Examples

### Ed25519 Key Generation and Serialization
```python
# Source: https://cryptography.io/en/latest/hazmat/primitives/asymmetric/ed25519/
from cryptography.hazmat.primitives.asymmetric.ed25519 import Ed25519PrivateKey
from cryptography.hazmat.primitives import serialization

# Generate new keypair
private_key = Ed25519PrivateKey.generate()
public_key = private_key.public_key()

# Serialize to raw bytes (32 bytes each)
private_bytes = private_key.private_bytes_raw()
public_bytes = public_key.public_bytes_raw()

# Serialize to PEM (for storage)
private_pem = private_key.private_bytes(
    encoding=serialization.Encoding.PEM,
    format=serialization.PrivateFormat.PKCS8,
    encryption_algorithm=serialization.NoEncryption()
)

# Load from raw bytes
loaded_private = Ed25519PrivateKey.from_private_bytes(private_bytes)
loaded_public = Ed25519PublicKey.from_public_bytes(public_bytes)
```

### Signing and Verification
```python
# Source: https://cryptography.io/en/latest/hazmat/primitives/asymmetric/ed25519/
from cryptography.hazmat.primitives.asymmetric.ed25519 import Ed25519PrivateKey, Ed25519PublicKey
from cryptography.exceptions import InvalidSignature

# Sign a message (or hash)
message = b"data to sign"
signature = private_key.sign(message)  # Always 64 bytes

# Verify signature
try:
    public_key.verify(signature, message)
    print("Valid signature")
except InvalidSignature:
    print("Invalid signature")
```

### PNG Metadata Access
```python
# Source: Project pattern from pixelrts_v2_core.py
from PIL import Image
from io import BytesIO
import json

def read_png_metadata(png_path: Path) -> dict:
    """Read PixelRTS metadata from PNG."""
    img = Image.open(png_path)
    for key, value in img.text.items():
        if "PixelRTS" in str(value):
            # Parse JSON after magic prefix
            json_str = value[len("PixelRTS"):]
            return json.loads(json_str)
    return None

def write_png_metadata(png_path: Path, metadata: dict, output_path: Path):
    """Write PixelRTS metadata to PNG."""
    img = Image.open(png_path)
    metadata_str = "PixelRTS" + json.dumps(metadata, separators=(",", ":"))
    img.info["PixelRTS"] = metadata_str

    # Save with metadata
    buffer = BytesIO()
    img.save(buffer, format="PNG", pnginfo=PngInfo())
    output_path.write_bytes(buffer.getvalue())
```

## State of the Art

| Old Approach | Current Approach | When Changed | Impact |
|--------------|------------------|--------------|--------|
| RSA signatures | Ed25519 signatures | ~2017+ | Faster, smaller signatures, no padding oracle attacks |
| Detached signature files | Embedded metadata | Common now | Self-contained files, simpler distribution |
| Custom key formats | PEM/PKCS8 | Standard | Interoperability with openssl, ssh-keygen |

**Deprecated/outdated:**
- RSA-1024: Too weak, use Ed25519 or RSA-4096 minimum
- DSA: Has nonce reuse vulnerabilities, Ed25519 is deterministic
- Raw key storage: Use PEM format for private keys

## Open Questions

1. **Signature chunk naming**
   - What we know: PixelRTS metadata uses `PixelRTS` prefix in tEXt chunk
   - What's unclear: Should signature be in same chunk or separate `PixelRTS-Sig` chunk
   - Recommendation: Store in same metadata dict under `"signature"` key for atomic access

2. **Key rotation strategy**
   - What we know: Env var `PIXELRTS_PUBLIC_KEY` allows override
   - What's unclear: How to handle multiple trusted keys
   - Recommendation: Start with single key; multi-key support is ADV-02 requirement (future)

3. **Signing large files**
   - What we know: SHA256 hash already computed and stored in metadata
   - What's unclear: Performance impact of signing 1GB+ decoded data
   - Recommendation: Sign the hash (32 bytes), not the data - already handled by existing metadata

## Sources

### Primary (HIGH confidence)
- https://cryptography.io/en/latest/hazmat/primitives/asymmetric/ed25519/ - Ed25519 API reference
- https://pynacl.readthedocs.io/en/latest/signing/ - PyNaCl reference (for comparison)
- Project source: `systems/visual_shell/swarm/task_signer.py` - Existing Ed25519 usage pattern
- Project source: `systems/pixel_compiler/verification/` - Existing verification infrastructure

### Secondary (MEDIUM confidence)
- Project source: `systems/pixel_compiler/pixelrts_v2_core.py` - Metadata format and PNG handling

### Tertiary (LOW confidence)
- N/A - All core information from authoritative sources

## Metadata

**Confidence breakdown:**
- Standard stack: HIGH - Project already uses `cryptography` for Ed25519
- Architecture: HIGH - VerificationStep pattern well-established in Phases 19-20
- Pitfalls: HIGH - Based on common Ed25519 implementation mistakes

**Research date:** 2026-03-09
**Valid until:** 30 days - Ed25519 and cryptography library are stable

---

## Implementation Notes

### Environment Variable Design
```bash
# Override public key for verification
export PIXELRTS_PUBLIC_KEY="abcdef123456..."  # 64 hex chars = 32 bytes

# Private key location for signing (not used in verification)
export PIXELRTS_PRIVATE_KEY_PATH="/path/to/private.pem"
```

### CLI Command Design (for Phase 22)
```bash
# Verify signature
pixelrts verify file.rts.png --check-signature

# Sign a file
pixelrts sign file.rts.png --key private.pem --output signed.rts.png

# Generate keypair
pixelrts keygen --private-key private.pem --public-key public.pem
```

### Integration Points
1. **VerificationContext**: Add `signature` property to lazy-load signature data
2. **VerificationResult**: Signature step runs after consistency verification (needs hash)
3. **PixelRTSMetadata**: Add `signature` field to metadata schema
4. **__init__.py**: Export `SignatureVerifier` and `FileSigner`
