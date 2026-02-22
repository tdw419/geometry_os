# Codebase Context Search

## Summary

Enable the LLM autocomplete system to search and include relevant code files as context when generating responses.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

Extend the existing research context pattern to index and search code files (`.py`, `.rs`, `.js`, `.ts`, `.wgsl`). Uses simple keyword matching for relevance scoring, mirroring `get_research_context()`.

## Tech Stack

Python 3, pathlib, dataclasses, pytest

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-06-codebase-context-search.md`
