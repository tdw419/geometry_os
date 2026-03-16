---
name: ECC Agent Guild
description: ECC agents wrapped as Geometry OS spatial guild members with Hilbert addressing
type: project
---

# ECC Agent Guild

## Status: ✅ Complete

ECC's 46 agents are wrapped as Geometry OS guild members with spatial addressing via Hilbert coordinates.

## Guild Organization

| Guild | Sector (Hilbert) | Agents |
|-------|------------------|--------|
| Engineering | 8M-9M | planner, architect, tdd-guide, refactor-cleaner |
| Review | 9M-10M | code-reviewer, security-reviewer, database-reviewer, python/go/kotlin-reviewer |
| Testing | 10M-11M | e2e-runner, build-error-resolver, go/kotlin-build-resolver |
| Analysis | 11M-12M | Explore, doc-updater |
| BMAD | 12M-13M | bmad-master, bmad-*-router agents |

## MCP Tools

- `ecc_guild_status` - Get guild status and organization
- `ecc_guild_list_agents` - List available agents (filterable by guild)
- `ecc_guild_spawn` - Spawn an agent at a Hilbert position
- `ecc_guild_despawn` - Remove an agent instance
- `ecc_guild_dispatch` - Dispatch task to an agent
- `ecc_guild_spatial_state` - Get spatial state for Infinite Map
- `ecc_guild_discover` - Discover all ECC agents

## Integration Points

**Why:** ECC agents need spatial representation for visual debugging on the Infinite Map.

**How to apply:**
1. Use `ecc_guild_spawn` to create agent instances
2. Agent positions are tracked in Hilbert space
3. Spatial state can be rendered on the Infinite Map
4. Each guild has a distinct color for visualization

## Files

- `apps/mcp2cli/src/ecc_agent_guild.py` - Core guild implementation
- `apps/mcp2cli/tests/test_ecc_agent_guild.py` - Test suite (29 tests)
- `docs/ECC_INTEGRATION.md` - Documentation

## Test Results

```
29 passed, 1 warning in 0.08s
```

## Future Work

- Phase 4: Glyph Programs → ECC Skills (wrap skills as spatial programs)
- Phase 5: GPU Daemon → ECC HTTP API (expose via daemon.glyph)
