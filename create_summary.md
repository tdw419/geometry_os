# WASM Integration - Current Status

## Issue Summary
The WASM integration is blocked by substrate write persistence issues:
- `poke_substrate_single()` writes to GPU texture but doesn't submit queue
- `sync_gpu_to_shadow()` overwrites shadow RAM from GPU texture every 4 frames
- Result: writes persist briefly then are overwritten with GPU data (which may be stale)

## What Works
- Daemon boots successfully with 3 VMs (scheduler, HTTP handler, WASM interpreter)
- `/status` endpoint returns VM count
- `/vm_resume` endpoint responds correctly
- Trap interface is operational
- `write_glyph_to_substrate` writes to both GPU and shadow RAM

## What Doesn't Work
- VM 2 (WASM interpreter) shows INACTIVE state despite resume
- Code loaded at boot (0x1000) not visible via peek
- Poke writes don't persist across frame syncs

## Next Steps (Options)

### Option 1: Fix Poke Submission (Immediate)
Modify `poke_substrate_single()` to submit queue writes immediately
- Add `self.queue.submit(None)` after texture write
- Requires rebuild and restart
- **Pros**: Fixes root cause, enables all downstream features
- **Cons**: Requires code modification, needs testing

### Option 2: Use Synthetic VRAM (Alternative)
Test WASM integration using CPU-side emulator instead of GPU
- No GPU sync issues
- Fast iteration, easy debugging
- **Pros**: Can prove WASM interpreter logic works
- **Cons**: Doesn't test actual GPU execution

### Option 3: Different Loading Mechanism
Use `/write` endpoint (POST) instead of individual poke calls
- May batch writes and submit properly
- Need to test if endpoint works
- **Pros**: Uses existing infrastructure
- **Cons**: Might have same underlying issue

### Option 4: Restart with Correct Daemon Config
Build daemon with fix or find alternative boot mechanism
- Check if there's a debug build with better sync handling
- May need to review daemon compilation options

## Recommendation
Proceed with **Option 1** - fix the poke submission issue in the daemon code. This is the minimal fix that will unlock:
- Loading WASM binaries into substrate
- Executing WASM via VM 2
- All other substrate write operations

