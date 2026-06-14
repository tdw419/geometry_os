---
name: codegraph
description: Codebase indexing, understanding, and MCP tool exploration using tree-sitter. Use for symbol search, call tracing, impact analysis, and context building in large codebases.
---

# CodeGraph

CodeGraph pre-indexes codebases into a SQLite knowledge graph using tree-sitter parsing. Exposes MCP tools for instant code understanding — no grep/read loops needed.

## Usage

Use this skill when you need:
- Fast symbol searches (`codegraph_search`).
- Context generation for complex tasks (`codegraph_context`).
- Call tracing (`codegraph_trace`, `codegraph_callers`, `codegraph_callees`).
- Impact analysis (`codegraph_impact`).

## MCP Tools

| Tool | Purpose |
|------|---------|
| `codegraph_search` | Find symbols by name |
| `codegraph_context` | Build relevant context for a task (entry points + related symbols + source) |
| `codegraph_trace` | Trace call path between two symbols (follows dynamic dispatch) |
| `codegraph_callers` | Find what calls a function |
| `codegraph_callees` | Find what a function calls |
| `codegraph_impact` | Analyze what's affected by changing a symbol |
| `codegraph_node` | Get a single symbol's source/signature |
| `codegraph_explore` | Multiple related symbols + relationship map in one call |
| `codegraph_files` | Indexed file structure (faster than filesystem scan) |
| `codegraph_status` | Index health and statistics |

## Configuration

Ensure the following is in your Hermes MCP config:

```yaml
mcp_servers:
  codegraph:
    command: codegraph
    args:
      - serve
      - --mcp
    timeout: 120
    connect_timeout: 60
    enabled: true
```

## CLI Reference

- `codegraph query <search>`: Search symbols.
- `codegraph context <task>`: Build context for AI.
- `codegraph status [path]`: Show statistics.
- `codegraph sync [path]`: Incremental update.

See [codegraph-hermes.md](./references/codegraph-hermes.md) for full benchmarks and details.
