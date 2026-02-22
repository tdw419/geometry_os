# Proposal: Upgrade Tectonic Bridge

## Context
The "Operation Tectonic" report outlines a high-frequency, wait-free IPC bridge between the AI Daemon and the Visual Shell. The current implementation of `AntigravityWatcher` is a naive polling mechanism that does not meet the "Observer" component specifications (blocking I/O, no `notify` crate).

## Goal
To upgrade the `AntigravityWatcher` and `Renderer` components to match the "Tectonic Memory Mapping Report" specifications, ensuring robust, low-latency, and architecturally sound synchronization.

## Impact
- **Visual Shell**: Will use `notify` crate for event-driven updates.
- **Performance**: Reduced CPU usage (no polling), lower latency (immediate reaction), no main-thread blocking (spawn_blocking).
- **Architecture**: Formalizes the "Tectonic Bridge" as a spec requirement.

## Logic
1. Replace polling `check_and_load` with `notify::Watcher` channel receiver.
2. Implement Debouncing inside the watcher loop.
3. Offload file reading to `tokio::task::spawn_blocking` to avoid stalling the render loop.
