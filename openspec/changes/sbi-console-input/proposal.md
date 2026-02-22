# Sbi Console Input

## Summary

Wire browser keyboard events through WGPUInputHandler to SBIHandler.queueInput(), enabling Linux kernel to read console input via SBI console_getchar.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

Add an `onCharacter` callback to WGPUInputHandler that fires when printable keys are pressed. The hypervisor subscribes to this callback and forwards characters to SBIHandler.queueInput(). Kernel polls SBI and receives characters.

## Tech Stack

JavaScript ES Modules, WebGPU, SBI (Supervisor Binary Interface)

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-18-sbi-console-input.md`
