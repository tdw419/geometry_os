# Visual Consistency Contract (VCC) Enforcement

> **For agentic workers:** REQUIRED: Use superpowers:subagent-driven-development (if subagents available) or superpowers:executing-plans to implement this plan. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Create automated verification that glyph rendering is semantically and visually identical across Foundry, Shell, and Kernel layers.

**Architecture:** A VCC verification script that runs at atlas generation time, producing a signed contract file. Each layer validates against this contract at initialization. Includes schema validation, visual hash comparison, and semantic opcode consistency checks.

**Tech Stack:** Python (verification), JSON Schema (contract), SHA-256 (hashing), pytest (testing)

---

## File Structure

| File | Purpose |
|------|---------|
| `systems/vcc/__init__.py` | VCC module entry point |
| `systems/vcc/contract.py` | Contract generation and signing |
| `systems/vcc/validator.py` | Cross-layer validation logic |
| `systems/vcc/schemas.py` | JSON schema definitions |
| `systems/vcc/visual_hash.py` | Perceptual hash for atlas comparison |
| `systems/vcc/tests/test_contract.py` | Contract tests |
| `systems/vcc/tests/test_validator.py` | Validation tests |
| `systems/vcc/vcc_contract.json` | Generated contract file |
| `systems/glyph_stratum/generate_font_atlas.py` | Modified to emit VCC |

---

## Chunk 1: VCC Module Foundation

### Task 1: Create VCC Module Structure

**Files:**
- Create: `systems/vcc/__init__.py`
- Create: `systems/vcc/schemas.py`

- [ ] **Step 1: Create the VCC module directory**

```bash
mkdir -p systems/vcc/tests
touch systems/vcc/__init__.py systems/vcc/schemas.py
```

- [ ] **Step 2: Write the schema definitions**

```python
# systems/vcc/schemas.py
"""
JSON Schema definitions for Visual Consistency Contract.

The VCC ensures glyphs are identical across:
- Foundry (Python/FreeType)
- Shell (TypeScript/PixiJS/WebGPU)
- Kernel (Rust/WGPU)
"""

VCC_CONTRACT_SCHEMA = {
    "$schema": "http://json-schema.org/draft-07/schema#",
    "type": "object",
    "required": ["version", "generated_at", "atlas_hash", "glyph_count", "layers"],
    "properties": {
        "version": {
            "type": "integer",
            "description": "VCC schema version",
            "const": 1
        },
        "generated_at": {
            "type": "string",
            "format": "date-time",
            "description": "ISO 8601 timestamp of contract generation"
        },
        "atlas_hash": {
            "type": "object",
            "required": ["sha256", "size_bytes", "dimensions"],
            "properties": {
                "sha256": {"type": "string", "pattern": "^[a-f0-9]{64}$"},
                "size_bytes": {"type": "integer", "minimum": 0},
                "dimensions": {
                    "type": "array",
                    "items": {"type": "integer"},
                    "minItems": 2,
                    "maxItems": 2
                }
            }
        },
        "glyph_count": {
            "type": "integer",
            "minimum": 0,
            "description": "Number of glyphs in atlas"
        },
        "opcode_mappings": {
            "type": "object",
            "description": "Opcode name to ID mapping",
            "additionalProperties": {"type": "integer"}
        },
        "layers": {
            "type": "object",
            "required": ["foundry", "shell", "kernel"],
            "properties": {
                "foundry": {
                    "type": "object",
                    "required": ["glyph_metrics_schema", "source_file"],
                    "properties": {
                        "glyph_metrics_schema": {"type": "string"},
                        "source_file": {"type": "string"}
                    }
                },
                "shell": {
                    "type": "object",
                    "required": ["atlas_path", "positions_path"],
                    "properties": {
                        "atlas_path": {"type": "string"},
                        "positions_path": {"type": "string"}
                    }
                },
                "kernel": {
                    "type": "object",
                    "required": ["glyph_metrics_struct", "shader_file"],
                    "properties": {
                        "glyph_metrics_struct": {"type": "string"},
                        "shader_file": {"type": "string"}
                    }
                }
            }
        },
        "signatures": {
            "type": "object",
            "description": "Layer signatures (verified at runtime)",
            "additionalProperties": {"type": "string"}
        }
    }
}

GLYPH_METRICS_SCHEMA = {
    "$schema": "http://json-schema.org/draft-07/schema#",
    "type": "object",
    "required": ["char_code", "uv_min_x", "uv_min_y", "uv_max_x", "uv_max_y",
                 "width", "height", "bearing_x", "bearing_y", "advance"],
    "properties": {
        "char_code": {"type": "integer"},
        "uv_min_x": {"type": "number"},
        "uv_min_y": {"type": "number"},
        "uv_max_x": {"type": "number"},
        "uv_max_y": {"type": "number"},
        "width": {"type": "number"},
        "height": {"type": "number"},
        "bearing_x": {"type": "number"},
        "bearing_y": {"type": "number"},
        "advance": {"type": "number"}
    }
}
```

- [ ] **Step 3: Commit the schema**

```bash
git add systems/vcc/__init__.py systems/vcc/schemas.py
git commit -m "feat(vcc): add JSON schema definitions for Visual Consistency Contract"
```

---

### Task 2: Create Visual Hash Module

**Files:**
- Create: `systems/vcc/visual_hash.py`
- Create: `systems/vcc/tests/test_visual_hash.py`

- [ ] **Step 1: Write the failing test**

```python
# systems/vcc/tests/test_visual_hash.py
"""Tests for visual hash computation."""

import pytest
import numpy as np
from systems.vcc.visual_hash import compute_atlas_hash, compute_perceptual_hash


class TestComputeAtlasHash:
    """Tests for atlas SHA-256 hash computation."""

    def test_compute_atlas_hash_returns_64_char_hex(self):
        """Hash should be 64 character hex string."""
        # Create a simple 4x4 RGBA test atlas
        test_data = np.zeros((4, 4, 4), dtype=np.uint8)
        test_data[1, 1] = [255, 255, 255, 255]

        result = compute_atlas_hash(test_data)

        assert isinstance(result, str)
        assert len(result) == 64
        assert all(c in '0123456789abcdef' for c in result)

    def test_identical_atlases_produce_same_hash(self):
        """Identical atlas data should produce identical hashes."""
        test_data = np.random.randint(0, 256, (16, 16, 4), dtype=np.uint8)

        hash1 = compute_atlas_hash(test_data)
        hash2 = compute_atlas_hash(test_data)

        assert hash1 == hash2

    def test_different_atlases_produce_different_hashes(self):
        """Different atlas data should produce different hashes."""
        data1 = np.zeros((4, 4, 4), dtype=np.uint8)
        data2 = np.ones((4, 4, 4), dtype=np.uint8) * 255

        hash1 = compute_atlas_hash(data1)
        hash2 = compute_atlas_hash(data2)

        assert hash1 != hash2


class TestComputePerceptualHash:
    """Tests for perceptual hash computation."""

    def test_perceptual_hash_is_16_hex_chars(self):
        """Perceptual hash should be 16 character hex string."""
        test_data = np.zeros((64, 64, 4), dtype=np.uint8)
        test_data[10:50, 10:50] = [255, 255, 255, 255]

        result = compute_perceptual_hash(test_data)

        assert isinstance(result, str)
        assert len(result) == 16

    def test_similar_images_similar_hash(self):
        """Visually similar images should have similar hashes."""
        # Create base image
        base = np.zeros((64, 64, 4), dtype=np.uint8)
        base[10:50, 10:50] = [255, 255, 255, 255]

        # Slightly modified (1 pixel difference)
        modified = base.copy()
        modified[11, 11] = [254, 254, 254, 255]

        hash_base = compute_perceptual_hash(base)
        hash_modified = compute_perceptual_hash(modified)

        # Hamming distance should be small (<= 4 bits different)
        hamming = sum(c1 != c2 for c1, c2 in zip(hash_base, hash_modified))
        assert hamming <= 4
```

- [ ] **Step 2: Run tests to verify they fail**

```bash
cd /home/jericho/zion/projects/geometry_os/geometry_os
python -m pytest systems/vcc/tests/test_visual_hash.py -v
```
Expected: FAIL with "ModuleNotFoundError: No module named 'systems.vcc.visual_hash'"

- [ ] **Step 3: Write the implementation**

```python
# systems/vcc/visual_hash.py
"""
Visual hash computation for VCC.

Provides:
- compute_atlas_hash: SHA-256 hash of raw atlas bytes
- compute_perceptual_hash: DCT-based perceptual hash for visual comparison
"""

import hashlib
import numpy as np
from typing import Optional


def compute_atlas_hash(atlas_data: np.ndarray) -> str:
    """
    Compute SHA-256 hash of atlas pixel data.

    Args:
        atlas_data: 3D numpy array (height, width, 4) in RGBA format

    Returns:
        64-character hex string (SHA-256)
    """
    if atlas_data.ndim != 3 or atlas_data.shape[2] != 4:
        raise ValueError(f"Expected RGBA array (H, W, 4), got shape {atlas_data.shape}")

    # Convert to bytes and hash
    raw_bytes = atlas_data.astype(np.uint8).tobytes()
    return hashlib.sha256(raw_bytes).hexdigest()


def compute_perceptual_hash(atlas_data: np.ndarray, hash_size: int = 8) -> str:
    """
    Compute perceptual hash using DCT.

    This hash is resilient to minor pixel changes and useful for
    detecting visual drift between layers.

    Args:
        atlas_data: 3D numpy array (height, width, 4) in RGBA format
        hash_size: Size of the hash (default 8 = 64 bits = 16 hex chars)

    Returns:
        16-character hex string (64-bit perceptual hash)
    """
    from scipy.fftpack import dct

    # Convert to grayscale using luminance
    gray = (0.299 * atlas_data[:, :, 0] +
            0.587 * atlas_data[:, :, 1] +
            0.114 * atlas_data[:, :, 2])

    # Resize to hash_size * 4 for better DCT
    resize_dim = hash_size * 4
    if gray.shape[0] != resize_dim or gray.shape[1] != resize_dim:
        # Simple box resize
        y_scale = gray.shape[0] / resize_dim
        x_scale = gray.shape[1] / resize_dim
        resized = np.zeros((resize_dim, resize_dim), dtype=np.float64)
        for y in range(resize_dim):
            for x in range(resize_dim):
                src_y = int(y * y_scale)
                src_x = int(x * x_scale)
                resized[y, x] = gray[src_y, src_x]
        gray = resized

    # Apply DCT
    dct_result = dct(dct(gray, axis=0), axis=1)

    # Take top-left block (low frequencies)
    dct_low = dct_result[:hash_size, :hash_size]

    # Compute median (excluding DC component)
    median = np.median(dct_low.flatten()[1:])

    # Generate hash: 1 if above median, 0 otherwise
    bits = (dct_low > median).flatten()

    # Convert to hex
    hash_int = 0
    for bit in bits[:64]:  # Limit to 64 bits
        hash_int = (hash_int << 1) | int(bit)

    return f"{hash_int:016x}"
```

- [ ] **Step 4: Run tests to verify they pass**

```bash
python -m pytest systems/vcc/tests/test_visual_hash.py -v
```
Expected: All tests PASS

- [ ] **Step 5: Commit**

```bash
git add systems/vcc/visual_hash.py systems/vcc/tests/test_visual_hash.py
git commit -m "feat(vcc): add visual hash computation for atlas comparison"
```

---

## Chunk 2: Contract Generation

### Task 3: Create Contract Generator

**Files:**
- Create: `systems/vcc/contract.py`
- Create: `systems/vcc/tests/test_contract.py`

- [ ] **Step 1: Write the failing test**

```python
# systems/vcc/tests/test_contract.py
"""Tests for VCC contract generation and verification."""

import pytest
import json
import tempfile
import numpy as np
from datetime import datetime
from pathlib import Path
from systems.vcc.contract import VCCContract, generate_contract


class TestVCCContract:
    """Tests for VCC contract data structure."""

    def test_contract_creation_requires_atlas_path(self):
        """Contract should require atlas path."""
        with pytest.raises(ValueError, match="atlas_path"):
            generate_contract(atlas_path=None, positions_path="test.json")

    def test_contract_includes_atlas_hash(self):
        """Contract should include SHA-256 hash of atlas."""
        with tempfile.NamedTemporaryFile(suffix=".raw", delete=False) as atlas:
            # Write 4x4 RGBA test data
            test_data = np.zeros((4, 4, 4), dtype=np.uint8)
            test_data[1, 1] = [255, 255, 255, 255]
            atlas.write(test_data.tobytes())
            atlas_path = atlas.name

        with tempfile.NamedTemporaryFile(suffix=".json", delete=False, mode='w') as pos:
            json.dump({
                "metadata": {"atlas_size": [4, 4]},
                "glyphs": [{"char_code": 0}]
            }, pos)
            positions_path = pos.name

        try:
            contract = generate_contract(
                atlas_path=atlas_path,
                positions_path=positions_path
            )

            assert "atlas_hash" in contract
            assert "sha256" in contract["atlas_hash"]
            assert len(contract["atlas_hash"]["sha256"]) == 64
        finally:
            Path(atlas_path).unlink()
            Path(positions_path).unlink()

    def test_contract_validates_against_schema(self):
        """Generated contract should validate against VCC schema."""
        from systems.vcc.schemas import VCC_CONTRACT_SCHEMA
        import jsonschema

        with tempfile.NamedTemporaryFile(suffix=".raw", delete=False) as atlas:
            test_data = np.zeros((4, 4, 4), dtype=np.uint8)
            atlas.write(test_data.tobytes())
            atlas_path = atlas.name

        with tempfile.NamedTemporaryFile(suffix=".json", delete=False, mode='w') as pos:
            json.dump({
                "metadata": {"atlas_size": [4, 4]},
                "glyphs": []
            }, pos)
            positions_path = pos.name

        try:
            contract = generate_contract(
                atlas_path=atlas_path,
                positions_path=positions_path
            )

            # Should not raise
            jsonschema.validate(contract, VCC_CONTRACT_SCHEMA)
        finally:
            Path(atlas_path).unlink()
            Path(positions_path).unlink()


class TestContractSigning:
    """Tests for contract signing and verification."""

    def test_contract_includes_generation_timestamp(self):
        """Contract should include ISO 8601 timestamp."""
        with tempfile.NamedTemporaryFile(suffix=".raw", delete=False) as atlas:
            np.zeros((4, 4, 4), dtype=np.uint8).tofile(atlas)
            atlas_path = atlas.name

        with tempfile.NamedTemporaryFile(suffix=".json", delete=False, mode='w') as pos:
            json.dump({"metadata": {"atlas_size": [4, 4]}, "glyphs": []}, pos)
            positions_path = pos.name

        try:
            contract = generate_contract(atlas_path, positions_path)

            assert "generated_at" in contract
            # Should parse as ISO 8601
            datetime.fromisoformat(contract["generated_at"].replace('Z', '+00:00'))
        finally:
            Path(atlas_path).unlink()
            Path(positions_path).unlink()
```

- [ ] **Step 2: Run tests to verify they fail**

```bash
python -m pytest systems/vcc/tests/test_contract.py -v
```
Expected: FAIL with "ModuleNotFoundError"

- [ ] **Step 3: Write the implementation**

```python
# systems/vcc/contract.py
"""
Visual Consistency Contract generation and verification.

The VCC is a signed document that captures the state of the font
atlas at generation time. All layers validate against this contract.
"""

import json
import hashlib
from datetime import datetime, timezone
from pathlib import Path
from typing import Dict, Any, Optional
import numpy as np

from systems.vcc.schemas import VCC_CONTRACT_SCHEMA
from systems.vcc.visual_hash import compute_atlas_hash


class VCCContract:
    """Represents a Visual Consistency Contract."""

    def __init__(self, data: Dict[str, Any]):
        self.data = data
        self._validate()

    def _validate(self) -> None:
        """Validate contract against schema."""
        import jsonschema
        jsonschema.validate(self.data, VCC_CONTRACT_SCHEMA)

    @property
    def version(self) -> int:
        return self.data["version"]

    @property
    def atlas_hash(self) -> str:
        return self.data["atlas_hash"]["sha256"]

    @property
    def glyph_count(self) -> int:
        return self.data["glyph_count"]

    def to_json(self, path: Path) -> None:
        """Write contract to JSON file."""
        path.parent.mkdir(parents=True, exist_ok=True)
        with open(path, 'w') as f:
            json.dump(self.data, f, indent=2)

    @classmethod
    def from_json(cls, path: Path) -> "VCCContract":
        """Load contract from JSON file."""
        with open(path, 'r') as f:
            return cls(json.load(f))


def generate_contract(
    atlas_path: str,
    positions_path: str,
    opcode_mappings: Optional[Dict[str, int]] = None
) -> Dict[str, Any]:
    """
    Generate a VCC contract from atlas and positions files.

    Args:
        atlas_path: Path to the .raw atlas file
        positions_path: Path to the opcode_positions.json file
        opcode_mappings: Optional opcode name -> ID mapping

    Returns:
        Contract dictionary ready for serialization
    """
    if atlas_path is None:
        raise ValueError("atlas_path is required")

    atlas_path = Path(atlas_path)
    positions_path = Path(positions_path)

    # Read atlas file
    with open(atlas_path, 'rb') as f:
        atlas_bytes = f.read()

    # Compute SHA-256
    sha256 = hashlib.sha256(atlas_bytes).hexdigest()

    # Read positions file for metadata
    with open(positions_path, 'r') as f:
        positions = json.load(f)

    metadata = positions.get("metadata", {})
    atlas_size = metadata.get("atlas_size", [0, 0])
    glyphs = positions.get("glyphs", [])

    # Build contract
    contract = {
        "version": 1,
        "generated_at": datetime.now(timezone.utc).isoformat().replace('+00:00', 'Z'),
        "atlas_hash": {
            "sha256": sha256,
            "size_bytes": len(atlas_bytes),
            "dimensions": atlas_size
        },
        "glyph_count": len(glyphs),
        "opcode_mappings": opcode_mappings or {},
        "layers": {
            "foundry": {
                "glyph_metrics_schema": "systems.vcc.schemas.GLYPH_METRICS_SCHEMA",
                "source_file": "systems/fonts/font_renderer.py"
            },
            "shell": {
                "atlas_path": "systems/glyph_stratum/opcode_atlas.webp",
                "positions_path": "systems/glyph_stratum/opcode_positions.json"
            },
            "kernel": {
                "glyph_metrics_struct": "text_engine.rs::GlyphMetrics",
                "shader_file": "systems/infinite_map_rs/src/shaders/msdf_font.wgsl"
            }
        },
        "signatures": {}
    }

    return contract
```

- [ ] **Step 4: Run tests to verify they pass**

```bash
python -m pytest systems/vcc/tests/test_contract.py -v
```
Expected: All tests PASS

- [ ] **Step 5: Commit**

```bash
git add systems/vcc/contract.py systems/vcc/tests/test_contract.py
git commit -m "feat(vcc): add contract generation with schema validation"
```

---

## Chunk 3: Cross-Layer Validation

### Task 4: Create Layer Validator

**Files:**
- Create: `systems/vcc/validator.py`
- Create: `systems/vcc/tests/test_validator.py`

- [ ] **Step 1: Write the failing test**

```python
# systems/vcc/tests/test_validator.py
"""Tests for VCC cross-layer validation."""

import pytest
import json
import tempfile
import numpy as np
from pathlib import Path
from systems.vcc.validator import (
    validate_foundry_layer,
    validate_shell_layer,
    validate_kernel_layer,
    validate_all_layers,
    ValidationError
)


class TestFoundryValidation:
    """Tests for Foundry (Python) layer validation."""

    def test_validate_foundry_checks_positions_file(self):
        """Should verify positions file exists and is valid JSON."""
        with tempfile.NamedTemporaryFile(suffix=".json", delete=False, mode='w') as f:
            json.dump({"metadata": {}, "glyphs": []}, f)
            positions_path = f.name

        try:
            result = validate_foundry_layer(positions_path=positions_path)
            assert result["valid"] is True
        finally:
            Path(positions_path).unlink()

    def test_validate_foundry_fails_on_missing_file(self):
        """Should fail if positions file doesn't exist."""
        with pytest.raises(ValidationError, match="positions file not found"):
            validate_foundry_layer(positions_path="/nonexistent/path.json")


class TestShellValidation:
    """Tests for Shell (TypeScript/WebGPU) layer validation."""

    def test_validate_shell_checks_atlas_webp_exists(self):
        """Should verify WebP atlas exists."""
        # Create a minimal contract
        contract = {
            "layers": {
                "shell": {
                    "atlas_path": "test_atlas.webp"
                }
            }
        }

        with tempfile.NamedTemporaryFile(suffix=".webp", delete=False) as f:
            f.write(b"RIFF")  # Minimal WebP header
            atlas_path = f.name

        try:
            result = validate_shell_layer(
                contract=contract,
                atlas_base_dir=str(Path(atlas_path).parent),
                atlas_filename=Path(atlas_path).name
            )
            assert result["valid"] is True
        finally:
            Path(atlas_path).unlink()


class TestKernelValidation:
    """Tests for Kernel (Rust/WGPU) layer validation."""

    def test_validate_kernel_checks_glyph_metrics_struct(self):
        """Should verify GlyphMetrics struct exists in Rust."""
        rust_content = '''
pub struct GlyphMetrics {
    pub char_code: u32,
    pub uv_min_x: f32,
    pub uv_min_y: f32,
    pub uv_max_x: f32,
    pub uv_max_y: f32,
    pub width: f32,
    pub height: f32,
    pub bearing_x: f32,
    pub bearing_y: f32,
    pub advance: f32,
}
'''
        with tempfile.NamedTemporaryFile(suffix=".rs", delete=False, mode='w') as f:
            f.write(rust_content)
            rust_path = f.name

        try:
            result = validate_kernel_layer(rust_file=rust_path)
            assert result["valid"] is True
            assert result["glyph_metrics_found"] is True
        finally:
            Path(rust_path).unlink()

    def test_validate_kernel_fails_on_missing_fields(self):
        """Should fail if GlyphMetrics is missing required fields."""
        rust_content = '''
pub struct GlyphMetrics {
    pub char_code: u32,
    // Missing most fields
}
'''
        with tempfile.NamedTemporaryFile(suffix=".rs", delete=False, mode='w') as f:
            f.write(rust_content)
            rust_path = f.name

        try:
            with pytest.raises(ValidationError, match="missing.*fields"):
                validate_kernel_layer(rust_file=rust_path)
        finally:
            Path(rust_path).unlink()
```

- [ ] **Step 2: Run tests to verify they fail**

```bash
python -m pytest systems/vcc/tests/test_validator.py -v
```
Expected: FAIL with "ModuleNotFoundError"

- [ ] **Step 3: Write the implementation**

```python
# systems/vcc/validator.py
"""
Cross-layer validation for Visual Consistency Contract.

Validates that all three layers (Foundry, Shell, Kernel) are
using consistent glyph definitions.
"""

import json
import re
from pathlib import Path
from typing import Dict, Any, Optional, List


class ValidationError(Exception):
    """Raised when VCC validation fails."""
    pass


def validate_foundry_layer(
    positions_path: str,
    expected_glyph_count: Optional[int] = None
) -> Dict[str, Any]:
    """
    Validate Foundry (Python/FreeType) layer.

    Args:
        positions_path: Path to opcode_positions.json
        expected_glyph_count: Optional expected glyph count

    Returns:
        Validation result dict with 'valid' and optional 'errors'
    """
    path = Path(positions_path)
    if not path.exists():
        raise ValidationError(f"positions file not found: {positions_path}")

    with open(path, 'r') as f:
        positions = json.load(f)

    glyphs = positions.get("glyphs", [])
    metadata = positions.get("metadata", {})

    errors = []

    # Check required metadata fields
    required_meta = ["atlas_size", "glyph_count"]
    for field in required_meta:
        if field not in metadata:
            errors.append(f"Missing metadata field: {field}")

    # Check glyph count
    if expected_glyph_count is not None:
        if len(glyphs) != expected_glyph_count:
            errors.append(
                f"Glyph count mismatch: expected {expected_glyph_count}, "
                f"got {len(glyphs)}"
            )

    # Check each glyph has required fields
    required_glyph_fields = [
        "char_code", "uv_min_x", "uv_min_y", "uv_max_x", "uv_max_y",
        "width", "height", "bearing_x", "bearing_y", "advance"
    ]

    for i, glyph in enumerate(glyphs):
        for field in required_glyph_fields:
            if field not in glyph:
                errors.append(f"Glyph {i} missing field: {field}")

    if errors:
        raise ValidationError("; ".join(errors))

    return {
        "valid": True,
        "glyph_count": len(glyphs),
        "atlas_size": metadata.get("atlas_size")
    }


def validate_shell_layer(
    contract: Dict[str, Any],
    atlas_base_dir: str,
    atlas_filename: Optional[str] = None
) -> Dict[str, Any]:
    """
    Validate Shell (TypeScript/PixiJS) layer.

    Args:
        contract: VCC contract dict
        atlas_base_dir: Base directory for atlas files
        atlas_filename: Override atlas filename from contract

    Returns:
        Validation result dict
    """
    shell_config = contract.get("layers", {}).get("shell", {})
    atlas_path = shell_config.get("atlas_path", "")

    if atlas_filename:
        atlas_path = atlas_filename

    full_path = Path(atlas_base_dir) / atlas_path

    if not full_path.exists():
        raise ValidationError(f"Shell atlas not found: {full_path}")

    # Check file is non-empty
    if full_path.stat().st_size == 0:
        raise ValidationError(f"Shell atlas is empty: {full_path}")

    # Check WebP magic bytes
    with open(full_path, 'rb') as f:
        header = f.read(4)
        if header != b"RIFF":
            raise ValidationError(f"Invalid WebP header in: {full_path}")

    return {
        "valid": True,
        "atlas_path": str(full_path),
        "atlas_size_bytes": full_path.stat().st_size
    }


def validate_kernel_layer(
    rust_file: str,
    wgsl_file: Optional[str] = None
) -> Dict[str, Any]:
    """
    Validate Kernel (Rust/WGPU) layer.

    Args:
        rust_file: Path to text_engine.rs or equivalent
        wgsl_file: Optional path to WGSL shader

    Returns:
        Validation result dict
    """
    path = Path(rust_file)
    if not path.exists():
        raise ValidationError(f"Rust file not found: {rust_file}")

    with open(path, 'r') as f:
        content = f.read()

    errors = []

    # Check for GlyphMetrics struct
    struct_match = re.search(
        r'pub\s+struct\s+GlyphMetrics\s*\{([^}]+)\}',
        content,
        re.DOTALL
    )

    if not struct_match:
        raise ValidationError("GlyphMetrics struct not found in Rust file")

    # Check required fields in struct
    required_fields = [
        "char_code", "uv_min_x", "uv_min_y", "uv_max_x", "uv_max_y",
        "width", "height", "bearing_x", "bearing_y", "advance"
    ]

    struct_body = struct_match.group(1)
    missing_fields = []

    for field in required_fields:
        if field not in struct_body:
            missing_fields.append(field)

    if missing_fields:
        raise ValidationError(
            f"GlyphMetrics missing fields: {', '.join(missing_fields)}"
        )

    # Validate WGSL if provided
    wgsl_valid = None
    if wgsl_file:
        wgsl_path = Path(wgsl_file)
        if wgsl_path.exists():
            with open(wgsl_path, 'r') as f:
                wgsl_content = f.read()
            wgsl_valid = "GlyphMetrics" in wgsl_content

    return {
        "valid": True,
        "glyph_metrics_found": True,
        "wgsl_valid": wgsl_valid
    }


def validate_all_layers(
    contract_path: str,
    project_root: str
) -> Dict[str, Any]:
    """
    Validate all layers against a VCC contract.

    Args:
        contract_path: Path to vcc_contract.json
        project_root: Project root directory

    Returns:
        Combined validation results
    """
    from systems.vcc.contract import VCCContract

    contract = VCCContract.from_json(Path(contract_path))
    root = Path(project_root)

    results = {
        "contract_valid": True,
        "foundry": None,
        "shell": None,
        "kernel": None,
        "all_valid": False
    }

    try:
        results["foundry"] = validate_foundry_layer(
            positions_path=str(root / "systems/glyph_stratum/opcode_positions.json")
        )
    except ValidationError as e:
        results["foundry"] = {"valid": False, "error": str(e)}

    try:
        results["shell"] = validate_shell_layer(
            contract=contract.data,
            atlas_base_dir=str(root)
        )
    except ValidationError as e:
        results["shell"] = {"valid": False, "error": str(e)}

    try:
        results["kernel"] = validate_kernel_layer(
            rust_file=str(root / "systems/infinite_map_rs/src/text_engine.rs"),
            wgsl_file=str(root / "systems/infinite_map_rs/src/shaders/msdf_font.wgsl")
        )
    except ValidationError as e:
        results["kernel"] = {"valid": False, "error": str(e)}

    # Overall status
    results["all_valid"] = all(
        r.get("valid", False) for r in [
            results["foundry"],
            results["shell"],
            results["kernel"]
        ] if r is not None
    )

    return results
```

- [ ] **Step 4: Run tests to verify they pass**

```bash
python -m pytest systems/vcc/tests/test_validator.py -v
```
Expected: All tests PASS

- [ ] **Step 5: Commit**

```bash
git add systems/vcc/validator.py systems/vcc/tests/test_validator.py
git commit -m "feat(vcc): add cross-layer validation for Foundry, Shell, Kernel"
```

---

## Chunk 4: Atlas Generator Integration

### Task 5: Integrate VCC into Atlas Generation

**Files:**
- Modify: `systems/glyph_stratum/generate_font_atlas.py:1-350`
- Create: `systems/vcc/cli.py`

- [ ] **Step 1: Add VCC import to atlas generator**

At the top of `systems/glyph_stratum/generate_font_atlas.py`, add:

```python
# Add after existing imports (around line 27)
try:
    from systems.vcc.contract import generate_contract
    from systems.vcc.validator import validate_all_layers
    HAS_VCC = True
except ImportError:
    HAS_VCC = False
```

- [ ] **Step 2: Add VCC generation to main()**

Find the section where files are written (after saving the atlas and positions). Add:

```python
# In main(), after saving opcode_positions.json (around line 270)
    # Generate VCC contract if module available
    if HAS_VCC:
        print("\n📋 Generating Visual Consistency Contract...")

        opcode_mappings = dict(OPCODE_DEFINITIONS)

        contract = generate_contract(
            atlas_path=atlas_raw_path,
            positions_path=output_positions,
            opcode_mappings=opcode_mappings
        )

        # Save contract
        vcc_path = os.path.join(output_dir, "vcc_contract.json")
        from systems.vcc.contract import VCCContract
        VCCContract(contract).to_json(Path(vcc_path))
        print(f"✅ VCC contract saved to: {vcc_path}")
```

- [ ] **Step 3: Add required import**

Add to the imports section:

```python
from pathlib import Path  # Add if not already present
```

- [ ] **Step 4: Create VCC CLI**

```python
# systems/vcc/cli.py
#!/usr/bin/env python3
"""
VCC Command-Line Interface.

Usage:
    python -m systems.vcc.cli validate [--contract=PATH]
    python -m systems.vcc.cli generate --atlas=PATH --positions=PATH
    python -m systems.vcc.cli status
"""

import argparse
import sys
import json
from pathlib import Path

def cmd_validate(args):
    """Validate all layers against VCC contract."""
    from systems.vcc.validator import validate_all_layers

    contract_path = args.contract or "systems/vcc/vcc_contract.json"
    project_root = args.project_root or "."

    results = validate_all_layers(contract_path, project_root)

    print("🔍 VCC Validation Results\n")
    print(f"{'Layer':<12} {'Status':<10} {'Details'}")
    print("-" * 50)

    for layer in ["foundry", "shell", "kernel"]:
        result = results.get(layer, {})
        status = "✅ PASS" if result.get("valid") else "❌ FAIL"
        details = result.get("error", "") or f"{result.get('glyph_count', 'N/A')} glyphs"
        print(f"{layer:<12} {status:<10} {details}")

    print("-" * 50)
    print(f"Overall: {'✅ ALL VALID' if results['all_valid'] else '❌ ISSUES FOUND'}")

    return 0 if results["all_valid"] else 1


def cmd_generate(args):
    """Generate a new VCC contract."""
    from systems.vcc.contract import generate_contract, VCCContract

    contract = generate_contract(
        atlas_path=args.atlas,
        positions_path=args.positions
    )

    output_path = Path(args.output or "vcc_contract.json")
    VCCContract(contract).to_json(output_path)

    print(f"✅ VCC contract generated: {output_path}")
    print(f"   Atlas hash: {contract['atlas_hash']['sha256'][:16]}...")
    print(f"   Glyph count: {contract['glyph_count']}")

    return 0


def cmd_status(args):
    """Show current VCC status."""
    contract_path = Path(args.contract or "systems/vcc/vcc_contract.json")

    if not contract_path.exists():
        print("❌ No VCC contract found. Run atlas generation first.")
        return 1

    from systems.vcc.contract import VCCContract
    contract = VCCContract.from_json(contract_path)

    print("📋 VCC Contract Status\n")
    print(f"Version: {contract.version}")
    print(f"Generated: {contract.data['generated_at']}")
    print(f"Atlas hash: {contract.atlas_hash[:16]}...")
    print(f"Glyph count: {contract.glyph_count}")

    return 0


def main():
    parser = argparse.ArgumentParser(description="VCC CLI")
    subparsers = parser.add_subparsers(dest="command", required=True)

    # validate command
    validate_parser = subparsers.add_parser("validate", help="Validate all layers")
    validate_parser.add_argument("--contract", help="Path to VCC contract")
    validate_parser.add_argument("--project-root", default=".", help="Project root")
    validate_parser.set_defaults(func=cmd_validate)

    # generate command
    generate_parser = subparsers.add_parser("generate", help="Generate VCC contract")
    generate_parser.add_argument("--atlas", required=True, help="Path to .raw atlas")
    generate_parser.add_argument("--positions", required=True, help="Path to positions JSON")
    generate_parser.add_argument("--output", help="Output contract path")
    generate_parser.set_defaults(func=cmd_generate)

    # status command
    status_parser = subparsers.add_parser("status", help="Show VCC status")
    status_parser.add_argument("--contract", help="Path to VCC contract")
    status_parser.set_defaults(func=cmd_status)

    args = parser.parse_args()
    return args.func(args)


if __name__ == "__main__":
    sys.exit(main())
```

- [ ] **Step 5: Run atlas generation to create VCC**

```bash
cd /home/jericho/zion/projects/geometry_os/geometry_os
python3 systems/glyph_stratum/generate_font_atlas.py
```
Expected: Generates atlas + VCC contract

- [ ] **Step 6: Verify VCC CLI works**

```bash
python -m systems.vcc.cli status
python -m systems.vcc.cli validate
```
Expected: Status shows contract info, validate shows layer status

- [ ] **Step 7: Commit**

```bash
git add systems/glyph_stratum/generate_font_atlas.py systems/vcc/cli.py
git commit -m "feat(vcc): integrate VCC generation into atlas pipeline"
```

---

## Chunk 5: Documentation and Finalization

### Task 6: Add VCC to Skills Documentation

**Files:**
- Modify: `~/.claude/skills/geos-fonts.md` (add VCC section)
- Modify: `.gemini/skills/geos-fonts/SKILL.md` (add VCC section)

- [ ] **Step 1: Add VCC section to Claude skill**

Add this section to `~/.claude/skills/geos-fonts.md` before "## Related Skills":

```markdown
## Visual Consistency Contract (VCC)

The VCC ensures glyphs are identical across all three execution layers:

| Layer | Technology | File | Validation |
|-------|------------|------|------------|
| **Foundry** | Python/FreeType | `systems/fonts/font_renderer.py` | GlyphMetrics JSON |
| **Shell** | TypeScript/PixiJS | `systems/visual_shell/` | Atlas WebP hash |
| **Kernel** | Rust/WGPU | `systems/infinite_map_rs/` | Struct field match |

### VCC Commands

```bash
# Generate contract (automatic during atlas generation)
python3 systems/glyph_stratum/generate_font_atlas.py

# Validate all layers
python -m systems.vcc.cli validate

# Check status
python -m systems.vcc.cli status
```

### Contract Location

`systems/vcc/vcc_contract.json` - Contains atlas hash, glyph count, layer paths, and signatures.

### Adding a New Layer

1. Create validator in `systems/vcc/validator.py`
2. Add layer config to contract schema in `schemas.py`
3. Update `validate_all_layers()` to include new layer
```

- [ ] **Step 2: Add VCC section to Gemini skill**

Add the same section to `.gemini/skills/geos-fonts/SKILL.md`.

- [ ] **Step 3: Commit skill updates**

```bash
git add .gemini/skills/geos-fonts/SKILL.md
git commit -m "docs(skills): add VCC section to geos-fonts skill"
```

- [ ] **Step 4: Create VCC module README**

```python
# Write to systems/vcc/README.md
```

```markdown
# Visual Consistency Contract (VCC)

Ensures glyph rendering is semantically and visually identical across all Geometry OS layers.

## Purpose

When a glyph is rendered in:
- **Foundry** (Python/FreeType)
- **Shell** (TypeScript/PixiJS/WebGPU)
- **Kernel** (Rust/WGPU)

...it must be pixel-identical and semantically equivalent.

## Components

| File | Purpose |
|------|---------|
| `contract.py` | Contract generation and serialization |
| `validator.py` | Cross-layer validation logic |
| `schemas.py` | JSON schema definitions |
| `visual_hash.py` | Atlas hash computation |
| `cli.py` | Command-line interface |

## Usage

```bash
# Validate all layers
python -m systems.vcc.cli validate

# Generate new contract
python -m systems.vcc.cli generate --atlas=atlas.raw --positions=positions.json

# Check status
python -m systems.vcc.cli status
```

## Contract Schema

See `schemas.py` for full JSON schema. Key fields:

- `version`: Schema version (currently 1)
- `atlas_hash`: SHA-256 of atlas bytes
- `glyph_count`: Number of glyphs
- `layers`: Layer-specific configuration
- `signatures`: Runtime verification hashes
```

```bash
git add systems/vcc/README.md
git commit -m "docs(vcc): add module README"
```

---

## Summary

This plan creates a complete VCC enforcement system:

1. **Schema definitions** - JSON schemas for contract and glyph metrics
2. **Visual hashing** - SHA-256 and perceptual hash for atlas comparison
3. **Contract generation** - Automated contract creation during atlas build
4. **Cross-layer validation** - Verification for Foundry, Shell, and Kernel
5. **CLI tooling** - Easy-to-use commands for validation and status
6. **Documentation** - Skill updates and module README

**Files created:**
- `systems/vcc/__init__.py`
- `systems/vcc/schemas.py`
- `systems/vcc/visual_hash.py`
- `systems/vcc/contract.py`
- `systems/vcc/validator.py`
- `systems/vcc/cli.py`
- `systems/vcc/README.md`
- `systems/vcc/tests/test_visual_hash.py`
- `systems/vcc/tests/test_contract.py`
- `systems/vcc/tests/test_validator.py`

**Files modified:**
- `systems/glyph_stratum/generate_font_atlas.py` (VCC integration)
- `~/.claude/skills/geos-fonts.md` (VCC section)
- `.gemini/skills/geos-fonts/SKILL.md` (VCC section)
