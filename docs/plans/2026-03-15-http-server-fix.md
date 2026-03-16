# HTTP Server Threading Fix

## Problem

The HTTP server (`listener.incoming()`) blocks the main thread, preventing the GPU scheduler from running concurrently.

## Solution

Spawn the HTTP server in a separate thread so allow both:
the GPU scheduler and HTTP handler to run in parallel.

## Implementation

In `gpu_dev_daemon.rs`, wrap the HTTP server setup in `std::thread::spawn`:

## Files to Modify

- `systems/infinite_map_rs/src/bin/gpu_dev_daemon.rs`

## Code Changes

1. Move listener creation before main loop
2. Spawn thread for HTTP server
3. Add shutdown flag coordination

## Acceptance Criteria

- [ ] HTTP server responds to curl http://127.0.0.1:8769/status
- [ ] GPU scheduler continues running (frames increment)
- [ ] Clean shutdown on both threads
