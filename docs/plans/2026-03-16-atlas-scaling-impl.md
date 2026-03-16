# Atlas Scaling Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Make PixelBrain atlas size configurable with 4096×4096 as new default.

**Architecture:** Add CLI flag `--brain-size` to gpu_dev_daemon, convert hardcoded constants to runtime parameters, validate against GPU limits at startup.

**Tech Stack:** Rust, clap (CLI parsing), wgpu (GPU limits)

---

### Task 1: Add CLI Flag for Brain Size

**Files:**
- Modify: `systems/infinite_map_rs/src/bin/gpu_dev_daemon.rs`

**Step 1: Add constant and CLI argument**

Find the existing argument parsing (around line 620-650) and add:

```rust
// Near top of file with other constants
const DEFAULT_BRAIN_SIZE: u32 = 4096;

// In argument parsing section
let brain_size = args.iter().position(|a| a == "--brain-size")
    .and_then(|i| args.get(i + 1).and_then(|s| s.parse::<u32>().ok()))
    .unwrap_or(DEFAULT_BRAIN_SIZE);

// Validate power of 2
assert!(brain_size.is_power_of_two(), "brain-size must be power of 2");
```

**Step 2: Run daemon help to verify flag parsing**

Run: `cargo run --bin gpu_dev_daemon -- --help 2>&1 | head -20`
Expected: Runs without panic (flag parsing works)

**Step 3: Commit**

```bash
git add systems/infinite_map_rs/src/bin/gpu_dev_daemon.rs
git commit -m "feat(gpu_daemon): add --brain-size CLI flag with 4096 default"
```

---

### Task 2: Add Dynamic Brain Size Static

**Files:**
- Modify: `systems/infinite_map_rs/src/bin/gpu_dev_daemon.rs`

**Step 1: Add static storage for brain size**

Near line 348-355 where `BRAIN_SHADOW` is defined:

```rust
/// Brain atlas size (set at initialization)
static BRAIN_SIZE: OnceLock<u32> = OnceLock::new();

/// Get the configured brain size
fn get_brain_size() -> u32 {
    *BRAIN_SIZE.get().unwrap_or(&DEFAULT_BRAIN_SIZE)
}

/// Brain shadow buffer (CPU-side mirror of GPU texture)
static BRAIN_SHADOW: OnceLock<Mutex<Vec<f32>>> = OnceLock::new();

/// Get or initialize the brain shadow buffer
fn get_brain_shadow() -> &'static Mutex<Vec<f32>> {
    BRAIN_SHADOW.get_or_init(|| {
        let size = get_brain_size();
        Mutex::new(vec![0.0; (size * size) as usize])
    })
}
```

**Step 2: Remove old constant**

Delete: `const BRAIN_ATLAS_SIZE: usize = 2048 * 2048;`

Update `get_brain_shadow()` call site to use the new function.

**Step 3: Build to verify compilation**

Run: `cargo build --bin gpu_dev_daemon 2>&1 | tail -20`
Expected: Compiles with only warnings (no errors)

**Step 4: Commit**

```bash
git add systems/infinite_map_rs/src/bin/gpu_dev_daemon.rs
git commit -m "refactor(gpu_daemon): make brain shadow buffer size dynamic"
```

---

### Task 3: Add GPU Texture Validation

**Files:**
- Modify: `systems/infinite_map_rs/src/bin/gpu_dev_daemon.rs`

**Step 1: Add validation after GPU device creation**

After device creation (around line 640), add validation:

```rust
// Validate brain size against GPU limits
let max_texture_size = device.limits().max_texture_dimension_2d;
if brain_size > max_texture_size {
    panic!(
        "Requested brain size {} exceeds GPU max texture dimension {}",
        brain_size, max_texture_size
    );
}
println!("[BRAIN] Atlas size: {}x{} (max supported: {})",
    brain_size, brain_size, max_texture_size);
```

**Step 2: Initialize BRAIN_SIZE static**

Add after validation:

```rust
BRAIN_SIZE.set(brain_size).expect("brain size already set");
```

**Step 3: Build to verify**

Run: `cargo build --bin gpu_dev_daemon 2>&1 | tail -10`
Expected: Compiles successfully

**Step 4: Commit**

```bash
git add systems/infinite_map_rs/src/bin/gpu_dev_daemon.rs
git commit -m "feat(gpu_daemon): validate brain size against GPU limits"
```

---

### Task 4: Update GPU Texture Creation

**Files:**
- Modify: `systems/infinite_map_rs/src/bin/gpu_dev_daemon.rs`

**Step 1: Replace hardcoded 2048 with dynamic size**

In the brain texture creation section (around lines 693-734), replace:

```rust
// OLD:
width: 2048,
height: 2048,
bytes_per_row: Some(2048 * 4),
rows_per_image: Some(2048),
width: 2048,
height: 2048,

// NEW:
let size = get_brain_size();
width: size,
height: size,
bytes_per_row: Some(size * 4),
rows_per_image: Some(size),
width: size,
height: size,
```

**Step 2: Update shadow buffer initialization message**

```rust
// OLD:
println!("[BRAIN] Shadow buffer initialized with {} weights", weight_count.min(BRAIN_ATLAS_SIZE));

// NEW:
println!("[BRAIN] Shadow buffer initialized with {} weights", weight_count.min((size * size) as usize));
```

**Step 3: Build and verify**

Run: `cargo build --bin gpu_dev_daemon 2>&1 | tail -10`
Expected: Compiles successfully

**Step 4: Commit**

```bash
git add systems/infinite_map_rs/src/bin/gpu_dev_daemon.rs
git commit -m "refactor(gpu_daemon): use dynamic size for brain texture creation"
```

---

### Task 5: Update Integration Tests

**Files:**
- Modify: `systems/infinite_map_rs/tests/pixel_brain_integration.rs`

**Step 1: Update test to use configurable atlas size**

```rust
#[test]
fn test_hilbert_addressing_consistency() {
    use infinite_map_rs::pixel_brain::WeightAtlas;

    // Test both 2048 and 4096 sizes
    for size in [2048u32, 4096] {
        let atlas = WeightAtlas::new(size);
        let max_d = (size * size - 1) as u64;

        // Test round-trip for various addresses
        for d in [0u64, 1, 100, 0xFFFF, max_d / 2, max_d] {
            let (x, y) = atlas.hilbert_d2xy(d);
            let recovered = atlas.hilbert_xy2d(x, y);
            assert_eq!(
                d, recovered,
                "Hilbert round-trip failed at size {}: d={} -> ({},{}) -> {}",
                size, d, x, y, recovered
            );
        }
    }
}
```

**Step 2: Run tests**

Run: `cargo test --package infinite_map_rs --test pixel_brain_integration -- --nocapture`
Expected: All tests pass

**Step 3: Commit**

```bash
git add systems/infinite_map_rs/tests/pixel_brain_integration.rs
git commit -m "test(pixel_brain): verify Hilbert addressing at 2048 and 4096 sizes"
```

---

### Task 6: Final Verification

**Step 1: Run all pixel_brain tests**

Run: `cargo test --package infinite_map_rs pixel_brain -- --nocapture`
Expected: All 4 unit tests + 2 integration tests pass

**Step 2: Verify daemon starts with default size**

Run: `timeout 3 cargo run --bin gpu_dev_daemon 2>&1 | grep -E "\[BRAIN\]|error"`
Expected: Shows "[BRAIN] Atlas size: 4096x4096" or GPU limit message

**Step 3: Verify daemon accepts custom size**

Run: `timeout 3 cargo run --bin gpu_dev_daemon -- --brain-size 2048 2>&1 | grep -E "\[BRAIN\]"`
Expected: Shows "[BRAIN] Atlas size: 2048x2048"

**Step 4: Final commit (if any fixes needed)**

```bash
git status
# If clean, no commit needed
```

---

## Summary

| Task | Description | Commits |
|------|-------------|---------|
| 1 | CLI flag for brain size | 1 |
| 2 | Dynamic shadow buffer | 1 |
| 3 | GPU limit validation | 1 |
| 4 | GPU texture creation | 1 |
| 5 | Test updates | 1 |
| 6 | Verification | 0-1 |

**Total: 5-6 commits**
