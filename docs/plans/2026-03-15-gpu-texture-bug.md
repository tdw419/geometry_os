# GPU Texture Store Bug - Intel Vulkan

## Summary

The compute shader's `textureStore` operation fails for certain texture coordinates on Intel Graphics (ARL) with Vulkan backend.

## Symptoms

- Addresses 0-9: textureStore works ✓
- Addresses 10-4095: textureStore fails ✗
- Addresses >= 4096: textureStore works ✓
- CPU-side writes (queue.write_texture): always work ✓

## Pattern Analysis

The failure pattern correlates with Hilbert curve coordinates:
- Addresses 0-9 map to positions with x,y in range [0,3]
- Address 10 maps to (3,3) - first failure
- Addresses >= 4096 map to positions with larger coordinates but work

## Workaround

Use addresses >= 4096 (0x1000) for data storage in glyph programs:

```glyph
// Use high addresses for data
LDI r1, 0x1000    // Address 4096 (works)
LDI r2, 0xDEADBEEF
STORE r1, r2      // This works
```

## Technical Details

- GPU: Intel(R) Graphics (ARL)
- Backend: Vulkan
- Max texture dimension: 8192
- Texture format: Rgba8Uint
- Texture size: 4096x4096

## Root Cause (Suspected)

Driver-specific bug with storage texture writes for certain pixel coordinates. The issue may be related to:
- Texture memory tiling
- Cache line boundaries
- Driver optimization for small texture regions

## Status

- Workaround implemented: use addresses >= 0x1000
- Needs investigation: test on other GPUs (NVIDIA, AMD)
- May need: explicit texture barriers or different texture format
