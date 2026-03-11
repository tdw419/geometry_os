# Phase 1.2: Multi-GPU Training with AMP Implementation Plan

**Status:** Ready for Execution
**Created:** 2026-02-07
**Parent:** `docs/plans/2026-02-07-rts-amp-roadmap-index.md`
**Depends On:** Phase 1.1 (Dynamic Loss Scaling)

## Overview

Implement distributed AMP training support to enable efficient multi-GPU training for large-scale vision-language models. Combines PyTorch DistributedDataParallel (DDP) with AMP for maximum throughput.

## Success Criteria

1. `DistributedAMPTrainer` combines DDP + AMP seamlessly
2. `DistributedConfig` module manages multi-GPU settings
3. Launch scripts support both `torchrun` and `torch.distributed.launch`
4. Documentation covers distributed training patterns
5. Benchmarks show >80% scaling efficiency

## Implementation Tasks

### Task 1: Create DistributedAMPTrainer

**File:** `geometry_os/systems/pixel_compiler/distributed_amp_trainer.py`

**Requirements:**
```python
import torch
import torch.distributed as dist
from torch.nn.parallel import DistributedDataParallel as DDP
from .amp_trainer import AMPTrainer

class DistributedAMPTrainer(AMPTrainer):
    """
    Distributed AMP trainer combining DDP + AMP.

    Features:
    - Automatic process group initialization
    - Gradient synchronization with AMP
    - Per-rank logging and checkpointing
    - Support for heterogeneous node configurations
    """

    def __init__(
        self,
        model: torch.nn.Module,
        config: AMPConfig,
        rank: int = 0,
        world_size: int = 1,
        backend: str = "nccl",
        device_ids: Optional[List[int]] = None,
    ):
        """
        Initialize distributed trainer.

        Args:
            model: Model to train (will be wrapped in DDP)
            config: AMP configuration
            rank: Process rank (default: 0)
            world_size: Total number of processes
            backend: Distributed backend (nccl, gloo)
            device_ids: GPU IDs for this process
        """
        pass

    def setup_distributed(self):
        """Initialize process group and set device."""
        pass

    def wrap_model(self, model: torch.nn.Module) -> DDP:
        """Wrap model in DDP with AMP-friendly settings."""
        pass

    def training_step(self, batch):
        """
        Training step with distributed gradient synchronization.

        Override to handle all-reduce of scale factors.
        """
        pass

    def save_checkpoint(self, path: str, rank: int = 0):
        """Save checkpoint from rank 0 only."""
        pass

    def load_checkpoint(self, path: str):
        """Load checkpoint on all ranks."""
        pass

    @staticmethod
    def is_distributed() -> bool:
        """Check if running in distributed mode."""
        pass
```

**Acceptance Criteria:**
- [ ] Extends AMPTrainer without breaking changes
- [ ] DDP wrapper configured correctly for AMP
- [ ] Checkpointing only from rank 0
- [ ] Handles uneven workloads across GPUs

### Task 2: Create Distributed Configuration Module

**File:** `geometry_os/systems/pixel_compiler/distributed_config.py`

**Requirements:**
```python
from dataclasses import dataclass, field
from typing import Optional, List

@dataclass
class DistributedConfig:
    """
    Configuration for distributed training.

    Handles:
    - Multi-node setup
    - GPU affinity
    - Environment variable configuration
    - Launch method selection
    """
    # Process settings
    world_size: int = 1
    rank: int = 0
    backend: str = "nccl"

    # Node configuration
    master_addr: str = "localhost"
    master_port: int = 29500
    num_nodes: int = 1
    node_rank: int = 0

    # GPU settings
    num_gpus_per_node: int = 1
    device_ids: Optional[List[int]] = None

    # Training behavior
    find_unused_parameters: bool = False
    broadcast_buffers: bool = True
    gradient_as_bucket_view: bool = True

    # Launch method
    launch_method: str = "torchrun"  # or "torch.distributed.launch"

    def to_env_dict(self) -> dict:
        """Convert to environment variables for subprocess."""
        pass

    @classmethod
    def from_env(cls) -> "DistributedConfig":
        """Create from environment variables (set by torchrun)."""
        pass

    def validate(self) -> bool:
        """Validate configuration consistency."""
        pass
```

**Acceptance Criteria:**
- [ ] Configuration covers all common scenarios
- [ ] Environment variable conversion works
- [ ] Validation catches common errors
- [ ] Can be loaded from YAML/JSON

### Task 3: Create Launch Scripts

**Files:**
- `scripts/train_dist_torchrun.sh` - torchrun launcher
- `scripts/train_dist_launch.sh` - torch.distributed.launch launcher
- `scripts/train_multinode.sh` - Multi-node launcher

**Script Requirements:**

```bash
#!/bin/bash
# scripts/train_dist_torchrun.sh

# Usage: ./train_dist_torchrun.sh --num_gpus 4 --config config.yaml

# Parse arguments
# Set environment variables
# Launch with torchrun
torchrun \
    --nproc_per_node=$NUM_GPUS \
    --nnodes=$NUM_NODES \
    --node_rank=$NODE_RANK \
    --master_addr=$MASTER_ADDR \
    --master_port=$MASTER_PORT \
    train.py \
    --config $CONFIG \
    --distributed
```

**Acceptance Criteria:**
- [ ] Both launch methods supported
- [ ] Argument parsing is robust
- [ ] Environment variables set correctly
- [ ] Multi-node configuration works
- [ ] Usage documentation in comments

### Task 4: Write Distributed Training Documentation

**File:** `docs/amp/distributed_training.md`

**Documentation Contents:**

1. **Overview**
   - When to use distributed training
   - Performance expectations
   - Hardware requirements

2. **Single-Node Setup**
   - Single machine, multiple GPUs
   - Example configurations
   - Troubleshooting NCCL errors

3. **Multi-Node Setup**
   - Network configuration
   - SSH setup
   - Storage considerations (shared vs distributed)

4. **Launch Methods**
   - torchrun (recommended)
   - torch.distributed.launch (legacy)
   - Manual process spawning

5. **Best Practices**
   - Gradient accumulation in distributed setting
   - Batch size scaling
   - Learning rate adjustment
   - Mixed precision considerations

6. **Troubleshooting**
   - NCCL timeouts
   - Uneven GPU utilization
   - Checkpoint loading issues
   - Debugging tips (NCCL_DEBUG, etc.)

**Acceptance Criteria:**
- [ ] Clear step-by-step setup instructions
- [ ] Troubleshooting guide covers common issues
- [ ] Code examples are copy-pasteable
- [ ] Performance tuning guidelines

### Task 5: Create Benchmarks

**File:** `geometry_os/systems/pixel_compiler/benchmark_distributed.py`

**Benchmark Contents:**

1. **Weak Scaling**
   - Fixed batch size per GPU
   - Measure throughput vs GPU count
   - Target: >90% efficiency

2. **Strong Scaling**
   - Fixed global batch size
   - Measure speedup vs GPU count
   - Target: >80% efficiency

3. **Communication Overhead**
   - Measure all-reduce time
   - Profile gradient synchronization
   - Compare NCCL vs gloo backends

4. **Memory Scaling**
   - Measure memory per GPU
   - Verify no memory leaks
   - Check for gradient accumulation overhead

```python
def benchmark_weak_scaling():
    """Benchmark with fixed batch size per GPU."""
    results = {}
    for num_gpus in [1, 2, 4, 8]:
        # Measure throughput
        # Calculate efficiency
        results[num_gpus] = {...}
    return results

def benchmark_strong_scaling():
    """Benchmark with fixed global batch size."""
    # ...
```

**Acceptance Criteria:**
- [ ] Benchmarks run on 1, 2, 4, 8 GPUs
- [ ] Results saved to CSV/plots
- [ ] Efficiency meets targets
- [ ] Documentation includes baseline numbers

## Architecture Diagram

```
┌─────────────────────────────────────────────────────────┐
│                    Node 0 (Master)                      │
├─────────────────┬─────────────────┬─────────────────────┤
│     GPU 0       │     GPU 1       │     GPU 2           │
│  Rank 0 (Main)  │     Rank 1      │     Rank 2          │
│  ┌───────────┐  │  ┌───────────┐  │  ┌───────────┐     │
│  │ DDP Model │  │  │ DDP Model │  │  │ DDP Model │     │
│  │ + AMP     │◄─┼──│ + AMP     │◄─┼──│ + AMP     │     │
│  └───────────┘  │  └───────────┘  │  └───────────┘     │
│        │        │        │        │        │            │
│        └────────┴────────┴────────┴────────┘            │
│                    │                                    │
│              All-Reduce                                 │
│                    ▼                                    │
│              Synchronized Gradients                     │
└─────────────────────────────────────────────────────────┘
         │                           │
         │ Network (NCCL)            │ Network (NCCL)
         ▼                           ▼
┌─────────────────┐         ┌─────────────────┐
│     Node 1      │         │     Node 2      │
│  GPU 0: Rank 3  │         │  GPU 0: Rank 6  │
│  GPU 1: Rank 4  │         │  GPU 1: Rank 7  │
│  GPU 2: Rank 5  │         │  GPU 2: Rank 8  │
└─────────────────┘         └─────────────────┘
```

## Testing Strategy

### Unit Tests
- Test DistributedConfig serialization
- Test environment variable parsing
- Test process group initialization

### Integration Tests
- 2-GPU training test
- 4-GPU training test
- Multi-node test (if hardware available)

### Acceptance Tests
- Train Pixel LLM for 1000 steps
- Verify loss matches single-GPU training
- Check checkpoint save/load works

## Dependencies

### Internal
- `geometry_os/systems/pixel_compiler/amp_trainer.py`
- `geometry_os/systems/pixel_compiler/dynamic_scaler.py` (from Phase 1.1)
- `geometry_os/systems/pixel_llm/`

### External
- PyTorch >= 2.0
- NCCL libraries (for GPU training)
- OpenMPI (optional, for CPU backend)

## Risks & Mitigations

| Risk | Impact | Mitigation |
|------|--------|------------|
| NCCL timeout errors | Training failure | Increase timeout, check network |
| Uneven GPU utilization | Poor scaling | Verify data loader shuffling |
| Checkpoint corruption | Can't resume | Atomic writes, validation |
| Port conflicts | Can't launch | Auto-port selection |

## Timeline Estimate

| Task | Estimate |
|------|----------|
| Task 1: DistributedAMPTrainer | 3 hours |
| Task 2: DistributedConfig | 1 hour |
| Task 3: Launch Scripts | 1 hour |
| Task 4: Documentation | 2 hours |
| Task 5: Benchmarks | 2 hours |
| **Total** | **9 hours** |

## Rollout Plan

1. Implement DistributedAMPTrainer locally
2. Test on single-node, multi-GPU
3. Create and test launch scripts
4. Write documentation
5. Run benchmarks
6. Create PR for review

---

**Next Action:** Complete Phase 1.1 (Dynamic Loss Scaling) first, then begin Task 1
