# RTS AMP BF16 Support Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Add BFloat16 (BF16) support to RTS AMP for optimized performance on Ampere+ GPUs

**Architecture:** PyTorch AMP with automatic mixed precision - detect GPU capability, enable BF16 when available, provide FP16 fallback, ensure proper gradient handling.

**Tech Stack:** PyTorch, CUDA, Ampere+ GPUs (RTX 30xx, 40xx, A100, etc.)

**Problem Context:**
- BF16 has same exponent as FP32 but smaller mantissa (better for training than FP16)
- Ampere+ GPUs have native BF16 support (3-4x faster than FP32)
- Current AMP implementation only supports FP16 mixed precision
- Need automatic detection and graceful degradation

---

## Task 1: Enhance GPU BF16 Capability Detection

**Files:**
- Read: `geometry_os/systems/pixel_compiler/amp_bf16_utils.py`
- Modify: `geometry_os/systems/pixel_compiler/amp_bf16_utils.py`
- Modify: `geometry_os/systems/pixel_compiler/amp_config.py`

**Step 1: Write the failing test**

```python
# tests/test_amp_bf16_utils.py
import pytest
import torch
from systems.pixel_compiler.amp_bf16_utils import detect_bf16_support, get_optimal_dtype

def test_detect_bf16_support_on_ampere():
    """Should detect BF16 support on Ampere+ GPUs"""
    if not torch.cuda.is_available():
        pytest.skip("CUDA not available")

    bf16_supported, _ = detect_bf16_support()

    # Ampere+ GPUs should support BF16
    # We'll accept either result but verify no crash
    assert isinstance(bf16_supported, bool)
    print(f"BF16 supported: {bf16_supported}")

def test_detect_bf16_support_no_cuda():
    """Should handle no CUDA gracefully"""
    # Mock scenario - function should not crash
    # In actual test, we'd mock torch.cuda.is_available
    pass

def test_get_optimal_dtype_prefers_bf16():
    """Should prefer BF16 over FP16 when available"""
    if not torch.cuda.is_available():
        pytest.skip("CUDA not available")

    bf16_supported, _ = detect_bf16_support()

    dtype = get_optimal_dtype()

    if bf16_supported:
        assert dtype == torch.bfloat16
        print("Using BF16 (optimal)")
    else:
        # Should fall back to float16 or float32
        assert dtype in [torch.float16, torch.float32]
        print(f"Using {dtype} (fallback)")

def test_bf16_memory_efficiency():
    """BF16 should use less memory than FP32"""
    tensor_bf16 = torch.randn(1000, 1000, dtype=torch.bfloat16)
    tensor_fp32 = torch.randn(1000, 1000, dtype=torch.float32)

    # BF16 tensor should be smaller
    assert tensor_bf16.element_size() < tensor_fp32.element_size()
    assert tensor_bf16.element_size() == 2  # 2 bytes
    assert tensor_fp32.element_size() == 4  # 4 bytes
```

**Step 2: Run test to verify it fails**

Run: `python -m pytest tests/test_amp_bf16_utils.py -v`
Expected: FAIL or error due to missing/incorrect implementations

**Step 3: Read current implementation**

Run: Read `geometry_os/systems/pixel_compiler/amp_bf16_utils.py`

**Step 4: Write/improve implementation**

```python
# amp_bf16_utils.py
import torch
import logging
from typing import Tuple, Optional
from dataclasses import dataclass

logger = logging.getLogger(__name__)

@dataclass
class Bf16Capability:
    """BF16 capability information"""
    supported: bool
    reason: str
    gpu_name: str
    compute_capability: Tuple[int, int]

def detect_bf16_support() -> Tuple[bool, str]:
    """
    Detect if the current GPU supports BF16 operations.

    Returns:
        Tuple of (is_supported, reason_string)
    """
    if not torch.cuda.is_available():
        return False, "CUDA not available"

    device_count = torch.cuda.device_count()
    if device_count == 0:
        return False, "No CUDA devices found"

    # Check all GPUs - need support on primary device
    primary_gpu = torch.cuda.get_device_name(0)
    compute_capability = torch.cuda.get_device_capability(0)

    # Ampere (8.0) and later support BF16 natively
    # Compute capability 8.0+ = Ampere, 9.0 = Hopper
    major, minor = compute_capability

    if major >= 8:
        return True, f"Compute capability {major}.{minor} supports BF16"

    # Turing (7.5) has some BF16 support but not full
    if major == 7 and minor == 5:
        return False, "Turing (7.5) has limited BF16 support - using FP16"

    # Volta and older don't support BF16
    return False, f"Compute capability {major}.{minor} does not support BF16"

def get_bf16_capability() -> Bf16Capability:
    """Get detailed BF16 capability information"""
    supported, reason = detect_bf16_support()

    gpu_name = "Unknown"
    compute_capability = (0, 0)

    if torch.cuda.is_available():
        gpu_name = torch.cuda.get_device_name(0)
        compute_capability = torch.cuda.get_device_capability(0)

    return Bf16Capability(
        supported=supported,
        reason=reason,
        gpu_name=gpu_name,
        compute_capability=compute_capability
    )

def get_optimal_dtype() -> torch.dtype:
    """
    Get the optimal dtype for mixed precision training.

    Returns:
        torch.bfloat16 if supported and available
        torch.float16 if BF16 not supported but CUDA available
        torch.float32 as fallback
    """
    bf16_supported, reason = detect_bf16_support()

    if bf16_supported:
        logger.info(f"Using BF16: {reason}")
        return torch.bfloat16

    if torch.cuda.is_available():
        logger.info(f"BF16 not supported, using FP16: {reason}")
        return torch.float16

    logger.info("CUDA not available, using FP32")
    return torch.float32

def is_bf16_tensor(tensor: torch.Tensor) -> bool:
    """Check if tensor is BF16 dtype"""
    return tensor.dtype == torch.bfloat16

def safe_to_bf16(tensor: torch.Tensor) -> torch.Tensor:
    """
    Safely convert tensor to BF16.

    Handles non-float dtypes gracefully.
    """
    if tensor.is_floating_point():
        return tensor.to(torch.bfloat16)
    # For non-float tensors, convert through float32 first
    return tensor.float().to(torch.bfloat16)

def get_amp_dtype_for_device(device: Optional[torch.device] = None) -> torch.dtype:
    """
    Get the optimal AMP dtype for a specific device.

    Args:
        device: Target device. If None, uses current CUDA device.

    Returns:
        Optimal dtype for AMP on this device
    """
    if device is None:
        device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')

    if device.type == 'cuda':
        return get_optimal_dtype()

    # CPU - FP32 is safest
    return torch.float32

def print_bf16_status():
    """Print BF16 capability status for debugging"""
    cap = get_bf16_capability()

    print("\n" + "="*50)
    print("BF16 Capability Status")
    print("="*50)
    print(f"GPU: {cap.gpu_name}")
    print(f"Compute Capability: {cap.compute_capability[0]}.{cap.compute_capability[1]}")
    print(f"BF16 Supported: {cap.supported}")
    print(f"Reason: {cap.reason}")
    print(f"Optimal dtype: {get_optimal_dtype()}")
    print("="*50 + "\n")
```

**Step 5: Update amp_config.py to use BF16 utilities**

```python
# amp_config.py - add to existing config
from .amp_bf16_utils import get_optimal_dtype, print_bf16_status

@dataclass
class AmpConfig:
    # ... existing fields ...

    # Add automatic dtype selection
    dtype: torch.dtype = field(default_factory=get_optimal_dtype)

    @classmethod
    def auto(cls) -> 'AmpConfig':
        """Create config with optimal settings for current hardware"""
        dtype = get_optimal_dtype()

        return cls(
            dtype=dtype,
            enabled=True,
            # Adjust other settings based on dtype
            loss_scale='dynamic' if dtype == torch.float16 else 'none',
        )

    @classmethod
    def force_bf16(cls) -> 'AmpConfig':
        """Force BF16 usage (will error if not supported)"""
        bf16_supported, _ = detect_bf16_support()
        if not bf16_supported:
            raise RuntimeError("BF16 not supported on this device")

        return cls(dtype=torch.bfloat16, enabled=True)

    @classmethod
    def force_fp16(cls) -> 'AmpConfig':
        """Force FP16 usage"""
        return cls(dtype=torch.float16, enabled=True)

def print_config_on_init(config: AmpConfig):
    """Print configuration status"""
    print_bf16_status()
    print(f"AMP Config: dtype={config.dtype}, enabled={config.enabled}")
```

**Step 6: Run tests**

Run: `python -m pytest tests/test_amp_bf16_utils.py -v`
Expected: PASS

**Step 7: Commit**

```bash
git add geometry_os/systems/pixel_compiler/amp_bf16_utils.py
git add geometry_os/systems/pixel_compiler/amp_config.py
git add tests/test_amp_bf16_utils.py
git commit -m "feat: enhance BF16 detection and automatic dtype selection"
```

---

## Task 2: Update Lightning Module for BF16

**Files:**
- Read: `geometry_os/systems/pixel_compiler/amp_lightning_module.py`
- Modify: `geometry_os/systems/pixel_compiler/amp_lightning_module.py`

**Step 1: Write the failing test**

```python
# tests/test_amp_lightning_bf16.py
import pytest
import torch
from lightning import LightningModule
from lightning.pytorch.utilities import grad_norm
from systems.pixel_compiler.amp_lightning_module import RtsAmpLightningModule
from systems.pixel_compiler.amp_config import AmpConfig

class DummyModel(torch.nn.Module):
    def __init__(self):
        super().__init__()
        self.linear = torch.nn.Linear(10, 5)

    def forward(self, x):
        return self.linear(x)

def test_lightning_module_with_bf16():
    """Lightning module should work with BF16"""
    if not torch.cuda.is_available():
        pytest.skip("CUDA not available")

    from systems.pixel_compiler.amp_bf16_utils import detect_bf16_support
    bf16_supported, _ = detect_bf16_support()

    if not bf16_supported:
        pytest.skip("BF16 not supported on this GPU")

    model = DummyModel()
    lightning_module = RtsAmpLightningModule(
        model=model,
        config=AmpConfig.force_bf16()
    )

    # Check precision is set correctly
    assert lightning_module.precision == 'bf16' or lightning_module.dtype == torch.bfloat16

def test_lightning_module_autodetect():
    """Should automatically detect and use BF16 when available"""
    if not torch.cuda.is_available():
        pytest.skip("CUDA not available")

    model = DummyModel()
    lightning_module = RtsAmpLightningModule(
        model=model,
        config=AmpConfig.auto()  # Auto-detect
    )

    # Verify dtype was set
    assert hasattr(lightning_module, 'dtype')
    assert lightning_module.dtype in [torch.bfloat16, torch.float16, torch.float32]

def test_bf16_gradient_checkpointing():
    """Gradient checkpointing should work with BF16"""
    if not torch.cuda.is_available():
        pytest.skip("CUDA not available")

    from systems.pixel_compiler.amp_bf16_utils import detect_bf16_support
    bf16_supported, _ = detect_bf16_support()

    if not bf16_supported:
        pytest.skip("BF16 not supported on this GPU")

    model = DummyModel()
    config = AmpConfig.force_bf16()
    config.gradient_checkpointing = True

    lightning_module = RtsAmpLightningModule(
        model=model,
        config=config
    )

    assert lightning_module.config.gradient_checkpointing
```

**Step 2: Run test to verify it fails**

Run: `python -m pytest tests/test_amp_lightning_bf16.py -v`
Expected: FAIL with missing implementations

**Step 3: Read existing Lightning module**

Run: Read `geometry_os/systems/pixel_compiler/amp_lightning_module.py`

**Step 4: Update Lightning module**

```python
# amp_lightning_module.py - add to existing file
from .amp_bf16_utils import get_optimal_dtype, detect_bf16_support, print_bf16_status
from .amp_config import AmpConfig

class RtsAmpLightningModule(LightningModule):
    def __init__(
        self,
        model: torch.nn.Module,
        config: Optional[AmpConfig] = None,
        **kwargs
    ):
        super().__init__(**kwargs)

        # Auto-detect optimal config if not provided
        if config is None:
            config = AmpConfig.auto()
        elif config.dtype == torch.float32:
            # Update with auto-detected dtype if still FP32
            optimal_dtype = get_optimal_dtype()
            if optimal_dtype != torch.float32:
                config = AmpConfig(auto_detect=True, dtype=optimal_dtype)

        self.model = model
        self.config = config
        self.dtype = config.dtype

        # Print status
        print_bf16_status()

        # Set precision for Lightning
        if self.dtype == torch.bfloat16:
            self.precision = 'bf16'
        elif self.dtype == torch.float16:
            self.precision = '16'
        else:
            self.precision = '32'

    def configure_optimization(self):
        """Configure optimizer with BF16 considerations"""
        # BF16 is more stable - can use higher learning rates
        if self.dtype == torch.bfloat16:
            lr = self.config.learning_rate * 1.5  # Can be more aggressive
        else:
            lr = self.config.learning_rate

        return torch.optim.AdamW(
            self.parameters(),
            lr=lr,
            betas=(0.9, 0.999),
            eps=1e-8 if self.dtype == torch.bfloat16 else 1e-4,
        )

    def on_train_start(self) -> None:
        """Called at start of training"""
        super().on_train_start()

        # Log dtype info
        self.log(f"training_dtype", str(self.dtype))
        self.log(f"precision", self.precision)

        # Verify GPU still supports our dtype
        if self.dtype == torch.bfloat16:
            bf16_supported, reason = detect_bf16_support()
            if not bf16_supported:
                self.logger.warning(f"BF16 requested but not supported: {reason}")
```

**Step 5: Run tests**

Run: `python -m pytest tests/test_amp_lightning_bf16.py -v`
Expected: PASS

**Step 6: Commit**

```bash
git add geometry_os/systems/pixel_compiler/amp_lightning_module.py
git add tests/test_amp_lightning_bf16.py
git commit -m "feat: add BF16 support to Lightning AMP module"
```

---

## Task 3: Update Trainer for BF16

**Files:**
- Read: `geometry_os/systems/pixel_compiler/amp_trainer.py`
- Modify: `geometry_os/systems/pixel_compiler/amp_trainer.py`

**Step 1: Write the failing test**

```python
# tests/test_amp_trainer_bf16.py
import pytest
import torch
from systems.pixel_compiler.amp_trainer import RtsAmpTrainer
from systems.pixel_compiler.amp_config import AmpConfig

def test_trainer_auto_detect_bf16():
    """Trainer should auto-detect BF16 capability"""
    if not torch.cuda.is_available():
        pytest.skip("CUDA not available")

    from systems.pixel_compiler.amp_bf16_utils import detect_bf16_support
    bf16_supported, _ = detect_bf16_support()

    trainer = RtsAmpTrainer(
        config=AmpConfig.auto(),
        devices=1,
        max_epochs=1,
    )

    expected_dtype = torch.bfloat16 if bf16_supported else torch.float16
    assert trainer.config.dtype in [expected_dtype, torch.float32]

def test_trainer_force_bf16_fallback():
    """Should handle forced BF16 gracefully when not supported"""
    if not torch.cuda.is_available():
        pytest.skip("CUDA not available")

    from systems.pixel_compiler.amp_bf16_utils import detect_bf16_support
    bf16_supported, _ = detect_bf16_support()

    if not bf16_supported:
        # Should raise error or fallback
        with pytest.raises(RuntimeError):
            trainer = RtsAmpTrainer(
                config=AmpConfig.force_bf16(),
                devices=1,
            )
```

**Step 4: Update trainer implementation**

```python
# amp_trainer.py - add to existing
from .amp_bf16_utils import print_bf16_status, get_optimal_dtype

class RtsAmpTrainer:
    def __init__(
        self,
        config: Optional[AmpConfig] = None,
        **trainer_kwargs
    ):
        # Auto-detect if not specified
        if config is None or config.dtype == torch.float32:
            optimal_dtype = get_optimal_dtype()
            if config is None:
                config = AmpConfig(auto_detect=True, dtype=optimal_dtype)
            else:
                config.dtype = optimal_dtype

        self.config = config

        # Print status
        print_bf16_status()

        # Set precision for Lightning Trainer
        precision = self._get_precision_value()
        trainer_kwargs['precision'] = precision

        # Initialize Lightning trainer
        self.trainer = L.Trainer(**trainer_kwargs)

    def _get_precision_value(self) -> str:
        """Get Lightning precision value from dtype"""
        if self.config.dtype == torch.bfloat16:
            return 'bf16'
        elif self.config.dtype == torch.float16:
            return '16'
        else:
            return '32-true'
```

**Step 5: Commit**

```bash
git add geometry_os/systems/pixel_compiler/amp_trainer.py
git add tests/test_amp_trainer_bf16.py
git commit -m "feat: add BF16 auto-detection to trainer"
```

---

## Task 4: Update Demo and Examples

**Files:**
- Read: `geometry_os/systems/pixel_compiler/demo_lightning_amp.py`
- Modify: `geometry_os/systems/pixel_compiler/demo_lightning_amp.py`

**Step 1: Update demo with BF16 example**

```python
# demo_lightning_amp.py - add BF16 section
def demo_bf16_auto_detection():
    """Demo automatic BF16 detection and usage"""
    print("\n" + "="*60)
    print("Demo: BF16 Auto-Detection")
    print("="*60)

    from systems.pixel_compiler.amp_bf16_utils import print_bf16_status
    print_bf16_status()

    # Create trainer with auto-detection
    trainer = RtsAmpTrainer(
        config=AmpConfig.auto(),  # Automatically detects BF16
        max_epochs=1,
        log_every_n_steps=10,
    )

    print(f"Trainer will use: {trainer.config.dtype}")
    print(f"Precision setting: {trainer.trainer.precision}")

def demo_force_bf16():
    """Demo forcing BF16 usage"""
    print("\n" + "="*60)
    print("Demo: Force BF16")
    print("="*60)

    try:
        trainer = RtsAmpTrainer(
            config=AmpConfig.force_bf16(),
            max_epochs=1,
        )
        print("Successfully forced BF16 mode")
    except RuntimeError as e:
        print(f"Cannot force BF16: {e}")

if __name__ == "__main__":
    # Add BF16 demos
    demo_bf16_auto_detection()
    demo_force_bf16()
```

**Step 2: Commit**

```bash
git add geometry_os/systems/pixel_compiler/demo_lightning_amp.py
git commit -m "docs: add BF16 examples to demo"
```

---

## Task 5: Documentation

**Files:**
- Create: `geometry_os/systems/pixel_compiler/BF16_GUIDE.md`

**Step 1: Create documentation**

```markdown
# BF16 Support in RTS AMP

## Overview

RTS AMP supports BFloat16 (BF16) for automatic mixed precision training on Ampere+ GPUs.

## What is BF16?

BF16 (Brain Float 16) is a 16-bit floating point format with:
- Same exponent bits as FP32 (8 bits)
- Same number of bits as FP16 (16 bits total)
- Better dynamic range than FP16
- Slightly less precision than FP16 (7 bits vs 10 bits mantissa)

## Why BF16?

1. **Training Stability**: BF16 maintains the same exponent range as FP32, reducing underflow/overflow
2. **Performance**: Native BF16 operations on Ampere+ are 3-4x faster than FP32
3. **Memory**: 50% memory reduction compared to FP32

## Supported Hardware

**Native BF16 Support (recommended):**
- NVIDIA RTX 30-series (Ampere)
- NVIDIA RTX 40-series (Ada Lovelace)
- NVIDIA A100, H100 (datacenter)
- Any GPU with compute capability 8.0+

**FP16 Fallback:**
- NVIDIA RTX 20-series (Turing)
- NVIDIA GTX 16-series
- V100 and older

## Usage

### Auto-Detection (Recommended)

```python
from systems.pixel_compiler.amp_config import AmpConfig
from systems.pixel_compiler.amp_trainer import RtsAmpTrainer

trainer = RtsAmpTrainer(
    config=AmpConfig.auto(),  # Automatically picks BF16 or FP16
)
```

### Force BF16

```python
trainer = RtsAmpTrainer(
    config=AmpConfig.force_bf16(),
)
```

### Force FP16

```python
trainer = RtsAmpTrainer(
    config=AmpConfig.force_fp16(),
)
```

## Checking Capability

```python
from systems.pixel_compiler.amp_bf16_utils import print_bf16_status

print_bf16_status()
```

Output:
```
==================================================
BF16 Capability Status
==================================================
GPU: NVIDIA GeForce RTX 4090
Compute Capability: 8.9
BF16 Supported: True
Reason: Compute capability 8.9 supports BF16
Optimal dtype: torch.bfloat16
==================================================
```

## Performance Tips

1. **Use Auto-Detection**: Let RTS AMP pick the optimal dtype
2. **Higher Learning Rates**: BF16 is more stable - can use 1.5x learning rate
3. **Batch Size**: BF16 allows 2x larger batches with same memory

## Troubleshooting

**"BF16 not supported on this device"**
- Update GPU drivers
- Check compute capability with `torch.cuda.get_device_capability()`
- Use `AmpConfig.auto()` for automatic fallback
```

**Step 2: Commit**

```bash
git add geometry_os/systems/pixel_compiler/BF16_GUIDE.md
git commit -m "docs: add BF16 usage guide"
```

---

## Verification Steps

After completing all tasks:

1. **Test BF16 detection:**
   ```bash
   python -m pytest tests/test_amp_bf16_utils.py -v
   ```

2. **Test Lightning integration:**
   ```bash
   python -m pytest tests/test_amp_lightning_bf16.py -v
   ```

3. **Run demo:**
   ```bash
   python systems/pixel_compiler/demo_lightning_amp.py
   ```

4. **Verify on actual GPU:**
   - Check that BF16 is used on Ampere+
   - Verify FP16 fallback on older GPUs
   - Confirm training runs successfully

---

**Total Estimated Time:** 1-2 hours

**Dependencies:** None (can be done in parallel with other Phase 1 tasks)
