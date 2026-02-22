# Synaptic Query Interface

## Summary

Add natural language search to the Neural City, enabling users to navigate the weight atlas by semantic intent (e.g., "Find attention heads for Rust code").

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

Query text → Embedding model → Vector search via Memory Daemon → Hilbert coordinates → Camera animation → Visual highlighting. The SynapticQueryEngine (Python) handles embedding and search, SynapticQueryUI (JS) provides browser interface, and NeuralCityRenderer handles navigation and highlighting.

## Tech Stack

WebSocket (VisualBridge port 8768), Memory Daemon (PostgreSQL + pgvector), OpenAI/text-embedding-ada-002 or local sentence-transformers, PIXI.js camera animation

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-19-synaptic-query-interface.md`
