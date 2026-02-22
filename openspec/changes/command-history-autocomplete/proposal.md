# Command History Autocomplete

## Summary

Add command history navigation (Up/Down arrows) and tab autocomplete to the Geometry OS terminal.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

Extend MapTerminal with a command_history list and history_index. Modify handle_key to intercept ArrowUp/ArrowDown for history navigation and Tab for autocomplete. Store commands on Enter.

## Tech Stack

Python asyncio, existing MapTerminal class

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-15-command-history-autocomplete.md`
