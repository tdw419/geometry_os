---
name: ECC Integration
description: Everything Claude Code MCP bridge for Geometry OS
type: project
---

# ECC Integration

**Status:** ✅ Complete
**Version:** 1.0.0
**Date:** 2026-03-16

## What

ECC (Everything Claude Code) integration exposes 60+ commands, 65+ skills, 47 agents, and 34 rules as MCP tools for AI assistants to use when working with Geometry OS.

## Why

- **AI-Native Development:** AI assistants can invoke planning, TDD, verification directly through MCP
- **Self-Improvement Loop:** Geometry OS can use ECC to improve itself
- **Pattern Extraction:** Learn from each session and create reusable skills
- **Architectural Guidance:** Get expert guidance on complex decisions

## How to Apply

Use ECC tools via MCP bridge:
- `ecc_status` - Check ECC availability
- `ecc_plan` - Create implementation plans
- `ecc_tdd` - Run TDD workflow
- `ecc_review` - Code review
- `ecc_verify` - Build/test/lint verification
- `ecc_learn` - Extract patterns
- `ecc_instincts` - View learned patterns
- `ecc_skill_create` - Generate new skills
- `ecc_brainstorm` - Brainstorming sessions
- `ecc_debug` - Systematic debugging
- `ecc_architect` - Architectural guidance

## Key Files

```
apps/mcp2cli/src/
├── geos_mcp_server.py   # Main MCP server with ECC tools (11 new)
├── ecc_bridge.py        # ECC command execution bridge

docs/
└── ECC_INTEGRATION.md   # Full documentation

apps/mcp2cli/tests/
└── test_ecc_bridge.py   # Test suite
```

## Stats

- **Commands Available:** 117
- **Skills Available:** 66
- **Agents Available:** 46
- **Rules Available:** 53
- **MCP Tools Added:** 11

## Future Phases

| Phase | Integration | Status |
|-------|-------------|--------|
| 1 | MCP Bridge → ECC Commands | ✅ Complete |
| 2 | Visual Shell → ECC Canvas | Planned |
| 3 | Swarm Guilds → ECC Agents | Planned |
| 4 | Glyph Programs → ECC Skills | Planned |
| 5 | GPU Daemon → ECC HTTP API | Planned |
