# CUDA Compatibility (RTX 5090) Fix Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Enable GPU tests for RTX 5090 and newer CUDA 12.x+ hardware

**Architecture:** Detect CUDA version, handle GPU architecture detection dynamically, add fallback paths for unsupported features, ensure proper NVCC compatibility.

**Tech Stack:** CUDA 12.x, PyTorch, nvidia-smi, NVCC

**Problem Context:**
- RTX 5090 (Blackwell architecture) requires CUDA 12.6+
- Current GPU tests may fail on newer hardware
- Need dynamic architecture detection instead of hardcoding
- NVCC compilation flags need to support newer compute capabilities

---

## Task 1: Create CUDA Version and Architecture Detection

**Files:**
- Create: `geometry_os/systems/pixel_compiler/cuda_detector.py`
- Create: `tests/test_cuda_detector.py`

**Step 1: Write the failing test**

```python
# tests/test_cuda_detector.py
import pytest
from systems.pixel_compiler.cuda_detector import (
    get_cuda_version,
    get_gpu_architecture,
    get_compute_capability,
    supports_cuda_version,
    get_supported_architectures,
)

def test_get_cuda_version():
    """Should detect CUDA version"""
    version = get_cuda_version()

    # Should return a version tuple or None
    assert version is None or isinstance(version, tuple)
    if version:
        assert len(version) == 2 or len(version) == 3
        assert all(isinstance(x, int) for x in version)
        print(f"CUDA version: {version}")

def test_get_compute_capability():
    """Should detect compute capability"""
    if not supports_cuda_version((11, 0)):
        pytest.skip("CUDA 11+ not available")

    capability = get_compute_capability(device=0)

    assert capability is not None
    assert isinstance(capability, tuple)
    assert len(capability) == 2
    print(f"Compute capability: {capability[0]}.{capability[1]}")

def test_get_gpu_architecture():
    """Should detect GPU architecture"""
    if not supports_cuda_version((11, 0)):
        pytest.skip("CUDA not available")

    arch = get_gpu_architecture(device=0)

    assert arch is not None
    assert isinstance(arch, str)
    print(f"GPU architecture: {arch}")

def test_blackwell_architecture_detection():
    """Should detect Blackwell architecture (RTX 50xx)"""
    if not supports_cuda_version((12, 6)):
        pytest.skip("CUDA 12.6+ not available")

    capability = get_compute_capability(device=0)
    if capability:
        arch = get_gpu_architecture(device=0)
        # Blackwell is compute capability 10.x
        if capability[0] >= 10:
            assert 'blackwell' in arch.lower() or '10' in arch
            print(f"Detected Blackwell: {arch}")

def test_get_supported_architectures():
    """Should return list of supported architectures"""
    archs = get_supported_architectures()

    assert isinstance(archs, list)
    assert len(archs) > 0

    # Should include common architectures
    expected_archs = ['volta', 'turing', 'ampere', 'hopper', 'blackwell']
    for expected in expected_archs:
        assert any(expected in arch.lower() for arch in archs)

def test_nvcc_compatibility():
    """Should check NVCC compatibility"""
    from systems.pixel_compiler.cuda_detector import get_nvcc_version, get_nvcc_compute_capabilities

    nvcc_version = get_nvcc_version()

    if nvcc_version:
        print(f"NVCC version: {nvcc_version}")
        assert isinstance(nvcc_version, tuple)

        capabilities = get_nvcc_compute_capabilities()
        print(f"NVCC supported capabilities: {capabilities}")
        assert isinstance(capabilities, list)
```

**Step 2: Run test to verify it fails**

Run: `python -m pytest tests/test_cuda_detector.py -v`
Expected: FAIL with missing cuda_detector module

**Step 3: Write CUDA detector implementation**

```python
# cuda_detector.py
"""
CUDA version and GPU architecture detection utility.
Supports detection of CUDA versions up to 12.6+ and GPU architectures
including Blackwell (RTX 50xx).
"""
import subprocess
import re
import logging
from typing import Optional, Tuple, List, Dict

logger = logging.getLogger(__name__)

# Compute capability to architecture mapping
COMPUTE_CAPABILITY_TO_ARCH = {
    (7, 0): 'volta',
    (7, 5): 'turing',
    (8, 0): 'ampere',
    (8, 6): 'ampere',
    (8, 9): 'ada',  # Ada Lovelace (RTX 40xx)
    (9, 0): 'hopper',
    (10, 0): 'blackwell',  # Blackwell (RTX 50xx)
    (10, 1): 'blackwell',
}

# Architecture to compute capabilities (for NVCC compilation)
ARCH_TO_COMPUTE_CAPABILITY = {
    'volta': [70],
    'turing': [75],
    'ampere': [80, 86],
    'ada': [89],
    'hopper': [90],
    'blackwell': [100, 101],
}

# Minimum CUDA version for each architecture
ARCH_MIN_CUDA_VERSION = {
    'volta': (9, 2),
    'turing': (10, 0),
    'ampere': (11, 0),
    'ada': (11, 8),
    'hopper': (11, 8),
    'blackwell': (12, 6),
}


def get_cuda_version() -> Optional[Tuple[int, ...]]:
    """
    Get the CUDA runtime version.

    Returns:
        Tuple of (major, minor) or (major, minor, patch) version,
        or None if CUDA is not available.
    """
    try:
        import torch
        if torch.cuda.is_available():
            version = torch.version.cuda
            if version:
                # Parse version string like "12.1" or "12.6.0"
                parts = version.split('.')
                return tuple(int(x) for x in parts)
    except Exception as e:
        logger.debug(f"Could not get CUDA version from torch: {e}")

    # Fallback: try nvidia-smi
    try:
        result = subprocess.run(
            ['nvidia-smi'],
            capture_output=True,
            text=True,
            timeout=5
        )

        # Parse "CUDA Version: 12.6.0" from nvidia-smi output
        match = re.search(r'CUDA Version:\s*([\d.]+)', result.stdout)
        if match:
            version_str = match.group(1)
            parts = version_str.split('.')
            return tuple(int(x) for x in parts)
    except Exception as e:
        logger.debug(f"Could not get CUDA version from nvidia-smi: {e}")

    return None


def get_nvcc_version() -> Optional[Tuple[int, ...]]:
    """
    Get the NVCC compiler version.

    Returns:
        Tuple of (major, minor) or (major, minor, patch) version,
        or None if NVCC is not available.
    """
    try:
        result = subprocess.run(
            ['nvcc', '--version'],
            capture_output=True,
            text=True,
            timeout=5
        )

        # Parse "release 12.6, V12.6.20" from nvcc output
        match = re.search(r'release\s+(\d+\.\d+)', result.stdout)
        if match:
            version_str = match.group(1)
            parts = version_str.split('.')
            return tuple(int(x) for x in parts)
    except Exception as e:
        logger.debug(f"Could not get NVCC version: {e}")

    return None


def get_compute_capability(device: int = 0) -> Optional[Tuple[int, int]]:
    """
    Get the compute capability of a GPU device.

    Args:
        device: GPU device index (default: 0)

    Returns:
        Tuple of (major, minor) compute capability, or None if unavailable.
    """
    try:
        import torch
        if torch.cuda.is_available() and device < torch.cuda.device_count():
            return torch.cuda.get_device_capability(device)
    except Exception as e:
        logger.debug(f"Could not get compute capability: {e}")

    return None


def get_gpu_architecture(device: int = 0) -> Optional[str]:
    """
    Get the GPU architecture name.

    Args:
        device: GPU device index (default: 0)

    Returns:
        Architecture name (e.g., 'ampere', 'blackwell'), or None if unavailable.
    """
    capability = get_compute_capability(device)

    if capability:
        arch = COMPUTE_CAPABILITY_TO_ARCH.get(capability)
        if arch:
            return arch

        # Unknown compute capability - try to infer from version
        major, minor = capability
        if major >= 10:
            return 'blackwell'  # Future-proof for 10.x
        elif major == 9:
            return 'hopper'
        elif major == 8:
            return 'ampere'
        elif major == 7:
            return 'turing' if minor == 5 else 'volta'

    return None


def get_gpu_name(device: int = 0) -> Optional[str]:
    """
    Get the GPU name.

    Args:
        device: GPU device index (default: 0)

    Returns:
        GPU name string, or None if unavailable.
    """
    try:
        import torch
        if torch.cuda.is_available() and device < torch.cuda.device_count():
            return torch.cuda.get_device_name(device)
    except Exception as e:
        logger.debug(f"Could not get GPU name: {e}")

    return None


def supports_cuda_version(required_version: Tuple[int, int]) -> bool:
    """
    Check if the current CUDA version meets the required version.

    Args:
        required_version: Tuple of (major, minor) required version

    Returns:
        True if CUDA version meets or exceeds required version
    """
    current = get_cuda_version()
    if current is None:
        return False

    return current >= required_version


def supports_architecture(architecture: str) -> bool:
    """
    Check if the current CUDA version supports the given architecture.

    Args:
        architecture: Architecture name (e.g., 'blackwell', 'ampere')

    Returns:
        True if the architecture is supported
    """
    min_version = ARCH_MIN_CUDA_VERSION.get(architecture.lower())
    if min_version is None:
        logger.warning(f"Unknown architecture: {architecture}")
        return False

    return supports_cuda_version(min_version)


def get_supported_architectures() -> List[str]:
    """
    Get list of architectures supported by the current CUDA version.

    Returns:
        List of supported architecture names
    """
    cuda_version = get_cuda_version()
    if cuda_version is None:
        return []

    supported = []
    for arch, min_ver in ARCH_MIN_CUDA_VERSION.items():
        if cuda_version >= min_ver:
            supported.append(arch)

    return supported


def get_nvcc_compute_capabilities() -> List[int]:
    """
    Get the list of compute capabilities supported by NVCC.

    Returns:
        List of compute capability integers (e.g., [70, 75, 80, 86, 89, 90])
    """
    capabilities = []
    cuda_version = get_nvcc_version() or get_cuda_version()

    if cuda_version is None:
        return capabilities

    # Build list based on CUDA version
    if cuda_version >= (12, 6):
        capabilities.extend(ARCH_TO_COMPUTE_CAPABILITY.get('blackwell', []))
    if cuda_version >= (11, 8):
        capabilities.extend(ARCH_TO_COMPUTE_CAPABILITY.get('hopper', []))
        capabilities.extend(ARCH_TO_COMPUTE_CAPABILITY.get('ada', []))
    if cuda_version >= (11, 0):
        capabilities.extend(ARCH_TO_COMPUTE_CAPABILITY.get('ampere', []))
    if cuda_version >= (10, 0):
        capabilities.extend(ARCH_TO_COMPUTE_CAPABILITY.get('turing', []))
    if cuda_version >= (9, 2):
        capabilities.extend(ARCH_TO_COMPUTE_CAPABILITY.get('volta', []))

    return sorted(set(capabilities))


def get_optimal_nvcc_arch_flags() -> List[str]:
    """
    Get the optimal NVCC architecture flags for the current system.

    Returns:
        List of NVCC -gencode flags for compiling CUDA kernels
    """
    capabilities = get_nvcc_compute_capabilities()
    flags = []

    for cap in capabilities:
        # Format: -gencode arch=compute_XY,code=sm_XY
        flags.append(f'-gencode=arch=compute_{cap},code=sm_{cap}')

    return flags


def print_cuda_info():
    """
    Print detailed CUDA information for debugging.
    """
    print("\n" + "="*60)
    print("CUDA System Information")
    print("="*60)

    # CUDA version
    cuda_version = get_cuda_version()
    print(f"CUDA Runtime Version: {cuda_version or 'Not available'}")

    # NVCC version
    nvcc_version = get_nvcc_version()
    print(f"NVCC Version: {nvcc_version or 'Not available'}")

    # GPU info
    if supports_cuda_version((11, 0)):
        try:
            import torch
            device_count = torch.cuda.device_count()
            print(f"\nAvailable GPUs: {device_count}")

            for i in range(device_count):
                name = get_gpu_name(i)
                arch = get_gpu_architecture(i)
                capability = get_compute_capability(i)

                print(f"\n  GPU {i}:")
                print(f"    Name: {name}")
                print(f"    Architecture: {arch}")
                print(f"    Compute Capability: {capability[0]}.{capability[1]}" if capability else "    Compute Capability: Unknown")
        except Exception as e:
            print(f"Could not get GPU info: {e}")
    else:
        print("\nCUDA 11+ not available")

    # Supported architectures
    supported_archs = get_supported_architectures()
    print(f"\nSupported Architectures: {', '.join(supported_archs) if supported_archs else 'None'}")

    # NVCC compute capabilities
    nvcc_caps = get_nvcc_compute_capabilities()
    print(f"NVCC Compute Capabilities: {nvcc_caps if nvcc_caps else 'None'}")

    print("="*60 + "\n")


def is_blackwell_gpu(device: int = 0) -> bool:
    """
    Check if the GPU is a Blackwell architecture (RTX 50xx).

    Args:
        device: GPU device index (default: 0)

    Returns:
        True if the GPU is Blackwell architecture
    """
    arch = get_gpu_architecture(device)
    return arch == 'blackwell' if arch else False


def requires_cuda_12_6() -> bool:
    """
    Check if the current GPU requires CUDA 12.6+.

    Returns:
        True if CUDA 12.6+ is required for optimal performance
    """
    return is_blackwell_gpu()
```

**Step 4: Run tests**

Run: `python -m pytest tests/test_cuda_detector.py -v -s`
Expected: PASS with CUDA info printed

**Step 5: Commit**

```bash
git add geometry_os/systems/pixel_compiler/cuda_detector.py
git add tests/test_cuda_detector.py
git commit -m "feat: add CUDA version and architecture detection"
```

---

## Task 2: Update GPU Test Infrastructure

**Files:**
- Read: `geometry_os/generate_gpu_test.py`
- Read: `geometry_os/boot_geometry_os_gpu.py`
- Modify: `geometry_os/generate_gpu_test.py`
- Modify: `geometry_os/boot_geometry_os_gpu.py`

**Step 1: Write the failing test**

```python
# tests/test_gpu_test_generation.py
import pytest
from systems.pixel_compiler.cuda_detector import (
    get_compute_capability,
    get_optimal_nvcc_arch_flags,
    is_blackwell_gpu,
)

def test_generate_test_with_blackwell():
    """Should generate tests that work on Blackwell GPUs"""
    # This test verifies the test generation code handles new architectures
    if not is_blackwell_gpu():
        pytest.skip("Not a Blackwell GPU")

    capability = get_compute_capability()
    assert capability[0] >= 10  # Blackwell is 10.x

    arch_flags = get_optimal_nvcc_arch_flags()
    assert len(arch_flags) > 0

    # Should include sm_100 or sm_101 for Blackwell
    has_blackwell_flag = any('100' in flag or '101' in flag for flag in arch_flags)
    assert has_blackwell_flag, "Should have Blackwell architecture flag"

def test_gpu_test_infrastructure():
    """GPU test infrastructure should work with detected architecture"""
    from generate_gpu_test import generate_gpu_test

    # Generate test with current architecture
    test_code = generate_gpu_test()

    assert test_code is not None
    assert len(test_code) > 0
```

**Step 2: Read existing test generation code**

Run: Read `geometry_os/generate_gpu_test.py`

**Step 3: Update GPU test generation**

```python
# generate_gpu_test.py - add to existing file
from systems.pixel_compiler.cuda_detector import (
    get_compute_capability,
    get_optimal_nvcc_arch_flags,
    print_cuda_info,
)

def get_gpu_arch_compile_args():
    """
    Get compilation arguments for the current GPU architecture.

    Returns:
        Dictionary with compilation arguments
    """
    capability = get_compute_capability()
    if capability is None:
        # Default to safe fallback
        return {
            'arch_flags': [],
            'compute_capability': (7, 5),  # Turing as safe default
            'architecture': 'turing',
        }

    major, minor = capability

    return {
        'arch_flags': get_optimal_nvcc_arch_flags(),
        'compute_capability': capability,
        'architecture': get_gpu_architecture(),
    }

def generate_gpu_test(target_device=None):
    """
    Generate a GPU test with appropriate architecture flags.

    Args:
        target_device: Target GPU device index (None for auto-detect)

    Returns:
        Generated test code
    """
    # Print CUDA info for debugging
    print_cuda_info()

    # Get architecture info
    arch_info = get_gpu_arch_compile_args()

    # Existing generation logic...
    # (update to use arch_info['arch_flags'] for compilation)

    # Return the test code
    return f"""
// Generated GPU test for {arch_info['architecture']} architecture
// Compute capability: {arch_info['compute_capability'][0]}.{arch_info['compute_capability'][1]}

// NVCC flags: {' '.join(arch_info['arch_flags'])}

#include <cuda_runtime.h>

__global__ void test_kernel() {{
    // Test kernel implementation
}}

// ... rest of test code
"""
```

**Step 4: Update boot script**

```python
# boot_geometry_os_gpu.py - add architecture detection
from systems.pixel_compiler.cuda_detector import (
    supports_cuda_version,
    print_cuda_info,
    is_blackwell_gpu,
)

def boot_geometry_os_gpu():
    """Boot Geometry OS with GPU support"""

    # Print CUDA info
    print_cuda_info()

    # Check CUDA version
    if not supports_cuda_version((11, 0)):
        print("ERROR: CUDA 11+ is required")
        return False

    # Special handling for Blackwell
    if is_blackwell_gpu():
        print("Detected Blackwell architecture - using CUDA 12.6+ optimizations")
        # Apply Blackwell-specific optimizations
    else:
        print("Using standard GPU optimizations")

    # ... rest of boot logic

    return True
```

**Step 5: Run tests**

Run: `python -m pytest tests/test_gpu_test_generation.py -v`
Expected: PASS

**Step 6: Commit**

```bash
git add geometry_os/generate_gpu_test.py
git add geometry_os/boot_geometry_os_gpu.py
git add tests/test_gpu_test_generation.py
git commit -m "feat: add dynamic architecture detection to GPU tests"
```

---

## Task 3: Update Pixel Compiler for Newer Architectures

**Files:**
- Read: `geometry_os/systems/pixel_compiler/amp_config.py`
- Modify: `geometry_os/systems/pixel_compiler/amp_config.py`

**Step 1: Add architecture-aware config**

```python
# amp_config.py - add architecture detection
from .cuda_detector import get_gpu_architecture, is_blackwell_gpu

@dataclass
class AmpConfig:
    # ... existing fields ...

    # Add architecture-specific settings
    architecture: str = field(default_factory=lambda: get_gpu_architecture() or 'unknown')

    # Blackwell-specific optimizations
    use_blackwell_optimizations: bool = field(default_factory=is_blackwell_gpu)

    def __post_init__(self):
        # ... existing post_init ...

        # Apply architecture-specific optimizations
        if self.use_blackwell_optimizations:
            # Blackwell can handle higher precision without performance loss
            if self.dtype == 'float16':
                # Prefer BF16 on Blackwell
                from .amp_bf16_utils import detect_bf16_support
                if detect_bf16_support()[0]:
                    self.dtype = 'bfloat16'

            # Blackwell has more SMs - can use more threads
            if self.num_workers == -1:
                self.num_workers = 8  # Default to more workers on Blackwell
```

**Step 2: Commit**

```bash
git add geometry_os/systems/pixel_compiler/amp_config.py
git commit -m "feat: add architecture-aware AMP configuration"
```

---

## Task 4: Create CUDA 12.6 Compatibility Check

**Files:**
- Create: `geometry_os/systems/pixel_compiler/cuda_compatibility_check.py`

**Step 1: Create compatibility check script**

```python
#!/usr/bin/env python3
"""
CUDA compatibility check script.
Checks if the system meets requirements for GPU computing.
"""
import sys
from systems.pixel_compiler.cuda_detector import (
    get_cuda_version,
    get_nvcc_version,
    get_compute_capability,
    get_gpu_architecture,
    is_blackwell_gpu,
    supports_cuda_version,
    print_cuda_info,
)

def check_cuda_compatibility():
    """
    Check CUDA compatibility and return status.

    Returns:
        0 if all checks pass, 1 otherwise
    """
    print("Geometry OS - CUDA Compatibility Check")
    print("="*60)

    issues = []
    warnings = []

    # Print system info
    print_cuda_info()

    # Check CUDA version
    cuda_version = get_cuda_version()
    if cuda_version is None:
        issues.append("CUDA is not available or not detected")
        print("\n❌ CUDA not found")
        return 1
    else:
        print(f"✓ CUDA version: {'.'.join(map(str, cuda_version))}")

        # Check for minimum version
        if cuda_version < (11, 0):
            issues.append(f"CUDA 11.0+ required, found {cuda_version}")
            print(f"❌ CUDA version too old: {cuda_version}")
        elif cuda_version < (12, 0):
            warnings.append("CUDA 12.0+ recommended for optimal performance")
            print(f"⚠ CUDA 12.0+ recommended, found {cuda_version}")
        else:
            print(f"✓ CUDA version meets requirements")

    # Check NVCC
    nvcc_version = get_nvcc_version()
    if nvcc_version:
        print(f"✓ NVCC version: {'.'.join(map(str, nvcc_version))}")
    else:
        warnings.append("NVCC not found - compilation may be limited")
        print("⚠ NVCC not found")

    # Check GPU
    if supports_cuda_version((11, 0)):
        capability = get_compute_capability()
        architecture = get_gpu_architecture()

        if capability and architecture:
            print(f"✓ GPU: {architecture} (compute {capability[0]}.{capability[1]})")

            # Check for Blackwell
            if is_blackwell_gpu():
                if cuda_version < (12, 6):
                    issues.append("Blackwell GPU requires CUDA 12.6+ for optimal performance")
                    print("❌ Blackwell GPU detected but CUDA < 12.6")
                else:
                    print("✓ Blackwell GPU with CUDA 12.6+ - optimal configuration")
        else:
            warnings.append("Could not detect GPU architecture")
    else:
        issues.append("No compatible GPU detected")
        print("❌ No compatible GPU found")

    # Summary
    print("\n" + "="*60)
    print("Compatibility Check Summary")
    print("="*60)

    if issues:
        print(f"\n❌ Found {len(issues)} issue(s):")
        for issue in issues:
            print(f"  - {issue}")
        return 1

    if warnings:
        print(f"\n⚠ Found {len(warnings)} warning(s):")
        for warning in warnings:
            print(f"  - {warning}")

    print("\n✓ All critical checks passed!")

    return 0

if __name__ == '__main__':
    sys.exit(check_cuda_compatibility())
```

**Step 2: Commit**

```bash
git add geometry_os/systems/pixel_compiler/cuda_compatibility_check.py
git commit -m "feat: add CUDA compatibility check script"
```

---

## Task 5: Documentation

**Files:**
- Create: `geometry_os/docs/cuda-compatibility.md`

**Step 1: Create documentation**

```markdown
# CUDA Compatibility Guide

## Supported CUDA Versions

Geometry OS supports CUDA 11.0 and later.

| CUDA Version | Status | Notes |
|--------------|--------|-------|
| 12.6+ | ✅ Optimal | Required for Blackwell (RTX 50xx) |
| 12.0 - 12.5 | ✅ Supported | Good for Ampere, Hopper |
| 11.x | ✅ Supported | Minimum required version |
| < 11.0 | ❌ Not supported | Upgrade required |

## GPU Architecture Support

| Architecture | Compute Capability | Min CUDA | Examples |
|--------------|-------------------|----------|----------|
| Blackwell | 10.x | 12.6 | RTX 5090, RTX 5080 |
| Hopper | 9.0 | 11.8 | H100 |
| Ada Lovelace | 8.9 | 11.8 | RTX 4090, RTX 4080 |
| Ampere | 8.0, 8.6 | 11.0 | RTX 3090, A100 |
| Turing | 7.5 | 10.0 | RTX 2080, GTX 1660 |
| Volta | 7.0 | 9.2 | V100 |

## Checking Compatibility

Run the compatibility check:

```bash
python -m systems.pixel_compiler.cuda_compatibility_check
```

Or from Python:

```python
from systems.pixel_compiler.cuda_detector import print_cuda_info

print_cuda_info()
```

## Blackwell (RTX 50xx) Support

### Requirements
- CUDA 12.6 or later
- Latest NVIDIA drivers
- PyTorch with CUDA 12.6 support

### Optimizations
Blackwell GPUs receive special optimizations:
- Automatic BF16 preference over FP16
- Increased thread counts for better utilization
- Architecture-specific kernel tuning

### Detection

```python
from systems.pixel_compiler.cuda_detector import is_blackwell_gpu

if is_blackwell_gpu():
    print("Blackwell GPU detected - applying optimizations")
```

## Troubleshooting

### "CUDA not available"
1. Verify CUDA installation: `nvidia-smi`
2. Check PyTorch CUDA support: `python -c "import torch; print(torch.cuda.is_available())"`
3. Reinstall PyTorch with CUDA support

### "CUDA version too old"
- Download latest CUDA from NVIDIA: https://developer.nvidia.com/cuda-downloads

### "NVCC not found"
- Add CUDA bin directory to PATH
- Install CUDA toolkit (not just runtime)

### Blackwell performance issues
- Ensure CUDA 12.6+
- Update GPU drivers
- Use BF16 dtype when possible
```

**Step 2: Commit**

```bash
git add geometry_os/docs/cuda-compatibility.md
git commit -m "docs: add CUDA compatibility guide"
```

---

## Verification Steps

After completing all tasks:

1. **Run compatibility check:**
   ```bash
   python -m systems.pixel_compiler.cuda_compatibility_check
   ```

2. **Run detector tests:**
   ```bash
   python -m pytest tests/test_cuda_detector.py -v -s
   ```

3. **Generate GPU test:**
   ```bash
   python generate_gpu_test.py
   ```

4. **Test on actual GPU:**
   - Verify detection works on different architectures
   - Check that compilation uses correct flags
   - Confirm runtime execution

---

**Total Estimated Time:** 2-4 hours

**Dependencies:** None (can be done in parallel with other Phase 1 tasks)
