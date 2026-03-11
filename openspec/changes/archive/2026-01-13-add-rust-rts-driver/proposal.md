# Proposal: Add Rust RTS FUSE Driver

## Context
The RTS (Raw Tensor Substrate) FUSE driver currently exists as a Python prototype (`rts_fs.py`). While functional, it serves as a proof-of-concept. For Geometry OS to use RTS as a daily driver (Phase 2: Crystallization), we require near-native filesystem performance.

## Objective
Create a production-grade FUSE driver in Rust using the `fuser` crate.

## Why Rust?
- **Performance**: Rust offers 10-100x speed improvement over Python for syscall-heavy FUSE operations.
- **Safety**: Memory safety guarantees are critical for a filesystem driver.
- **Concurrency**: Rust's async/threading model handles multiple filesystem requests efficiently.

## Scope
- New Rust project: `systems/rts_fuse/rts_rs`
- Port `RTSFilesystem` logic from Python to Rust.
- Port `HilbertEngine` logic to Rust.
- Support Read/Write/Create/Readdir/Getattr.
- Support `.rts` (PNG) backing store.

## Impact
- **Architecture**: Moves filesystem logic from "Prototype" layer to "System" layer.
- **Visual**: No direct visual change, but faster loading of visual assets.
- **Performance**: Significant reduction in boot time and IO latency for guest Linux.
