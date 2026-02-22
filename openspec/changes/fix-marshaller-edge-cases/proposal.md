# Fix Marshaller Edge Cases

## Summary

Fix 2 failing test cases in syscall_marshaller.py to complete Phase 2.1

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

The tests have bugs - they expect incorrect error codes. The marshaller implementation is correct.

## Tech Stack

Python, pytest, existing WasiError enum

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-10-fix-marshaller-edge-cases.md`
