# Proposal: Integration of RTS FUSE Driver into Evolution Daemon V8

## Context
Phase 2 of the RTS FUSE project is complete, delivering a high-performance Rust-based driver (`rts_rs`). The Evolution Daemon V8 currently relies on legacy `PixelRTS` (Python) for filesystem interaction detection on the `geometry_os.rts` substrate.

## Objective
Update `EvolutionDaemonV8` to:
1. Detect the availability of the crystallized `rts_rs` driver.
2. Provide a new capability to mount the "Brain" (filesystem) using the high-performance driver.
3. Align the daemon with the "Crystallized Substrate" status.

## Why?
- **Performance**: The Rust driver determines filesystem state 10-100x faster than Python.
- **Coherence**: The Central Supervisor (Daemon) must recognize the most advanced IO substrate available.
- **Future-Proofing**: Prepares the daemon to perform "Brain Surgery" (Filesystem writes) via the mount point rather than raw pixel manipulation in future updates.

## Scope
- Modify `evolution_daemon_v8.py`.
- Add `RTSDriverIntegration` class (or methods).
- Add logging for driver detection.
