# Phase 1.1: Dynamic Loss Scaling Implementation Plan

**Status:** Ready for Execution
**Created:** 2026-02-07
**Parent:** `docs/plans/2026-02-07-rts-amp-roadmap-index.md`

## Overview

Implement dynamic loss scaling to prevent underflow in mixed precision training. The loss scaler automatically adjusts the scale factor based on gradient history, maximizing the range of float16 while avoiding overflow/underflow.

## Success Criteria

1. `DynamicLossScaler` class tracks gradient history and adjusts scale factor
2. `AMPConfig` extended with dynamic scaling parameters
3. `AMPTrainer` seamlessly integrates dynamic scaling
4. Demo shows training stability improvements on vision-language model
5. Documentation explains tuning parameters and troubleshooting

## Implementation Tasks

### Task 1: Create DynamicLossScaler Class

**File:** `geometry_os/systems/pixel_compiler/dynamic_scaler.py`

**Requirements:**
```python
class DynamicLossScaler:
    """
    Dynamic loss scaler for AMP training.

    Features:
    - Automatic scale factor adjustment based on gradient history
    - Growth factor when gradients are healthy
    - Downscale factor when overflow detected
    - Maximum scale factor to prevent overflow
    - Minimum scale factor to prevent underflow
    - Gradient history tracking with configurable window size
    """

    def __init__(
        self,
        init_scale: float = 2.0**15,
        growth_factor: float = 2.0,
        backoff_factor: float = 0.5,
        growth_interval: int = 2000,
        max_scale: float = 2.0**24,
        min_scale: float = 1.0,
        history_window: int = 100,
    ):
        pass

    def scale(self, loss: torch.Tensor) -> torch.Tensor:
        """Scale loss before backward pass."""
        pass

    def update(self, optimizer: torch.optim.Optimizer) -> bool:
        """
        Update scale factor based on gradient status.
        Returns True if gradients are valid (no inf/nan).
        """
        pass

    def unscale(self, optimizer: torch.optim.Optimizer):
        """Unscale gradients before optimizer step."""
        pass

    def step(self, optimizer: torch.optim.Optimizer) -> bool:
        """
        Complete scaler step: unscale, check, update, step optimizer.
        Returns True if step was successful.
        """
        pass

    def get_state(self) -> dict:
        """Get scaler state for checkpointing."""
        pass

    def load_state(self, state: dict):
        """Load scaler state from checkpoint."""
        pass
```

**Acceptance Criteria:**
- [ ] Class implements all methods above
- [ ] Gradient history tracking prevents false overflow detection
- [ ] State management enables checkpoint resume
- [ ] Unit tests cover scale adjustment logic

### Task 2: Extend AMPConfig

**File:** `geometry_os/systems/pixel_compiler/amp_config.py` (modify existing)

**Additions:**
```python
@dataclass
class DynamicScalingConfig:
    """Configuration for dynamic loss scaling."""
    enabled: bool = True
    init_scale: float = 2.0**15
    growth_factor: float = 2.0
    backoff_factor: float = 0.5
    growth_interval: int = 2000
    max_scale: float = 2.0**24
    min_scale: float = 1.0
    history_window: int = 100

@dataclass
class AMPConfig:
    # ... existing fields ...
    dynamic_scaling: DynamicScalingConfig = field(default_factory=DynamicScalingConfig)
```

**Acceptance Criteria:**
- [ ] AMPConfig includes dynamic_scaling field
- [ ] Default values work for typical vision-language models
- [ ] Config can be serialized/deserialized
- [ ] Validation prevents invalid parameter combinations

### Task 3: Integrate into AMPTrainer

**File:** `geometry_os/systems/pixel_compiler/amp_trainer.py` (modify existing)

**Changes:**
1. Initialize DynamicLossScaler if `dynamic_scaling.enabled`
2. Replace static GradScaler with DynamicLossScaler
3. Add scale factor logging
4. Handle NaN recovery with scaler reset

**Key Modifications:**
```python
class AMPTrainer:
    def __init__(self, config: AMPConfig, ...):
        # ... existing init ...
        if config.dynamic_scaling.enabled:
            self.scaler = DynamicLossScaler(
                init_scale=config.dynamic_scaling.init_scale,
                growth_factor=config.dynamic_scaling.growth_factor,
                backoff_factor=config.dynamic_scaling.backoff_factor,
                growth_interval=config.dynamic_scaling.growth_interval,
                max_scale=config.dynamic_scaling.max_scale,
                min_scale=config.dynamic_scaling.min_scale,
                history_window=config.dynamic_scaling.history_window,
            )
        else:
            self.scaler = torch.cuda.amp.GradScaler()

    def training_step(self, batch):
        # Use self.scaler.scale() for loss
        # Use self.scaler.step() for optimizer
        # Log scale factor if dynamic
        pass
```

**Acceptance Criteria:**
- [ ] AMPTrainer works with both dynamic and static scaling
- [ ] Scale factor logged to TensorBoard/WandB
- [ ] Checkpoint save/load preserves scaler state
- [ ] Training resumes correctly after NaN recovery

### Task 4: Create Demo

**File:** `geometry_os/systems/pixel_compiler/demo_dynamic_scaling.py`

**Demo Contents:**
1. Train Pixel LLM with dynamic scaling
2. Compare training stability:
   - With dynamic scaling (fewer NaNs)
   - Without dynamic scaling (more NaNs)
3. Visualize scale factor adjustments
4. Show gradient norm distribution
5. Benchmark overhead (<5%)

**Script Structure:**
```python
#!/usr/bin/env python3
"""
Demo: Dynamic Loss Scaling for AMP Training

Shows:
1. Scale factor adjustment over time
2. Reduction in NaN occurrences
3. Training stability comparison
"""

def main():
    # Setup
    # Run with dynamic scaling
    # Run without dynamic scaling
    # Compare metrics
    # Visualize results
```

**Acceptance Criteria:**
- [ ] Demo runs without errors
- [ ] Produces comparison plots
- [ ] Shows measurable improvement
- [ ] Completes in <5 minutes on single GPU

### Task 5: Write Documentation

**File:** `docs/amp/dynamic_loss_scaling.md`

**Documentation Contents:**
1. Overview of dynamic loss scaling
2. When to use dynamic vs static scaling
3. Parameter tuning guide
4. Troubleshooting common issues:
   - Scale factor keeps decreasing
   - Scale factor at maximum
   - Frequent NaN despite scaling
5. Integration examples with Pixel LLM
6. Performance benchmarks

**Acceptance Criteria:**
- [ ] Clear explanation of algorithm
- [ ] Practical tuning recommendations
- [ ] Troubleshooting guide covers edge cases
- [ ] Code examples work with Pixel LLM

## Testing Strategy

### Unit Tests
- `test_dynamic_scaler.py`: Test scale adjustment logic
- `test_amp_config.py`: Test config serialization
- `test_integration.py`: Test AMPTrainer integration

### Integration Tests
- Train Pixel LLM for 100 steps with dynamic scaling
- Verify scale factor adjustment
- Verify checkpoint resume

### Benchmarks
- Measure overhead of dynamic scaling
- Compare training speed with static scaling
- Track NaN reduction rate

## Dependencies

### Internal
- `geometry_os/systems/pixel_compiler/amp_trainer.py`
- `geometry_os/systems/pixel_compiler/amp_config.py`
- `geometry_os/systems/pixel_llm/` (for demo)

### External
- PyTorch >= 2.0
- torch.cuda.amp.GradScaler (for fallback)

## Risks & Mitigations

| Risk | Impact | Mitigation |
|------|--------|------------|
| Scale factor oscillation | Training instability | Add hysteresis to scale adjustment |
| History tracking overhead | Slower training | Use efficient circular buffer |
| Checkpoint incompatibility | Can't resume old checkpoints | Add version field to state |

## Timeline Estimate

| Task | Estimate |
|------|----------|
| Task 1: DynamicLossScaler | 2 hours |
| Task 2: AMPConfig extension | 30 minutes |
| Task 3: AMPTrainer integration | 1 hour |
| Task 4: Demo | 1 hour |
| Task 5: Documentation | 1 hour |
| **Total** | **5.5 hours** |

## Rollout Plan

1. Implement and test locally
2. Run integration tests with Pixel LLM
3. Update documentation
4. Create PR for review
5. Merge to main branch

---

**Next Action:** Begin Task 1 - Create DynamicLossScaler class
