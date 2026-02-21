---
spec: directive-control-surface
phase: research
created: 2026-02-21T12:00:00Z
generated: auto
---

# Research: Directive Control Surface

## Executive Summary

Create production-ready control surface for DirectiveAgent daemon with start/stop/status/tail commands. Pattern established by `evolution_ctl.sh`. High feasibility - direct adaptation of existing daemon control pattern.

## Codebase Analysis

### Existing Patterns

- **evolution_ctl.sh** (`systems/visual_shell/swarm/evolution/evolution_ctl.sh`): Full daemon control script with:
  - PID file management for process tracking
  - Heartbeat file parsing for status display
  - Color-coded terminal output
  - Graceful shutdown with SIGTERM -> SIGKILL fallback
  - Environment variable configuration

- **DirectiveAgent** (`systems/intelligence/directive_agent.py`): Python daemon with:
  - WordPress polling via REST API
  - Scope classification (INFORMATIONAL, RESEARCH)
  - Substrate map lookup for component info
  - Response posting via WordPress comments
  - Already has `run_forever()` daemon loop

### Dependencies

- Python 3.12 (argparse, json, logging, time, os, pathlib)
- Bash 4.0+ (for control script)
- requests library (already in DirectiveAgent)
- WordPress API via ai-publisher.php endpoint

### Constraints

- Phase 3 scope limits directives to informational/research only
- No code modification through directives
- WordPress must be accessible at configured URL

## Feasibility Assessment

| Aspect | Assessment | Notes |
|--------|------------|-------|
| Technical Viability | High | Direct pattern reuse from evolution_ctl.sh |
| Effort Estimate | S | 1-2 hours, well-defined scope |
| Risk Level | Low | Existing working patterns, minimal new code |

## Recommendations

1. Follow evolution_ctl.sh pattern exactly for consistency
2. Add heartbeat support to DirectiveAgent (mirrors evolution_daemon pattern)
3. Use argparse for CLI (standard Python pattern)
4. Place control script alongside directive_agent.py
