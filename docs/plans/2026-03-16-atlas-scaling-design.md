# Atlas Scaling Design

> Date: 2026-03-16
> Goal: Future-proof PixelBrain atlas by increasing default size from 2048² to 4096²

## Summary

Scale the WeightAtlas default from 2048×2048 (4M weights, ~8MB) to 4096×4096 (16M weights, ~32MB) with runtime configurability via CLI flag.

## Approach

**Configurable Size** - Make atlas size a runtime parameter with 4096 as new default.

- `WeightAtlas::new(size)` already supports any power-of-2
- Add `--brain-size` CLI flag to `gpu_dev_daemon`
- Dynamic shadow buffer allocation
- GPU texture dimension validation at startup

## Changes

### 1. API Changes (gpu_dev_daemon.rs)

```rust
const DEFAULT_BRAIN_SIZE: u32 = 4096;

// CLI flag:
// --brain-size <size>  Texture dimension (default: 4096, must be power of 2)
```

### 2. Shadow Buffer

```rust
static BRAIN_SIZE: OnceLock<u32> = OnceLock::new();
static BRAIN_SHADOW: OnceLock<Mutex<Vec<f32>>> = OnceLock::new();

fn init_brain(size: u32) {
    BRAIN_SIZE.set(size).ok();
    BRAIN_SHADOW.get_or_init(|| Mutex::new(vec![0.0; (size * size) as usize]));
}
```

### 3. GPU Texture Creation

Replace hardcoded `2048` with dynamic size:

```rust
let size = *BRAIN_SIZE.get().unwrap();
// texture desc uses size instead of 2048
width: size,
height: size,
bytes_per_row: Some(size * 4),
```

### 4. Error Handling

- Validate `size <= limits.max_texture_dimension_2d` at startup
- Fail fast with clear error if GPU can't handle requested size

## Testing

- Update existing tests for configurable sizes
- Add test for CLI flag parsing
- Verify 4096 works on target hardware

## Backward Compatibility

Existing 2048×2048 brain PNGs still load - just use `--brain-size 2048` flag.
