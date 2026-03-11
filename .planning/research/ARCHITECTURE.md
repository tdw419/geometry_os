# Architecture Patterns: Vision Integrity Verification for PixelRTS

**Domain:** PNG-based OS container integrity verification
**Researched:** 2026-03-09

## Recommended Architecture

Vision Integrity Verification integrates as a **parallel verification layer** alongside existing PixelRTS components. The architecture follows the existing patterns of `infinite_map_integrity.py` while adding vision-specific verification capabilities.

```
                                    ┌─────────────────────────────────────┐
                                    │        pixelrts_cli.py              │
                                    │   (verify command entry point)      │
                                    └──────────────┬──────────────────────┘
                                                   │
                                                   ▼
                    ┌──────────────────────────────────────────────────────────┐
                    │               VisionIntegrityVerifier                    │
                    │  (New component - orchestrates verification pipeline)    │
                    │                                                          │
                    │  verify_png_structure()  ──────────────────────────────► │
                    │  verify_data_consistency() ─────────────────────────────► │
                    │  verify_segment_integrity() ────────────────────────────► │
                    │  verify_signatures() ──────────────────────────────────► │
                    └──────────┬───────────────────────────────────┬───────────┘
                               │                                   │
              ┌────────────────┴────────────────┐    ┌─────────────┴─────────────┐
              │                                 │    │                           │
              ▼                                 ▼    ▼                           │
┌─────────────────────────┐    ┌─────────────────────────────────┐              │
│  pixelrts_v2_core.py    │    │  pixelrts_vision_analyzer.py    │              │
│  (Existing: Decoder,    │    │  (Existing: Pattern detection,  │              │
│   hash verification)    │    │   entropy analysis)             │              │
└─────────────┬───────────┘    └─────────────┬───────────────────┘              │
              │                              │                                   │
              │    ┌─────────────────────────┴────────────────────┐             │
              │    │                                              │             │
              │    ▼                                              ▼             │
              │  ┌─────────────────────────┐    ┌──────────────────────────┐   │
              │  │  StructureVerifier      │    │  ConsistencyVerifier     │   │
              │  │  (New: PNG structure,   │    │  (New: Data vs visual    │   │
              │  │   chunk validation)     │    │   consistency check)     │   │
              │  └─────────────────────────┘    └──────────────────────────┘   │
              │                                                                │
              │    ┌─────────────────────────────────────────────────────┐     │
              └───►│  infinite_map_integrity.py                          │     │
                   │  (Existing: ChecksumCalculator, IntegrityScanner)   │     │
                   └─────────────────────────────────────────────────────┘     │
```

### Component Boundaries

| Component | Responsibility | Communicates With |
|-----------|---------------|-------------------|
| `VisionIntegrityVerifier` | Orchestrates all verification steps, aggregates results | All verifiers, CLI |
| `StructureVerifier` | PNG structure validation, chunk integrity | `VisionIntegrityVerifier` |
| `ConsistencyVerifier` | Encoded data vs visual pixel consistency | `PixelRTSDecoder`, `PixelRTSVisionAnalyzer` |
| `SegmentIntegrityChecker` | Region-specific integrity (kernel, initrd, disk) | `PixelRTSMetadata`, `infinite_map_integrity` |
| `SignatureVerifier` | Cryptographic signature validation | `VisionIntegrityVerifier`, metadata |
| `VerificationResult` | Aggregated verification output | CLI, calling code |

### Data Flow

```
Input: .rts.png file (+ optional .meta.json sidecar)

1. Load Phase
   ├── Read PNG file
   ├── Extract metadata from tEXt chunks
   └── Load sidecar JSON if present

2. Structure Verification
   ├── Validate PNG signature (0x89 PNG)
   ├── Check required tEXt chunks exist
   ├── Verify IHDR dimensions match metadata
   └── Scan for chunk corruption

3. Data Consistency Verification
   ├── Decode pixels via Hilbert curve
   ├── Compare decoded bytes with expected size
   ├── Compute SHA256 of decoded data
   └── Match against metadata.data_hash

4. Segment Integrity (if segments defined)
   ├── For each segment (kernel, initrd, disk):
   │   ├── Extract segment byte range
   │   ├── Compute segment hash
   │   └── Compare to metadata.hashes[segment]
   └── Report per-segment status

5. Signature Verification (if signature present)
   ├── Extract signature from metadata
   ├── Verify signature over data hash
   └── Report signature validity

Output: VerificationResult with detailed status
```

## Patterns to Follow

### Pattern 1: Verification Chain

**What:** Chain of responsibility pattern for verification steps
**When:** Multiple independent verification steps that can pass/fail independently
**Why:** Allows partial success reporting, early termination on critical failures

```python
class VerificationStep(ABC):
    """Base class for verification steps."""

    @property
    @abstractmethod
    def name(self) -> str:
        """Step name for reporting."""
        pass

    @abstractmethod
    def verify(self, context: VerificationContext) -> StepResult:
        """Execute verification step."""
        pass


class VerificationChain:
    """Orchestrates verification steps."""

    def __init__(self, steps: List[VerificationStep]):
        self.steps = steps

    def run(self, context: VerificationContext) -> VerificationResult:
        results = []
        for step in self.steps:
            result = step.verify(context)
            results.append(result)
            if result.critical_failure:
                break  # Stop on critical failures
        return VerificationResult(steps=results)
```

### Pattern 2: Result Aggregation

**What:** Structured result objects with per-component status
**When:** Complex verification with multiple independent checks
**Why:** Clear CLI output, programmatic access to individual check results

```python
@dataclass
class VerificationResult:
    """Aggregated verification result."""
    success: bool
    structure: StructureResult
    consistency: ConsistencyResult
    segments: Dict[str, SegmentResult]
    signature: Optional[SignatureResult]
    overall_hash: str
    verified_at: datetime

    def to_cli_output(self) -> str:
        """Format for terminal output."""
        lines = [
            f"PixelRTS Integrity Verification",
            f"=" * 40,
            f"Structure:  {self.structure.status}",
            f"Consistency: {self.consistency.status}",
        ]
        for name, result in self.segments.items():
            lines.append(f"  {name}: {result.status}")
        if self.signature:
            lines.append(f"Signature:  {self.signature.status}")
        return "\n".join(lines)
```

### Pattern 3: Integration with Existing Decoder

**What:** Reuse existing `PixelRTSDecoder` for data extraction
**When:** Need decoded data for verification
**Why:** Avoid code duplication, leverage tested implementation

```python
class ConsistencyVerifier(VerificationStep):
    """Verify decoded data matches visual representation."""

    def __init__(self):
        self.decoder = PixelRTSDecoder()

    def verify(self, context: VerificationContext) -> StepResult:
        # Use existing decoder to extract data
        decoded_data = self.decoder.decode(context.png_bytes)

        # Verify against metadata hash
        actual_hash = PixelRTSMetadata.hash_data(decoded_data)
        expected_hash = context.metadata.get("data_hash")

        if actual_hash == expected_hash:
            return StepResult(success=True, status="HASH_MATCH")
        else:
            return StepResult(
                success=False,
                status="HASH_MISMATCH",
                details={
                    "expected": expected_hash,
                    "actual": actual_hash
                }
            )
```

## Anti-Patterns to Avoid

### Anti-Pattern 1: Duplicate Decoding Logic

**What:** Implementing new Hilbert curve decoding instead of reusing `PixelRTSDecoder`
**Why bad:** Divergent implementations, maintenance burden, potential bugs
**Instead:** Use `PixelRTSDecoder.decode()` and `PixelRTSDecoder.decode_range()` for all data extraction

### Anti-Pattern 2: Tight Coupling to Metadata Format

**What:** Hardcoding metadata field names throughout verification code
**Why bad:** Fragile to metadata format changes, hard to test
**Instead:** Create a `VerificationContext` class that abstracts metadata access:

```python
class VerificationContext:
    """Shared context for verification steps."""

    def __init__(self, png_path: str):
        self.png_path = Path(png_path)
        self.png_bytes = self.png_path.read_bytes()
        self.metadata = self._load_metadata()
        self._decoded_data = None

    @property
    def data_hash(self) -> Optional[str]:
        return self.metadata.get("data_hash")

    @property
    def segments(self) -> Dict[str, SegmentInfo]:
        return self.metadata.get("segments", {})

    def get_decoded_data(self) -> bytes:
        if self._decoded_data is None:
            decoder = PixelRTSDecoder()
            self._decoded_data = decoder.decode(self.png_bytes)
        return self._decoded_data
```

### Anti-Pattern 3: Monolithic Verifier

**What:** Single large `verify()` function with all checks inline
**Why bad:** Hard to test individual checks, hard to extend, unclear responsibilities
**Instead:** Use `VerificationStep` pattern with composable steps

## Scalability Considerations

| Concern | At 1MB container | At 100MB container | At 1GB container |
|---------|------------------|--------------------|--------------------|
| Full decode | ~50ms | ~500ms | ~5s |
| Range decode | ~1ms | ~1ms | ~1ms |
| Hash computation | ~10ms | ~100ms | ~1s |
| Structure check | ~5ms | ~5ms | ~5ms |

**Optimization strategy:**

1. **Lazy decoding:** Only decode when consistency check requested
2. **Range-based segment verification:** Use `decode_range()` for segment-specific hashes
3. **Parallel verification:** Run independent checks concurrently
4. **Incremental verification:** Cache results, only re-verify changed segments

## Integration Points with Existing Components

### pixelrts_v2_core.py

**Existing functionality to leverage:**
- `PixelRTSDecoder.decode()` - Full data extraction
- `PixelRTSDecoder.decode_range()` - Partial data extraction for segment verification
- `PixelRTSDecoder.verify_hash()` - Hash comparison utility
- `PixelRTSMetadata.hash_data()` - SHA256 computation
- `PixelRTSMetadata.decode_png_text()` - Metadata extraction from tEXt chunks

**No modifications needed** - use as-is

### pixelrts_vision_analyzer.py

**Existing functionality to leverage:**
- `PixelRTSVisionAnalyzer._load_metadata()` - Metadata loading (sidecar + PNG)
- `PixelRTSVisionAnalyzer.get_visual_summary()` - Basic image info
- `PixelRTSVisionAnalyzer.get_entropy_map()` - Entropy analysis (anomaly detection)

**Potential enhancement:** Add `detect_anomalies()` method for tampering detection

### pixelrts_cli.py

**Integration point:** Add `verify` subcommand

```python
def cmd_verify(args):
    """Handle verify command."""
    verifier = VisionIntegrityVerifier()
    result = verifier.verify(args.input)

    if args.json:
        print(json.dumps(result.to_dict(), indent=2))
    else:
        print(result.to_cli_output())

    sys.exit(0 if result.success else 1)
```

### infinite_map_integrity.py

**Existing functionality to reference:**
- `ChecksumCalculator` - Multi-algorithm checksum support
- `IntegrityStatus` - Status enum (reuse or mirror)
- `IntegrityReport` - Report structure (mirror pattern)

**No modifications needed** - use as reference for patterns

### boot_bridge.py

**Integration consideration:** Verification before boot

```python
# Optional: Add verification to BootBridge.boot()
def boot(self, verify_integrity: bool = False, ...):
    if verify_integrity:
        verifier = VisionIntegrityVerifier()
        result = verifier.verify(self.rts_png_path)
        if not result.success:
            raise BootError(f"Integrity verification failed: {result}")
    # ... existing boot logic
```

## New Components Required

### 1. VisionIntegrityVerifier

**Location:** `systems/pixel_compiler/vision_integrity_verifier.py`
**Purpose:** Main orchestrator for all verification steps
**Dependencies:** `pixelrts_v2_core`, `pixelrts_vision_analyzer`

```python
class VisionIntegrityVerifier:
    """
    Main integrity verification orchestrator.

    Coordinates multiple verification steps:
    - PNG structure validation
    - Data consistency verification
    - Segment integrity checks
    - Cryptographic signature verification
    """

    def __init__(self, strict: bool = False):
        self.strict = strict
        self.steps = [
            StructureVerifier(),
            ConsistencyVerifier(),
            SegmentIntegrityChecker(),
            SignatureVerifier(),
        ]

    def verify(self, rts_path: str) -> VerificationResult:
        """Run all verification steps."""
        context = VerificationContext(rts_path)
        results = []
        for step in self.steps:
            result = step.verify(context)
            results.append(result)
            if not result.success and self.strict:
                break
        return VerificationResult.from_step_results(results)
```

### 2. VerificationContext

**Location:** `systems/pixel_compiler/vision_integrity_verifier.py`
**Purpose:** Shared state and data access for verification steps

### 3. VerificationStep (base class)

**Location:** `systems/pixel_compiler/vision_integrity_verifier.py`
**Purpose:** Abstract base for individual verification steps

### 4. Individual Verifiers

**Location:** `systems/pixel_compiler/vision_integrity_verifier.py`
**Classes:**
- `StructureVerifier` - PNG structure checks
- `ConsistencyVerifier` - Data vs visual consistency
- `SegmentIntegrityChecker` - Region-specific verification
- `SignatureVerifier` - Cryptographic signature validation

### 5. VerificationResult

**Location:** `systems/pixel_compiler/vision_integrity_verifier.py`
**Purpose:** Structured result with CLI formatting

## Build Order

Considering existing dependencies, recommended build order:

1. **Phase 1: Core Verification Infrastructure**
   - `VerificationContext` - Data access abstraction
   - `VerificationStep` - Abstract base class
   - `StepResult` - Individual step result
   - `VerificationResult` - Aggregated result with CLI formatting

2. **Phase 2: Basic Verifiers**
   - `StructureVerifier` - PNG structure validation
   - `ConsistencyVerifier` - Hash verification (reuses `PixelRTSDecoder`)

3. **Phase 3: Segment Verification**
   - `SegmentIntegrityChecker` - Region-specific verification
   - Integration with `decode_range()` for partial extraction

4. **Phase 4: Cryptographic Signatures**
   - `SignatureVerifier` - Ed25519 signature support
   - Signature key management (optional, for signing)

5. **Phase 5: CLI Integration**
   - Add `verify` command to `pixelrts_cli.py`
   - JSON output support
   - Human-readable output with color

6. **Phase 6: Boot Integration (Optional)**
   - Add `verify_integrity` flag to `BootBridge.boot()`
   - Pre-boot verification option

## Testing Strategy

Each component should have corresponding tests:

```
systems/pixel_compiler/tests/
├── test_vision_integrity_verifier.py
│   ├── TestVerificationContext
│   ├── TestStructureVerifier
│   ├── TestConsistencyVerifier
│   ├── TestSegmentIntegrityChecker
│   ├── TestSignatureVerifier
│   └── TestVisionIntegrityVerifier (integration)
```

**Test fixtures needed:**
- Valid `.rts.png` with matching metadata
- Corrupted `.rts.png` (modified bytes)
- Tampered metadata (hash mismatch)
- Invalid PNG structure
- Container with segments (kernel, initrd)
- Signed container (for signature verification)

## Sources

- Existing codebase analysis: `/home/jericho/zion/projects/geometry_os/geometry_os/systems/pixel_compiler/`
- Pattern reference: `infinite_map_integrity.py` - ChecksumCalculator, IntegrityScanner patterns
- Decoder reference: `pixelrts_v2_core.py` - PixelRTSDecoder, PixelRTSMetadata
- Vision reference: `pixelrts_vision_analyzer.py` - Pattern detection, entropy analysis
- CLI reference: `pixelrts_cli.py` - Command structure patterns
- Boot reference: `boot_bridge.py` - Integration point for pre-boot verification
