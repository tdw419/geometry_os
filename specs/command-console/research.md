---
spec: command-console
phase: research
created: 2026-02-21T12:00:00Z
---

# Research: Command Console

## Executive Summary

The Command Console enables bidirectional human-AI collaboration through WordPress. Humans write "Directives" (posts), and AI agents read, parse, and execute them, posting results as comments. This feature leverages existing infrastructure (ai-publisher.php, ArchitectAgent patterns) and adds a new DirectiveAgent for processing.

**Feasibility: HIGH** - All foundational components exist. Estimated effort: 4-6 hours.

---

## Market/Technology Research

### Human-AI Command Interfaces

| Pattern | Example | Pros | Cons |
|---------|---------|------|------|
| Natural Language Commands | "Explain X" | Intuitive | Ambiguity |
| Structured Syntax | `/command arg1 arg2` | Precise | Learning curve |
| Hybrid | "Please investigate X" | Best of both | Complexity |

**Recommendation**: Hybrid approach - natural language with keyword detection for scope classification.

### WordPress as AI Agent Interface

WordPress provides:
- **Content Management**: Posts, categories, comments
- **REST API**: External access via endpoints
- **Security**: User roles, localhost restrictions
- **Extensibility**: Custom endpoints, post meta

**Key Pattern**: Use WordPress as "Semantic Memory" where AI agents read/write human-facing content.

### Directive Parsing Strategies

1. **Keyword-based classification**: Detect "explain", "investigate", "analyze" to determine scope
2. **Out-of-scope detection**: Reject dangerous operations (delete, restart, modify code)
3. **Target extraction**: Identify the component/subject being asked about

---

## Codebase Patterns Found

### 1. ArchitectAgent (`systems/intelligence/architect_agent_wp.py`)

**Pattern**: Agent crawls codebase, publishes to WordPress via HTTP POST

```python
payload = {
    "tool": "updateArchitecture",
    "arguments": {...}
}
response = requests.post(self.wp_api, json=payload, timeout=5)
```

**Reuse**: DirectiveAgent follows same pattern with `getDirectives`, `markDirectiveProcessed`, `postDirectiveResponse`

### 2. ai-publisher.php (`wordpress_zone/wordpress/ai-publisher.php`)

**Pattern**: PHP endpoint with localhost-only security

```php
if ($_SERVER['REMOTE_ADDR'] !== '127.0.0.1' && $_SERVER['REMOTE_ADDR'] !== '::1') {
    header('HTTP/1.1 403 Forbidden');
    die(json_encode(array('success' => false, 'error' => 'Local access only.')));
}
```

**Reuse**: Add new handlers for directive operations

### 3. Substrate Map Cache (to be created)

**Pattern**: ArchitectAgent exports component data to JSON cache for DirectiveAgent to query

```python
def export_cache(self, components, cache_path=".geometry/substrate_map.json"):
    # Export for DirectiveAgent lookup
```

---

## Feasibility Analysis

### Security Considerations

| Risk | Mitigation |
|------|------------|
| Remote access | localhost-only check in ai-publisher.php |
| Dangerous commands | Out-of-scope pattern detection |
| Unvalidated input | Scope limited to informational/research |

### Performance Implications

| Approach | Latency | Complexity |
|----------|---------|------------|
| Polling (30s) | Low | Simple |
| Webhooks | Immediate | Complex (need WP hooks) |
| WebSocket | Real-time | Moderate |

**Recommendation**: Start with 30s polling, add WebSocket integration later for HUD display.

### Error Handling Strategy

1. **API Unavailable**: Return empty list, log warning
2. **Parse Failure**: Mark as NEEDS_CLARIFICATION, post help comment
3. **Component Not Found**: Post "couldn't find" response with suggestions

### Testing Approach

- **Unit Tests**: Directive parsing, scope detection, component lookup
- **Integration Tests**: WordPress API round-trip
- **E2E Tests**: Create directive → process → verify comment

---

## Existing Implementation Plan

A detailed plan exists at `docs/plans/2026-02-21-command-console.md` with 7 tasks:

| Task | Component | Effort |
|------|-----------|--------|
| 1 | Extend ai-publisher.php | 30 min |
| 2 | Create DirectiveAgent | 60 min |
| 3 | Write unit tests | 45 min |
| 4 | Add substrate cache | 15 min |
| 5 | Create WordPress page | 10 min |
| 6 | E2E integration tests | 30 min |
| 7 | Control script | 15 min |

**Total**: ~3-4 hours

---

## Recommendations

### Architecture

```
┌─────────────────┐     ┌──────────────────┐     ┌─────────────────┐
│   WordPress     │────▶│  DirectiveAgent  │────▶│  Substrate Map  │
│  (Directives)   │     │   (Python)       │     │    (JSON)       │
└─────────────────┘     └──────────────────┘     └─────────────────┘
        │                       │
        │                       ▼
        │              ┌──────────────────┐
        └──────────────│  Comment Response│
                       └──────────────────┘
```

### Technology Choices

| Component | Technology | Rationale |
|-----------|------------|-----------|
| Agent | Python 3.12 | Existing pattern, async-capable |
| API | WordPress REST | Already exists, secure |
| Parsing | Regex + keywords | Simple, no ML deps |
| Storage | Post meta | WordPress native |

### Phase 3 Scope

**Allowed:**
- Informational: "Explain how X works"
- Research: "Investigate why Y is slow"

**Not Allowed (future phases):**
- Code modifications
- System operations

### Future Enhancements

1. **WebSocket Integration**: Push directive events to Visual Bridge for HUD display
2. **Embedding-based Parsing**: Use vector similarity for better target matching
3. **Multi-agent Dispatch**: Route directives to specialized agents based on target

---

## References

- Implementation Plan: `docs/plans/2026-02-21-command-console.md`
- ArchitectAgent: `systems/intelligence/architect_agent_wp.py`
- WordPress API: `wordpress_zone/wordpress/ai-publisher.php`
- Visual Bridge: `systems/visual_shell/api/visual_bridge.py`
- WordPress Teams: `ai_project_management/teams/wordpress-architect-team.yaml`
