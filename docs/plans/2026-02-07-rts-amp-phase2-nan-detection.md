# Phase 2.2: NaN Detection & Recovery Implementation Plan

**Status:** Ready for Execution
**Created:** 2026-02-07
**Parent:** `docs/plans/2026-02-07-rts-amp-roadmap-index.md`
**Can Run In Parallel With:** Phase 1.1 (Dynamic Loss Scaling)

## Overview

Implement comprehensive NaN (Not a Number) and Inf (Infinity) detection and recovery system for AMP training. Automatically detects numerical instability and applies configurable recovery strategies to prevent training crashes.

## Success Criteria

1. `NaNDetector` identifies NaN/Inf in tensors with minimal overhead
2. `NaNRecoveryManager` implements multiple recovery strategies
3. `AMPTrainer` integrates NaN handling seamlessly
4. Troubleshooting documentation covers common scenarios
5. Demo shows recovery from numerical instability

## Implementation Tasks

### Task 1: Create NaNDetector

**File:** `geometry_os/systems/pixel_compiler/nan_detector.py`

**Requirements:**
```python
import torch
from dataclasses import dataclass
from typing import Optional, List, Tuple
from enum import Enum

class NaNType(Enum):
    NAN = "nan"
    POS_INF = "pos_inf"
    NEG_INF = "neg_inf"
    NONE = "none"

@dataclass
class NaNReport:
    """Report of NaN/Inf detection."""
    has_nan: bool
    nan_type: NaNType
    location: str  # e.g., "loss", "gradients.model.layer1.weight"
    tensor_shape: Optional[tuple] = None
    tensor_stats: Optional[dict] = None
    suggested_action: Optional[str] = None

class NaNDetector:
    """
    Detect NaN and Inf values in tensors.

    Features:
    - Fast tensor scanning with early exit
    - Detailed reporting of NaN locations
    - Pattern detection (first occurrence, frequency)
    - Minimal performance overhead
    - Configurable detection frequency
    """

    def __init__(
        self,
        check_loss: bool = True,
        check_gradients: bool = True,
        check_parameters: bool = False,
        detection_interval: int = 1,  # Check every N steps
        max_items_to_check: int = 1000,  # Limit for performance
    ):
        pass

    def check_tensor(
        self,
        tensor: torch.Tensor,
        name: str,
    ) -> NaNReport:
        """
        Check a single tensor for NaN/Inf.

        Returns:
            NaNReport with detection details
        """
        pass

    def check_model(
        self,
        model: torch.nn.Module,
        check_gradients: bool = True,
    ) -> List[NaNReport]:
        """
        Check all parameters/gradients in a model.

        Returns:
            List of NaNReports for any issues found
        """
        pass

    def check_loss(self, loss: torch.Tensor) -> NaNReport:
        """Check loss tensor for NaN/Inf."""
        pass

    def get_statistics(self) -> dict:
        """Get NaN detection statistics."""
        pass

    def reset_statistics(self):
        """Clear detection history."""
        pass

    @staticmethod
    def find_nan_source(
        model: torch.nn.Module,
        inputs: tuple,
        targets: Optional[torch.Tensor] = None,
    ) -> Optional[str]:
        """
        Binary search through model to find NaN source.

        Performs forward hook analysis to isolate which layer
        produces NaN values.
        """
        pass
```

**Acceptance Criteria:**
- [ ] Detects NaN, +Inf, -Inf correctly
- [ ] Early exit on first NaN for performance
- [ ] Binary search finds layer producing NaN
- [ ] Statistics track NaN frequency
- [ ] Overhead <2% of training time

### Task 2: Create NaNRecoveryManager

**File:** `geometry_os/systems/pixel_compiler/nan_recovery.py`

**Requirements:**
```python
from dataclasses import dataclass
from enum import Enum
from typing import Optional, Callable
import torch

class RecoveryStrategy(Enum):
    """Available recovery strategies."""
    SKIP_STEP = "skip"  # Skip this training step
    REDUCE_SCALE = "reduce_scale"  # Reduce loss scale
    CLIP_GRADIENTS = "clip"  # Clip gradients
    RESET_MODEL = "reset"  # Reset to last checkpoint
    CUSTOM = "custom"  # User-defined recovery

@dataclass
class RecoveryConfig:
    """Configuration for NaN recovery."""
    primary_strategy: RecoveryStrategy = RecoveryStrategy.REDUCE_SCALE
    fallback_strategy: RecoveryStrategy = RecoveryStrategy.SKIP_STEP
    max_consecutive_nans: int = 5  # Abort after this many
    scale_reduction_factor: float = 0.5  # For REDUCE_SCALE
    grad_clip_value: Optional[float] = 1.0  # For CLIP_GRADIENTS
    skip_batch_after_nan: bool = True
    custom_recovery_fn: Optional[Callable] = None

class NaNRecoveryManager:
    """
    Manage recovery from NaN/Inf during training.

    Implements multiple strategies with automatic fallback.
    Tracks recovery history and provides diagnostics.
    """

    def __init__(self, config: RecoveryConfig):
        pass

    def should_abort(self) -> bool:
        """
        Check if training should abort due to excessive NaNs.

        Returns:
            True if max_consecutive_nans exceeded
        """
        pass

    def recover(
        self,
        nan_report: NaNReport,
        model: torch.nn.Module,
        optimizer: torch.optim.Optimizer,
        scaler: Optional["DynamicLossScaler"] = None,
        step: int = 0,
    ) -> bool:
        """
        Attempt recovery from NaN.

        Args:
            nan_report: Report from NaNDetector
            model: Model being trained
            optimizer: Optimizer instance
            scaler: Loss scaler (if using AMP)
            step: Current training step

        Returns:
            True if recovery successful, False if should abort
        """
        pass

    def _skip_step(self) -> bool:
        """Skip current training step."""
        pass

    def _reduce_scale(self, scaler) -> bool:
        """Reduce loss scale factor."""
        pass

    def _clip_gradients(
        self,
        model: torch.nn.Module,
        clip_value: float,
    ) -> bool:
        """Clip gradients to prevent overflow."""
        pass

    def _reset_model(
        self,
        model: torch.nn.Module,
        optimizer: torch.optim.Optimizer,
        checkpoint_path: str,
    ) -> bool:
        """Reset model from last good checkpoint."""
        pass

    def get_recovery_history(self) -> list:
        """Get history of recovery actions."""
        pass

    def get_recommendations(self) -> list:
        """
        Get recommendations for preventing future NaNs.

        Analyzes recovery history to suggest configuration changes.
        """
        pass
```

**Acceptance Criteria:**
- [ ] All recovery strategies implemented
- [ ] Automatic fallback works correctly
- [ ] History tracking identifies patterns
- [ ] Recommendations are actionable
- [ ] Recovery doesn't corrupt training state

### Task 3: Integrate into AMPTrainer

**File:** `geometry_os/systems/pixel_compiler/amp_trainer.py` (modify existing)

**Changes:**
```python
class AMPTrainer:
    def __init__(self, config: AMPConfig, ...):
        # ... existing init ...
        self.nan_detector = NaNDetector(
            check_loss=config.nan_detection.check_loss,
            check_gradients=config.nan_detection.check_gradients,
            detection_interval=config.nan_detection.detection_interval,
        )
        self.nan_recovery = NaNRecoveryManager(
            config=config.nan_detection.recovery
        )

    def training_step(self, batch):
        """Training step with NaN detection and recovery."""
        # Forward pass
        loss = self.model(batch)

        # Check loss for NaN
        if self.nan_detector.check_loss(loss).has_nan:
            return self._handle_nan(loss, batch, step=self.step)

        # Backward pass with AMP
        self.scaler.scale(loss).backward()

        # Check gradients for NaN
        nan_reports = self.nan_detector.check_model(self.model, check_gradients=True)
        if nan_reports:
            return self._handle_nan(loss, batch, reports=nan_reports, step=self.step)

        # Optimizer step
        self.scaler.step(self.optimizer)
        self.scaler.update()

        return loss

    def _handle_nan(self, loss, batch, reports=None, step=0):
        """Handle detected NaN with recovery."""
        # Find the NaN report
        nan_report = reports[0] if reports else self.nan_detector.check_loss(loss)

        # Attempt recovery
        recovered = self.nan_recovery.recover(
            nan_report=nan_report,
            model=self.model,
            optimizer=self.optimizer,
            scaler=self.scaler,
            step=step,
        )

        # Check if should abort
        if not recovered or self.nan_recovery.should_abort():
            raise TrainingAbortedError(
                f"Training aborted due to NaN at step {step}"
            )

        # Log recovery action
        self.log_nan_recovery(nan_report, step)

        # Return None to indicate step was skipped/recovered
        return None
```

**Acceptance Criteria:**
- [ ] Detection happens at appropriate times
- [ ] Recovery is automatic and transparent
- [ ] Logging captures all NaN events
- [ ] Training continues after successful recovery
- [ ] Abort occurs when recovery fails

### Task 4: Write Troubleshooting Documentation

**File:** `docs/amp/nan_troubleshooting.md`

**Documentation Contents:**

1. **Understanding NaN in AMP Training**
   - Why NaN occurs (underflow, overflow, division by zero)
   - Common patterns (gradual onset, sudden spikes)
   - Impact on training (loss explosion, model collapse)

2. **Diagnostic Tools**
   - Using NaNDetector
   - Reading NaN reports
   - Finding NaN source with binary search
   - Analyzing recovery history

3. **Common Scenarios & Solutions**

   | Scenario | Symptoms | Solution |
   |----------|----------|----------|
   | Loss scale too high | Frequent NaN after scale growth | Reduce `max_scale`, increase `growth_interval` |
   | Learning rate too high | NaN after LR warmup | Lower learning rate or extend warmup |
   | Gradient explosion | NaN in specific layers | Add gradient clipping |
   | Numerical instability | NaN in loss computation | Use log-space calculations |
   | Batch size too small | Noisy gradients cause overflow | Increase batch size or gradient accumulation |

4. **Recovery Strategy Guide**
   - When to use REDUCE_SCALE
   - When to use CLIP_GRADIENTS
   - When to RESET_MODEL
   - Configuring fallback strategies

5. **Prevention Best Practices**
   - Proper weight initialization
   - Learning rate scheduling
   - Gradient clipping thresholds
   - Batch norm vs layer norm considerations

6. **Debugging Workflow**
   ```
   1. Identify NaN location (NaNDetector.find_nan_source)
   2. Check input data for corruption
   3. Verify model architecture
   4. Review hyperparameters
   5. Enable detailed logging
   6. Apply targeted fix
   7. Monitor recovery history
   ```

**Acceptance Criteria:**
- [ ] Troubleshooting guide is comprehensive
- [ ] Scenarios match real-world issues
- [ ] Solutions are actionable
- [ ] Debugging workflow is clear

## Architecture Diagram

```
Training Step
     │
     ▼
┌─────────────┐
│ Forward Pass│
└─────────────┘
     │
     ▼
┌─────────────┐    ┌──────────────┐
│ Check Loss  │───▶│ NaNDetector  │
└─────────────┘    └──────────────┘
     │                     │
     │ No NaN              │ NaN found
     ▼                     ▼
┌─────────────┐    ┌──────────────┐
│ Backward    │    │NaNRecovery   │
│ Pass        │    │Manager       │
└─────────────┘    └──────────────┘
     │                     │
     ▼                     ▼
┌─────────────┐    ┌──────────────────┐
│ Check Grads │───▶│ Recovery Strategy │
└─────────────┘    │  - Reduce scale   │
     │             │  - Clip grads     │
     │ No NaN      │  - Skip step      │
     ▼             │  - Reset model    │
┌─────────────┐    └──────────────────┘
│ Optimizer   │              │
│ Step        │◀─────────────┘
└─────────────┘    Recovery complete
```

## Testing Strategy

### Unit Tests
- Test NaNDetector with various NaN patterns
- Test each recovery strategy independently
- Test recovery manager fallback logic

### Integration Tests
- Inject NaN into training and verify recovery
- Test consecutive NaN handling
- Test checkpoint reset recovery

### End-to-End Test
- Train model that commonly produces NaN
- Verify training completes with recovery
- Compare to training without NaN (should match)

## Dependencies

### Internal
- `geometry_os/systems/pixel_compiler/amp_trainer.py`
- `geometry_os/systems/pixel_compiler/dynamic_scaler.py` (for REDUCE_SCALE)

### External
- PyTorch >= 2.0

## Risks & Mitigations

| Risk | Impact | Mitigation |
|------|--------|------------|
| False positive NaN detection | Unnecessary recovery | Configurable detection sensitivity |
| Recovery corrupts state | Training degradation | Validate recovery, keep backups |
| Performance overhead | Slower training | Configurable detection interval |
| Recovery loop | Stuck training | Max consecutive NaN limit |

## Timeline Estimate

| Task | Estimate |
|------|----------|
| Task 1: NaNDetector | 2.5 hours |
| Task 2: NaNRecoveryManager | 2 hours |
| Task 3: AMPTrainer Integration | 1.5 hours |
| Task 4: Documentation | 2 hours |
| **Total** | **8 hours** |

## Rollout Plan

1. Implement NaNDetector with unit tests
2. Implement NaNRecoveryManager with unit tests
3. Integrate into AMPTrainer
4. Write comprehensive tests
5. Create troubleshooting documentation
6. Run validation tests
7. Create PR for review

---

**Next Action:** Can begin immediately (parallel with Phase 1.1)
