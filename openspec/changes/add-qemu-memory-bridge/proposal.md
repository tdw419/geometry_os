# QEMU Shared Memory Bridge (Phase 36)

## Motivation
To achieve "Infinite Map" visualization of live VM states, we need a high-throughput, low-latency mechanism to introspect guest RAM. Traditional socket-based or copy-heavy approaches are too slow for real-time (60Hz) visualization. This proposal introduces a zero-copy shared memory bridge using `/dev/shm` and `memory-backend-file`.

## Technical Summary
*   **Mechanism**: `memory-backend-file` in QEMU mapped to `/dev/shm` on the host.
*   **Access**: Zero-copy `mmap` via Rust `memmap2` crate in the host visualization engine.
*   **Orchestration**: QMP (QEMU Machine Protocol) for lifecycle management and dynamic discovery.
*   **Constraint**: Read-only access from host to guest memory to prevent corruption.

## Impact Analysis
*   **Visual**: Enables real-time pixel-perfect representation of guest RAM.
*   **Performance**: Targeting <1ms latency for 64MB snapshots.
*   **Security**: Requires strict permission management on `/dev/shm` files.

## Risks
*   **Torn Reads**: Guest modifying memory while host reads. Addressed via atomic checksums/dirty page tracking.
*   **Process Isolation**: Host crash should not kill VM.
