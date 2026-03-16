# ECC Integration for Geometry OS

Everything Claude Code (ECC) integration exposes 60+ commands, 65+ skills, 47 agents, and 34 rules as MCP tools for AI assistants.

## Overview

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                     GEOMETRY OS + ECC INTEGRATION                            │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│   AI Assistant ──▶ MCP Bridge ──▶ ECC Tools ──▶ Geometry OS Substrate       │
│                                                                              │
│   Available ECC MCP Tools:                                                   │
│   ┌──────────────────┬─────────────────────────────────────────────────┐    │
│   │ Tool             │ Purpose                                          │    │
│   ├──────────────────┼─────────────────────────────────────────────────┤    │
│   │ ecc_status       │ Get ECC integration status                       │    │
│   │ ecc_plan         │ Create implementation plan                       │    │
│   │ ecc_tdd          │ Execute TDD workflow                             │    │
│   │ ecc_review       │ Run code review                                  │    │
│   │ ecc_verify       │ Run verification loop (build, test, lint)        │    │
│   │ ecc_learn        │ Extract reusable patterns                        │    │
│   │ ecc_instincts    │ View learned instincts                           │    │
│   │ ecc_skill_create │ Generate new skill from patterns                 │    │
│   │ ecc_brainstorm   │ Run brainstorming session                        │    │
│   │ ecc_debug        │ Run systematic debugging                         │    │
│   │ ecc_architect    │ Get architectural guidance                       │    │
│   └──────────────────┴─────────────────────────────────────────────────┘    │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

## Quick Start

### Check ECC Status

```bash
# Via MCP
geos ecc_status

# Response:
{
  "status": "success",
  "commands_available": 117,
  "skills_available": 66,
  "agents_available": 46,
  "rules_available": 53,
  "memory_entries": 0,
  "instincts_count": 0
}
```

### Create Implementation Plan

```bash
geos ecc_plan --task "Implement quadtree allocator for spatial memory" --scope "systems/glyph_allocator"
```

### Run TDD Workflow

```bash
geos ecc_tdd --feature "Quadtree spatial allocation" --coverage_target 0.8
```

### Verify Build

```bash
geos ecc_verify --run_tests true --run_lint true --auto_fix false
```

### Extract Patterns

```bash
geos ecc_learn --session_only true
```

## MCP Tool Reference

### ecc_status

Get current ECC integration status.

**Input Schema:**
```json
{}
```

**Response:**
```json
{
  "status": "success",
  "commands_available": 117,
  "skills_available": 66,
  "agents_available": 46,
  "rules_available": 53,
  "memory_entries": 0,
  "instincts_count": 0
}
```

### ecc_plan

Create implementation plan using ECC planner agent.

**Input Schema:**
```json
{
  "task": "string (required)",
  "scope": "string (optional)"
}
```

**Response:**
```json
{
  "status": "success",
  "task": "...",
  "scope": "...",
  "plan": "...",
  "error": null
}
```

### ecc_tdd

Execute TDD workflow using ECC TDD skill.

**Input Schema:**
```json
{
  "feature": "string (required)",
  "test_first": "boolean (default: true)",
  "coverage_target": "number (default: 0.8)"
}
```

### ecc_review

Run code review using ECC code-reviewer agent.

**Input Schema:**
```json
{
  "files": ["string"] | null,
  "scope": "string | null",
  "strictness": "lenient | standard | strict"
}
```

### ecc_verify

Run verification loop using ECC verify skill.

**Input Schema:**
```json
{
  "run_tests": "boolean (default: true)",
  "run_lint": "boolean (default: true)",
  "run_build": "boolean (default: true)",
  "auto_fix": "boolean (default: false)"
}
```

### ecc_learn

Extract reusable patterns from session.

**Input Schema:**
```json
{
  "session_only": "boolean (default: true)"
}
```

### ecc_instincts

View learned instincts from ECC memory.

**Input Schema:**
```json
{}
```

### ecc_skill_create

Generate a new skill from patterns.

**Input Schema:**
```json
{
  "pattern_source": "string (required) - file path, 'git', or 'session'",
  "skill_name": "string (optional)"
}
```

### ecc_brainstorm

Run brainstorming session.

**Input Schema:**
```json
{
  "topic": "string (required)",
  "techniques": ["string"] | null
}
```

### ecc_debug

Run systematic debugging.

**Input Schema:**
```json
{
  "issue": "string (required)",
  "context": "string (optional)"
}
```

### ecc_architect

Get architectural guidance.

**Input Schema:**
```json
{
  "decision": "string (required)",
  "constraints": ["string"] | null
}
```

## Architecture

```
apps/mcp2cli/src/
├── geos_mcp_server.py   # Main MCP server with ECC tools
├── ecc_bridge.py        # ECC command execution bridge
└── ...

The ECC bridge:
1. Discovers ECC components (commands, skills, agents, rules)
2. Wraps ECC CLI commands as async functions
3. Provides structured input/output for MCP tools
4. Handles errors and timeouts gracefully
```

## Future Integration Phases

| Phase | Integration | Status |
|-------|-------------|--------|
| **1** | MCP Bridge → ECC Commands | ✅ Complete |
| **2** | Visual Shell → ECC Canvas | Planned |
| **3** | Swarm Guilds → ECC Agents | Planned |
| **4** | Glyph Programs → ECC Skills | Planned |
| **5** | GPU Daemon → ECC HTTP API | Planned |

## Testing

```bash
# Run ECC bridge tests
cd apps/mcp2cli
pytest tests/test_ecc_bridge.py -v

# Test ECC status directly
python src/ecc_bridge.py
```

## Troubleshooting

### "Claude CLI not found"

Ensure `claude` is in your PATH:
```bash
which claude
# Should output: /usr/local/bin/claude or similar
```

### "ECC Bridge not available"

Ensure `ecc_bridge.py` is in the same directory as `geos_mcp_server.py`.

### Commands timeout

Some ECC commands (plan, verify) may take longer. The default timeout is 120-300 seconds. Adjust in `ecc_bridge.py` if needed.

## See Also

- [MCP2CLI Guide](./MCP2CLI_GUIDE.md)
- [GPU Daemon API](./plans/2026-03-15-gpu-daemon-mcp-api-design.md)
- [Self-Hosting](./SELF_HOSTING.md)
