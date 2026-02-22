# Rts Amp Phase1 Multi Gpu12 - Tasks

## 1. Create DistributedAMPTrainer

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

- [ ] `scripts/train_dist_torchrun.sh` - torchrun launcher
