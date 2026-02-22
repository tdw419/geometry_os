# Vision Cortex Implementation

## Summary

Enable AI agents to read GUI text via structured WebMCP tool calls using client-side Tesseract.js OCR.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

VisionCortex module encapsulates Tesseract.js WASM OCR with region-based caching. Three WebMCP tools (hypervisor_read_text, hypervisor_find_element, hypervisor_frame) expose OCR capabilities to AI agents through the existing webmcp_bridge.js infrastructure.

## Tech Stack

JavaScript ES6+, Tesseract.js 5.x (WASM), Web Workers, Canvas API

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-13-vision-cortex-implementation.md`
