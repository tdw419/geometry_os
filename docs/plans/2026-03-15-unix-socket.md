# Unix Socket Support for GPU Daemon MCP API

## Overview
Add Unix socket support to `gpu_dev_daemon` for faster IPC ( avoid HTTP overhead.

## Current State
- HTTP working ✅
- Unix socket added to `gpu_dev_daemon.rs`
- MCP tools use Unix sockets first
- Fallback to HTTP if needed

## Implementation

1. Update `gpu_dev_daemon.rs` to add Unix socket support
2. Update `geos_mcp_server.py` to use Unix socket client
3. Update docs/plans/2026-03-15-gpu-daemon-mcp-api-design.md
