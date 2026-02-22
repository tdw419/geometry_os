# Distributed Training with AMP

This guide covers distributed training for geometry_os models using PyTorch DistributedDataParallel (DDP) with Automatic Mixed Precision (AMP).

## Table of Contents

1. [Overview](#overview)
2. [When to Use Distributed Training](#when-to-use-distributed-training)
3. [Single-Node Setup](#single-node-setup)
4. [Multi-Node Setup](#multi-node-setup)
5. [Launch Methods](#launch-methods)
6. [Best Practices](#best-practices)
7. [Troubleshooting](#troubleshooting)

---

## Overview

Distributed training enables training across multiple GPUs and nodes, providing:
- **Faster training**: Linear scaling with number of GPUs (ideally)
- **Larger batch sizes**: More data processed per iteration
- **Larger models**: Model parallelism across devices

### Architecture

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

### Performance Expectations

| Configuration | Expected Scaling | Notes |
|--------------|------------------|-------|
| 2 GPUs | 1.8-1.9x | Near-linear |
| 4 GPUs | 3.5-3.8x | Slight communication overhead |
| 8 GPUs | 6.5-7.5x | More noticeable overhead |
| 16+ GPUs | 12-14x | Diminishing returns |

### Hardware Requirements

**Minimum:**
- 2x GPUs (same model, preferably on same PCIe root complex)
- PCIe Gen3 x16 or better
- CUDA 11.0+
- PyTorch 2.0+

**Recommended:**
- 4x+ GPUs with NVLink
- PCIe Gen4 x16
- CUDA 11.8+
- PyTorch 2.1+
- Fast interconnect (InfiniBand for multi-node)

---

## When to Use Distributed Training

### Use Distributed Training When:

1. **Single GPU memory is insufficient** for your model/batch size
2. **Training time is too long** and you have multiple GPUs available
3. **You need larger effective batch sizes** for training stability
4. **You're doing hyperparameter search** and can parallelize across GPUs

### Use Single GPU When:

1. Your model fits comfortably in GPU memory
2. Training completes in acceptable time
3. You're debugging or prototyping
4. You have limited GPU resources

---

## Single-Node Setup

Single-node multi-GPU training is the simplest distributed configuration.

### Quick Start

```bash
# Auto-detect GPUs and launch training
./scripts/train_dist_torchrun.sh --num_gpus 4 --config config.yaml
```

### Manual Setup

```python
import torch
import torch.distributed as dist
from amp_config import create_default_amp_config
from distributed_amp_trainer import DistributedAMPTrainer

# Initialize process group (called by torchrun automatically)
def setup():
    dist.init_process_group(backend="nccl")
    local_rank = int(os.environ["LOCAL_RANK"])
    torch.cuda.set_device(local_rank)
    return local_rank

# Create model
model = MyModel().cuda()

# Wrap with DDP + AMP
config = create_default_amp_config()
trainer = DistributedAMPTrainer(
    model=model,
    config=config,
    rank=dist.get_rank(),
    world_size=dist.get_world_size(),
)

# Training loop
for batch in dataloader:
    loss = trainer.training_step(batch)
    if trainer.is_main_process:
        print(f"Loss: {loss}")

# Cleanup
dist.destroy_process_group()
```

### Example Configurations

**2 GPUs (e.g., RTX 3080 Ti):**
```bash
./scripts/train_dist_torchrun.sh \
    --num_gpus 2 \
    --config configs/base.yaml
```

**4 GPUs (e.g., A100):**
```bash
./scripts/train_dist_torchrun.sh \
    --num_gpus 4 \
    --config configs/base.yaml
```

**8 GPUs (e.g., 4x RTX 4090):**
```bash
./scripts/train_dist_torchrun.sh \
    --num_gpus 8 \
    --config configs/base.yaml
```

### Troubleshooting NCCL Errors

**Error: `NCCL error: unhandled system error`**
```bash
# Disable InfiniBand if not available
export NCCL_IB_DISABLE=1

# Set P2P level
export NCCL_P2P_LEVEL=NVL

# Use different transport
export NCCL_SOCKET_IFNAME=eth0
```

**Error: `RuntimeError: CUDA error: invalid configuration argument`**
```bash
# Check GPU visibility
nvidia-smi

# Set specific GPUs
export CUDA_VISIBLE_DEVICES=0,1,2,3
```

**Uneven GPU utilization:**
```python
# Ensure data loader is properly shuffled
dataloader = DataLoader(
    dataset,
    batch_size=32,
    shuffle=True,
    num_workers=4,
    pin_memory=True,
    drop_last=True,  # Important for distributed
)
```

---

## Multi-Node Setup

Multi-node training requires careful network and storage configuration.

### Network Configuration

1. **Passwordless SSH** between all nodes:
```bash
# On each node
ssh-keygen -t ed25519
ssh-copy-id user@node0
ssh-copy-id user@node1
# ... for all nodes
```

2. **Firewall rules** for master port:
```bash
# Allow traffic on master port
sudo ufw allow 29500/tcp
```

3. **Network interface** configuration:
```bash
# Set NCCL to use specific interface
export NCCL_SOCKET_IFNAME=eth0  # or ib0, enp1s0, etc.
```

### Storage Considerations

**Shared Storage (Recommended):**
- NFS mount on all nodes at same path
- Lustre / GPFS for HPC clusters
- Data and checkpoints on shared storage

**Distributed Storage:**
- Copy data to each node (same path!)
- Save checkpoints to shared storage only
- Use rank 0 for checkpointing

### Launch Script

```bash
# On node 0 (master)
./scripts/train_multinode.sh \
    --num_nodes 2 \
    --node_rank 0 \
    --num_gpus 4 \
    --master_addr $(hostname -I | awk '{print $1}') \
    --config config.yaml

# On node 1
./scripts/train_multinode.sh \
    --num_nodes 2 \
    --node_rank 1 \
    --num_gpus 4 \
    --master_addr <node0_ip> \
    --config config.yaml
```

### Environment Variables

```bash
# Required for multi-node
export MASTER_ADDR=<node0_ip>
export MASTER_PORT=29500
export WORLD_SIZE=8  # num_nodes * num_gpus_per_node

# NCCL tuning
export NCCL_DEBUG=WARN
export NCCL_IB_DISABLE=1
export NCCL_NET_GDR_LEVEL=5
export NCCL_SOCKET_NTHREADS=4
export NCCL_NSOCKS_PERTHREAD=4
```

---

## Launch Methods

### torchrun (Recommended)

PyTorch 2.0+ standard launcher.

```bash
torchrun \
    --nproc_per_node=4 \
    --nnodes=1 \
    train.py \
    --config config.yaml
```

**Advantages:**
- Official PyTorch launcher
- Better error handling
- Automatic elastic training support
- Consistent API across versions

**Environment Variables Set:**
- `RANK`: Global process rank
- `LOCAL_RANK`: Local rank on node
- `WORLD_SIZE`: Total processes
- `MASTER_ADDR`: Master node address
- `MASTER_PORT`: Communication port

### torch.distributed.launch (Legacy)

Older launcher for PyTorch < 2.0.

```bash
python -m torch.distributed.launch \
    --nproc_per_node=4 \
    --nnodes=1 \
    train.py \
    --config config.yaml
```

**Note:** Prefer `torchrun` for new code.

### Manual Process Spawning

For custom launch scenarios:

```python
import multiprocessing
import torch.multiprocessing as mp

def train(rank, world_size):
    dist.init_process_group(
        backend="nccl",
        init_method="tcp://localhost:29500",
        rank=rank,
        world_size=world_size,
    )
    # Training code here

if __name__ == "__main__":
    world_size = 4
    mp.spawn(train, args=(world_size,), nprocs=world_size)
```

---

## Best Practices

### Gradient Accumulation

In distributed training, gradient accumulation works per-process:

```python
# Global batch size = num_gpus * batch_size * accumulation_steps
trainer = DistributedAMPTrainer(
    model=model,
    accumulation_steps=4,  # Accumulate over 4 steps
    learning_rate=1e-4,
)

# Effective batch size = 4 GPUs * 32 batch * 4 accum = 512
```

### Batch Size Scaling

**Linear Scaling Rule:**
```python
# Single GPU baseline
batch_size = 32
learning_rate = 1e-4

# Multi-GPU with linear scaling
num_gpus = 4
batch_size = 32 * num_gpus  # 128
learning_rate = 1e-4 * num_gpus  # 4e-4
```

**Conservative Scaling (recommended):**
```python
batch_size = 32 * num_gpus
learning_rate = 1e-4 * sqrt(num_gpus)  # Less aggressive
```

### Learning Rate Adjustment

```python
# Warmup for distributed training
def get_lr(step, warmup_steps, base_lr, num_gpus):
    if step < warmup_steps:
        return base_lr * num_gpus * step / warmup_steps
    return base_lr * num_gpus

# Or use cosine decay with warmup
from torch.optim.lr_scheduler import CosineAnnealingLR
scheduler = CosineAnnealingLR(
    optimizer,
    T_max=max_steps,
    eta_min=base_lr * 0.1,
)
```

### Mixed Precision Considerations

```python
# Enable dynamic loss scaling for stability
from amp_config import create_default_amp_config

config = create_default_amp_config(
    use_dynamic_scaling=True,
    dynamic_history_size=100,
    initial_scale=2.0**15,  # Conservative start
)

# Monitor gradient scaling
if trainer.is_main_process:
    scaler = trainer.scaler
    print(f"Current scale: {scaler.get_scale()}")
```

### Checkpointing

```python
# Save from rank 0 only
if trainer.is_main_process:
    trainer.save_checkpoint(
        "checkpoint.pth",
        include_optimizer=True,
        metadata={"step": step, "loss": loss},
    )

# Barrier to ensure all processes sync
if dist.is_initialized():
    dist.barrier()

# Load on all ranks
trainer.load_checkpoint("checkpoint.pth")
```

---

## Troubleshooting

### NCCL Timeouts

**Symptom:** Training hangs with timeout error.

**Solutions:**
```bash
# Increase timeout
export NCCL_BLOCKING_WAIT=1
export NCCL_TIMEOUT=1800  # 30 minutes

# Check network connectivity
iperf3 -c <other_node_ip>

# Use different transport
export NCCL_SOCKET_IFNAME=eth0
```

### Uneven GPU Utilization

**Symptom:** Some GPUs show 0% utilization.

**Solutions:**
```python
# Check data loader
# Ensure it's properly sharded
from torch.utils.data.distributed import DistributedSampler

sampler = DistributedSampler(
    dataset,
    num_replicas=world_size,
    rank=rank,
    shuffle=True,
)

dataloader = DataLoader(
    dataset,
    batch_size=32,
    sampler=sampler,
    num_workers=4,
    pin_memory=True,
)
```

### Checkpoint Loading Issues

**Symptom:** Error loading checkpoint on multiple GPUs.

**Solution:**
```python
# Load on CPU first, then map to device
checkpoint = torch.load(
    "checkpoint.pth",
    map_location="cpu",  # Load to CPU
)

# Then move to device
model.load_state_dict(checkpoint["model_state_dict"])
model = model.cuda()

# Sync all processes
dist.barrier()
```

### Debugging Tips

**Enable NCCL debugging:**
```bash
export NCCL_DEBUG=INFO  # or WARN, ERROR
```

**Check process group:**
```python
import torch.distributed as dist

print(f"Rank: {dist.get_rank()}")
print(f"World size: {dist.get_world_size()}")
print(f"Initialized: {dist.is_initialized()}")
```

**Profile communication:**
```python
with torch.profiler.profile(
    activities=[
        torch.profiler.ProfilerActivity.CPU,
        torch.profiler.ProfilerActivity.CUDA,
    ],
    record_shapes=True,
    profile_memory=True,
) as prof:
    # Training step
    loss = trainer.training_step(batch)

print(prof.key_averages().table(sort_by="cuda_time_total"))
```

### Common Error Messages

| Error | Cause | Solution |
|-------|-------|----------|
| `Address already in use` | Port conflict | Change `MASTER_PORT` |
| `RuntimeError: CUDA out of memory` | Batch too large | Reduce batch size per GPU |
| `NCCL error: invalid usage` | Wrong backend | Use `nccl` for GPU training |
| `Mismatch in world size` | Config mismatch | Ensure all nodes have same config |
| `RuntimeError: Expected to have finished reduction` | Gradient mismatch | Check `find_unused_parameters=True` |

---

## Additional Resources

- [PyTorch DDP Documentation](https://pytorch.org/docs/stable/ddp.html)
- [NCCL Documentation](https://docs.nvidia.com/deeplearning/nccl/user-guide/docs/index.html)
- [PyTorch Elastic Training](https://pytorch.org/docs/stable/elastic.html)
