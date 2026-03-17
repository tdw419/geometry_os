---
name: ml-pool-brain-integration
description: ML Memory Pool integrated with brain bridge for unified PixelBrain operations
type: project
---

# ML Memory Pool - Brain Bridge Integration

**Why:** The ML Memory Pool provides structured tensor allocation while the brain bridge handles Hebbian learning. Tight integration enables efficient weight updates and unified access.

**How to apply:** Use the ML pool for tensor allocation, brain bridge for Hebbian updates. The integration layer bridges both systems.

## Architecture

```
MLMemoryPool (512MB)          BrainBridge
├── WeightPool ───────────────────┤
│   ├── Hebbian updates ─────────►│  apply_hebbian_update()
│   └── Weight atlas loading ────►│  load_from_png()
├── ActivationPool               │
│   └── KV cache                  │
└── GradientPool                 │
                                 │
Integration Layer:               │
ml_pool_write_f16_weights() ────►│  write_texture()
ml_pool_read_f16_weights() <─────│  read_texture()
```

## Files Modified

- `gpu_dev_daemon.rs` - Added brain shadow buffer, dynamic sizing, RAM visualization
- `ml_memory/pool.rs` - Added brain bridge integration methods

## Integration Methods (pool.rs)

```rust
// Convert Hilbert distance to GPU offset
pub fn hilbert_to_gpu_offset(d: u64, texture_size: u32) -> u64

// Convert GPU offset to Hilbert distance
pub fn gpu_offset_to_hilbert(offset: u64, texture_size: u32) -> u64

// Float16 weight I/O
pub fn write_f16_weights(&self, id: TensorId, weights: &[f32]) -> MLResult<()>
pub fn read_f16_weights(&self, id: TensorId) -> MLResult<Vec<f32>>
```

## HTTP Endpoints

| Endpoint | Method | Purpose |
|----------|--------|---------|
| `/ml/status` | GET | Pool statistics |
| `/ml/alloc` | POST | Allocate tensor |
| `/ml/free` | POST | Free tensor |
| `/ml/tensor?name=X` | GET/PUT | Read/write tensor |
| `/ml/weights/load` | POST | Load PNG atlas |
| `/ml/hebbian` | POST | Apply Hebbian batch |
| `/ml/sync` | POST | CPU↔GPU sync |
| `/ml/activation/layer` | POST | Allocate layer activation |
| `/ml/kv/append` | POST | Append to KV cache |
| `/ml/visualize` | GET | PNG memory visualization |
| `/ml/visualize/ascii` | GET | ASCII art memory visualization |

## RAM-as-Bitmap Visualization

Based on research document "Architectural Paradigms of Tensor-Native Systems":

- **Visual debugging**: Memory state rendered as PNG or ASCII
- **Color coding**: Free (dark blue), Allocated (teal), Fragmented (red), Hilbert-aligned (cyan)
- **Pool selection**: `?pool=weight`, `?pool=activation`, `?pool=gradient`
- **Custom size**: `?width=256` (64-1024)

```
╔══════════════════════════════════════════════════════════════╗
║              ML MEMORY POOL - RAM VISUALIZATION              ║
╠══════════════════════════════════════════════════════════════╣
║  Legend: ░ Free  █ Allocated  ▒ Fragmented  ▓ Hilbert       ║
╚══════════════════════════════════════════════════════════════╝

┌────────────────────────────────────────────────────────────┐
│████████░░████████▒▒▓▓████░░░░████████████▒▒░░░░██████████│
│░░████░░██████████████▒▒████░░░░░░████████▓▓████░░░░████░░│
│████▓▓████░░░░████████████░░████░░██████████████▒▒████████│
└────────────────────────────────────────────────────────────┘
```

## Test Coverage

- 48 ML memory unit tests passing
- 10 visualization tests passing
- Block allocator tests: allocation, coalescing, fragmentation
- Ring buffer tests: allocation, wrap-around, oldest eviction
- Hebbian batch tests: creation, application
- Zero-copy staging tests: alignment, chunking
- PNG generation tests: signature validation, chunk building

## Implementation Date

2026-03-16

## Status

✅ Complete - All tests passing, daemon builds successfully
