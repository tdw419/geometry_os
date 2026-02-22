# Webmcp Neural Kernel Tools

## Summary

Add WebMCP tools that enable AI agents to manage the unified neural kernel interface - register, swap, monitor, and control kernels at runtime.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

Extend WebMCPBridge with 5 new tools that expose the Python KernelRegistry and kernel instances to the browser via a bridge layer. Tools follow the existing pattern (name, description, inputSchema, handler) and integrate with the existing tool tracking system.

## Tech Stack

JavaScript (WebMCP), Python (KernelRegistry), JSON-RPC bridge

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-14-webmcp-neural-kernel-tools.md`
