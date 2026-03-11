# Quick Start: Implementing the Framework

This guide helps you begin Phase 1 implementation immediately after proposal approval.

## Prerequisites
```bash
# Ensure you're in the project root
cd /home/jericho/zion/projects/geometry_os/geometry_os

# Verify Python environment
python3 --version  # Should be 3.10+

# Check existing dependencies
pip list | grep -E "(PIL|numpy|watchdog)"
```

## Phase 1: Core Primitives (Week 1)

### Step 1: Scaffold Package Structure (Day 1)
```bash
# Create package structure
mkdir -p geometry_os/{core,daemons,rendering,bridges,cli}

# Create __init__.py files
touch geometry_os/__init__.py
touch geometry_os/core/__init__.py
touch geometry_os/daemons/__init__.py
touch geometry_os/rendering/__init__.py
touch geometry_os/bridges/__init__.py
touch geometry_os/cli/__init__.py

# Create pyproject.toml
cat > pyproject.toml << 'EOF'
[build-system]
requires = ["setuptools>=65.0", "wheel"]
build-backend = "setuptools.build_meta"

[project]
name = "geometry-os"
version = "0.1.0"
description = "Unified framework for Geometry OS visual computation"
requires-python = ">=3.10"
dependencies = [
    "Pillow>=10.0.0",
    "numpy>=1.24.0",
    "watchdog>=3.0.0",
]

[project.optional-dependencies]
dev = [
    "pytest>=7.0.0",
    "pytest-cov>=4.0.0",
    "black>=23.0.0",
    "mypy>=1.0.0",
]
EOF

# Install in development mode
pip install -e .
```

### Step 2: Create RtsAsset Module (Day 2-3)
```bash
# Copy existing logic as starting point
cat > geometry_os/core/rts_asset.py << 'EOF'
"""Unified RTS Asset handling for .rts.png files."""
from pathlib import Path
from typing import Optional, Dict, Any
import numpy as np
from PIL import Image
import json


class RtsAssetError(Exception):
    """Raised when RTS asset operations fail."""
    pass


class RtsAsset:
    """Represents a loaded .rts.png asset with metadata."""
    
    def __init__(self, path: Path, image: Image.Image, metadata: Dict[str, Any]):
        self.path = path
        self._image = image
        self.metadata = metadata
    
    @classmethod
    def load(cls, path: str | Path) -> "RtsAsset":
        """Load an RTS asset from a .rts.png file.
        
        Args:
            path: Path to the .rts.png file
            
        Returns:
            RtsAsset instance
            
        Raises:
            RtsAssetError: If file is invalid or missing required metadata
        """
        path = Path(path)
        if not path.exists():
            raise RtsAssetError(f"File not found: {path}")
        
        try:
            img = Image.open(path)
        except Exception as e:
            raise RtsAssetError(f"Failed to load PNG: {e}")
        
        # Extract metadata from iTXt chunks
        metadata = {}
        for key, value in img.text.items():
            try:
                metadata[key] = json.loads(value)
            except json.JSONDecodeError:
                metadata[key] = value
        
        return cls(path, img, metadata)
    
    @property
    def dimensions(self) -> tuple[int, int]:
        """Get asset dimensions (width, height)."""
        return self._image.size
    
    @property
    def texture(self) -> np.ndarray:
        """Get texture data as numpy array (zero-copy to GPU)."""
        return np.array(self._image)
    
    def extract_dna(self) -> Optional["HybridDNA"]:
        """Extract Hybrid DNA code if present.
        
        Returns:
            HybridDNA instance or None if no code embedded
        """
        logic = self.metadata.get("RTS_Logic")
        if not logic:
            return None
        
        from .hybrid_dna import HybridDNA
        return HybridDNA(logic.get("code", ""), self.path)


# TODO: Implement HybridDNA class next
EOF
```

### Step 3: Create HybridDNA Module (Day 4-5)
```bash
# Create hybrid_dna.py
touch geometry_os/core/hybrid_dna.py
# Implement based on test_hybrid_dna.py logic
```

### Step 4: Write Tests (Day 6-7)
```bash
# Create test structure
mkdir -p tests/core

# Create test file
cat > tests/core/test_rts_asset.py << 'EOF'
"""Tests for RtsAsset module."""
import pytest
from pathlib import Path
from geometry_os.core import RtsAsset, RtsAssetError


def test_load_valid_rts_asset(tmp_path):
    """Test loading a valid RTS asset."""
    # TODO: Create test asset
    pass


def test_load_missing_file():
    """Test loading non-existent file raises error."""
    with pytest.raises(RtsAssetError, match="File not found"):
        RtsAsset.load("nonexistent.rts.png")


def test_extract_dna_with_code():
    """Test extracting Hybrid DNA from asset."""
    # TODO: Create asset with embedded code
    pass


def test_extract_dna_without_code():
    """Test extracting DNA from asset without code returns None."""
    # TODO: Create asset without code
    pass
EOF

# Run tests
pytest tests/core/test_rts_asset.py -v
```

## Validation Checkpoints

### After Each Module
```bash
# Run tests
pytest tests/ -v --cov=geometry_os

# Check code quality
black geometry_os/
mypy geometry_os/

# Verify imports work
python3 -c "from geometry_os.core import RtsAsset; print('✅ Import successful')"
```

### Before Moving to Phase 2
```bash
# Ensure all Phase 1 tasks are complete
grep -c "\[ \]" openspec/changes/add-geometry-os-framework/tasks.md

# Run full test suite
pytest tests/ -v --cov=geometry_os --cov-report=term-missing

# Check coverage (should be >80%)
pytest tests/ --cov=geometry_os --cov-report=html
# Open htmlcov/index.html to review
```

## Common Issues & Solutions

### Issue: Import errors after creating package
```bash
# Solution: Reinstall in development mode
pip install -e .
```

### Issue: Tests can't find modules
```bash
# Solution: Ensure PYTHONPATH includes project root
export PYTHONPATH="${PYTHONPATH}:$(pwd)"
```

### Issue: PIL/Pillow conflicts
```bash
# Solution: Uninstall PIL, keep only Pillow
pip uninstall PIL
pip install Pillow>=10.0.0
```

## Daily Progress Tracking

Create a simple log to track progress:
```bash
# Create progress log
cat > FRAMEWORK_PROGRESS.md << 'EOF'
# Framework Implementation Progress

## Phase 1: Core Primitives
- [ ] Day 1: Package structure
- [ ] Day 2-3: RtsAsset module
- [ ] Day 4-5: HybridDNA module
- [ ] Day 6-7: Tests & validation

## Notes
- [Date]: [What you accomplished]
EOF
```

## Getting Help

If you encounter issues:
1. Check `design.md` for architectural guidance
2. Review existing code in `pixel_encoder.py`, `test_hybrid_dna.py`
3. Consult the OpenSpec proposal for requirements
4. Ask for clarification on specific implementation details

## Next Phase Preview

Once Phase 1 is complete, Phase 2 (Daemon Architecture) will:
- Create `BaseDaemon` class
- Refactor `infinite_builder.py` to use it
- Validate daemon lifecycle management

---

**Ready to begin?** Start with Step 1 and work through sequentially. Each step builds on the previous one.

**Remember**: Incremental progress with validation at each step. Don't rush - structural integrity is paramount.
