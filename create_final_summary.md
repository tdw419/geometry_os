# WASM Integration - Final Analysis

## Problem Identification

### Issue
Write operations to substrate persist **immediately** but are **lost after 1 second**.

### Root Cause
The `sync_gpu_to_shadow()` function (called every 4 frames) copies GPU texture data back to shadow buffer, **overwriting** manually written data.

### Evidence
```
Write to 0x40000: 0xABCDEF01
Immediate read: 0xABCDEF01 ✓
After 1 second: 0x00000000 ✗ (lost!)
After 4 seconds: 0x00000000 ✗ (still lost)
```

### Why This Happens
1. HTTP `/poke` endpoint calls `write_u32_to_substrate()` 
2. This writes to GPU texture AND updates shadow buffer
3. Main loop calls `sync_gpu_to_shadow()` every 4 frames
4. `sync_gpu_to_shadow()` copies GPU texture → shadow buffer
5. GPU texture still has old data (write not processed?)
6. Shadow buffer is overwritten with old data

## Current State

### What Works
- ✅ Basic write/read operations succeed immediately
- ✅ `queue.submit(None)` and `device.poll()` are in daemon code
- ✅ Frame loop is running (every ~1 second)
- ✅ Trap interface operational
- ✅ VM spawning/resume endpoints work

### What Doesn't Work
- ❌ Writes don't persist across frame syncs
- ❌ WASM interpreter can't be loaded reliably
- ❌ Any substrate write is temporary

## Solutions

### Option 1: Disable Sync During Testing
Comment out `sync_gpu_to_shadow()` call in main loop
- **Pros**: Allows testing WASM integration
- **Cons**: Breaks production functionality; changes must be reverted

### Option 2: Fix Sync Logic
Modify `sync_gpu_to_shadow()` to skip regions recently written
- Keep track of "dirty" regions in a bitmap
- Don't sync dirty regions back from GPU
- **Pros**: Proper fix
- **Cons**: Complex implementation

### Option 3: Use Different Memory Region
Use memory not affected by sync (if any exists)
- Try very high addresses (near end of 64MB)
- Test if sync affects entire memory or just regions
- **Pros**: Quick workaround
- **Cons**: May not work; underlying issue remains

### Option 4: Skip WASM Integration
Focus on ASCII Workspace Micro-Host instead
- Document substrate sync issue for future
- Make progress on other project goals
- **Pros**: Unblocks other work
- **Cons**: Delays WASM integration

## Recommendation
Proceed with **Option 1** - temporarily disable `sync_gpu_to_shadow()` for WASM testing. This allows verifying WASM interpreter logic while the underlying sync issue is investigated separately.

