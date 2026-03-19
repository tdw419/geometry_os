# WASM Integration - Final Test Summary

## Current Status

### Fix Applied
✅ Commented out `sync_gpu_to_shadow()` in daemon main loop
✅ Daemon rebuilt and restarted successfully
✅ Verified sync is disabled (no "[SYNC]" messages in logs)

### Test Results

### Test 1: Single Write Persistence
```
Write to 0x40000: 0xABCDEF01
Immediate read: 0xABCDEF01 ✓
After 1s: 0x00000000 ✗
After 4s: 0x00000000 ✗
```

### Test 2: VM Clearing Investigation
```
Write to 0x60000: 0xAA111111 ✓
Write to 0x70000: 0xBB222222 ✓
Write to 0x80000: 0xCC333333 ✓

Immediate verification: ALL CORRECT ✓
After 3s (VM 0 paused): ALL ZERO ✗
```

### Test 3: Direct Memory Test
```
Write to 0x90000: 0xDEADBEEF
Immediate read from shadow: 0xDEADBEEF ✓
Log shows: shadow_offset=589824, pixel(512, 768) = 0xDEADBEEF ✓

Subsequent reads: 0x00000000 ✗
```

## Root Cause Analysis

### Observation
Writes to substrate work **immediately** and correctly update shadow RAM, but are **cleared after ~1 second** regardless of whether sync_gpu_to_shadow() is disabled.

### Hypothesis
The issue is NOT `sync_gpu_to_shadow()` overwriting writes. Instead, the issue is:
- **Shader execution** is clearing substrate memory during frame execution
- **VM memory operations** (STORE instructions) are writing zeros to these addresses
- **Memory initialization** in shader is clearing regions

### Evidence
1. Frames are completing regularly (Frame 4980, 5040, 5100, etc.)
2. POKE writes correctly to shadow RAM at correct offsets
3. Immediate READ sees the written values
4. Subsequent READ sees zeros after frame execution

### Why VM 0 Might Be Clearing Memory
VM 0 (scheduler.glyph) has PC = 0x50545448 which looks like valid execution.
If VM 0 is running scheduler code that performs STORE operations to substrate,
it could be overwriting our test addresses.

## Solutions

### Option 1: Write to Protected Memory Region
Find a memory region that VMs don't touch (very high addresses)
- Try addresses near the end of 64MB (e.g., 0x03F00000 - 0x03FFFFF)
- These should be safe from VM activity
- **Pros**: Quick test, no code changes
- **Cons**: May not work if VMs clear all memory

### Option 2: Halt All VMs Temporarily
Use `/pause` endpoint to stop all VM execution
- Clear substrate, write WASM, resume
- Prevents VMs from overwriting our writes
- **Pros**: Guarantees writes won't be disturbed
- **Cons**: Breaks normal operation

### Option 3: Use Batch Write Instead of Individual Pokes
Use `poke_substrate_batch()` or `/write` POST endpoint
- May bypass the frame execution timing issue
- **Pros**: More efficient, may have different code path
- **Cons**: May have same underlying issue

### Option 4: Document and Move On
This substrate write issue is a deeper problem
- Document findings for future investigation
- Move to ASCII Workspace Micro-Host implementation
- Come back to WASM after substrate issues are resolved
- **Pros**: Unblocks other project work
- **Cons**: Delays WASM integration

## Recommendation
Proceed with **Option 1** - try writing to protected memory region near the end of the address space (0x03F00000+). This region should be safe from normal VM operations.

