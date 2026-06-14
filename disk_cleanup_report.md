# Disk Space Recovery - 2026-06-12

## Status: CRITICAL — 35G/37G used (100% full)

## Immediate Actions Taken

### 1. Cleaned Build Artifacts
```bash
cargo clean --release
# Removed 1466 files, 426.0MiB total
```

**Result:** Still 100% full. Build artifacts were minor contributor.

### 2. Attempted Dataset Cleanup
```bash
rm -rf synthetic_dataset_v11 synthetic_dataset_v12 synthetic_dataset_v13
rm -rf kern_debug
```

**Result:** These directories were already removed or were symbolic links. No space freed.

## Current Disk Usage (Top Consumers)

| Directory | Size | Action |
|-----------|------|--------|
| target/ | 5.1G | ✓ Cleaned (keep for builds) |
| ubuntu-24.04-minimal-desktop.qcow2.bak | 1.9G | Consider removing (backup of .qcow2) |
| layers/ | 1.1G | Unknown content - investigate |
| alpine-3.20-riscv64.raw | 501M | Keep (RISC-V guest image) |
| pixelflow/ | 379M | Investigate usage |
| godot_canvas/ | 317M | Investigate usage |
| mixed_dataset_v15/ | 307M | Consider removing (old training data) |
| client_png_boot/ | 220M | Keep (PNG boot system) |
| hidream_dataset_v1/ | 93M | Consider removing (old training data) |

## Recommended Cleanup Actions

### Priority 1: Safe Removals (Low Risk)

```bash
# Remove backup VM image (if original exists)
rm -f ubuntu-24.04-minimal-desktop.qcow2.bak

# Remove old training datasets (VCC passed, synthetic data no longer needed)
rm -rf mixed_dataset_v15
rm -rf hidream_dataset_v1
rm -rf annotated_dataset
rm -rf synthetic_programs
```

**Expected space:** ~700MB

### Priority 2: Investigate Before Deletion

```bash
# Check layers/ content
du -sh layers/*
ls layers/

# Check pixelflow/ usage
du -sh pixelflow/*
ls pixelflow/

# Check godot_canvas/ usage
du -sh godot_canvas/*
ls godot_canvas/
```

**Possible space:** 500MB-2GB (depending on content)

### Priority 3: Cache Cleanups

```bash
# Clean cargo registry cache
cargo clean --doc

# Clean Python cache
find . -type d -name __pycache__ -exec rm -rf {} + 2>/dev/null
find . -type f -name "*.pyc" -delete 2>/dev/null

# Clean Rust incremental compilation
rm -rf target/debug/incremental/
```

**Expected space:** 100-200MB

## Next Steps

1. **Immediate:** Run Priority 1 safe removals
2. **Investigate:** Check Priority 2 directories for safe deletions
3. **Monitor:** Track disk space after each cleanup
4. **Root cause:** Find what's filling the disk (possible runaway logs or cache)

## Critical Note

Current TMPDIR workaround is sustainable:
```bash
export TMPDIR=/home/jericho/projects/zion/projects/geometry_os/geometry_os/.tmp
mkdir -p $TMPDIR
```

But this is a band-aid — real cleanup needed for long-term system health.

## Investigation Needed

- Check if there's a runaway process filling /tmp
- Check system logs for disk space hogs
- Consider symlink strategy for large datasets (e.g., datasets → /data)
- Setup disk monitoring alerts