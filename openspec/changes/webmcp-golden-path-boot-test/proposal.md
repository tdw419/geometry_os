# Webmcp Golden Path Boot Test

## Summary

Create an automated test that proves Linux boots on GPU shader by having an AI agent (via WebMCP) interact with the VM: boot Alpine Linux, type `uname -a`, and verify the output contains `riscv64`.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

Use existing WebMCP tools (`hypervisor_status`, `hypervisor_input`, `hypervisor_read_text`, `hypervisor_frame`) to create a test script that runs in the browser console. The test will: (1) wait for boot completion, (2) send keyboard input, (3) capture console output, (4) validate the response. This proves both the GPU-native RISC-V stack works AND the AI control surface is functional.

## Tech Stack

JavaScript ES modules, WebMCP Bridge, existing hypervisor infrastructure, PixiJS VMMonitorTile

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-18-webmcp-golden-path-boot-test.md`
