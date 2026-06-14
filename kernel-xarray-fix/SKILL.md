---
name: kernel-xarray-fix
description: Kernel boot fix for XArray NULL dereference during early boot. Use when rebuilding the kernel to prevent panic in xas_alloc before radix_tree_init.
---

# Kernel XArray Fix

This skill provides the fix for a latent kernel bug where `xas_alloc` (called by XArray) is invoked before `radix_tree_init` has initialized the required `radix_tree_node_cachep`.

## The Fix

Apply a `NULL` pointer check in `lib/xarray.c` to guard against premature allocation attempts.

### Patch Instructions

Apply the following change to `lib/xarray.c` in the kernel source tree:

```c
static void *xas_alloc(struct xa_state *xas, unsigned int shift)
{
    // Fix: Guard against NULL cache during early boot
    if (unlikely(radix_tree_node_cachep == NULL)) {
        panic("XArray: xas_alloc called before radix_tree_init
");
    }
    
    // ... original code
}

static inline void __xas_nomem(struct xa_state *xas, gfp_t gfp)
{
    // Fix: Guard against NULL cache during early boot
    if (unlikely(radix_tree_node_cachep == NULL)) {
        panic("XArray: __xas_nomem called before radix_tree_init
");
    }
    
    // ... original code
}
```

**Note:** Always apply this patch to the *source tree* before building, as the build artifacts in `.geometry_os/build/` are transient.
