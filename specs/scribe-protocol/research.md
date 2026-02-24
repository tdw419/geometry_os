---
spec: scribe-protocol
phase: research
created: 2026-02-23T17:00:00Z
---

# Research: Scribe Protocol

## Executive Summary

Scribe Protocol extends World of Rectification (WoR) WordPress plugin with expert-in-the-loop mentorship. Implementation plan at `docs/plans/2026-02-23-scribe-protocol.md` is well-structured but requires adjustment: the plan references `class-game-engine.php` which doesn't exist - WoR uses singleton pattern with separate class files (WOR_Quest, WOR_CTRM, WOR_Credits). Visual Bridge WebSocket integration exists and supports HTTP endpoint `/agent/request` on port 8769 for broadcasts.

## External Research

### Best Practices

| Topic | Finding | Source |
|-------|---------|--------|
| WordPress dbDelta | Requires `CREATE TABLE` uppercase, `{$wpdb->prefix}` prefix, `PRIMARY KEY` on line | WordPress Codex |
| JSON columns | MySQL 5.7+ native JSON type, use `json_encode()` for storage | MySQL Docs |
| REST API auth | `permission_callback: fn() => is_user_logged_in()` pattern | WP REST API Handbook |
| WP Cron | `wp_schedule_single_event()` for async tasks, `wp_next_scheduled()` check | WordPress Handbook |

### Prior Art

| System | Pattern | Applicability |
|--------|---------|---------------|
| WOR_CTRM | Singleton + user_meta storage + action hooks | ScribePortal should follow |
| WOR_Quest_API | Singleton + `register_rest_route()` + `rest_ensure_response()` | Transmission API should follow |
| Visual Bridge | HTTP port 8769 + `/agent/request` + WebSocket broadcast | Help request notifications |

### Pitfalls to Avoid

- **Table naming**: Must use `{$wpdb->prefix}wor_` prefix for consistency
- **Singleton pattern**: All WoR classes use `get_instance()` static method
- **REST namespace**: Use existing `wor/v1` namespace, not new one
- **Activation hook**: Tables created on activation, not in class constructor

## Codebase Analysis

### Existing WoR Plugin Architecture

| Component | File | Pattern |
|-----------|------|---------|
| Quest System | `includes/class-wor-quest.php` | Singleton + post type/taxonomy registration on `init` |
| CTRM Scoring | `includes/class-wor-ctrm.php` | Singleton + user_meta storage + `do_action()` hooks |
| Credits Ledger | `includes/class-wor-credits.php` | Singleton + user_meta + custom post type for audit |
| Quest API | `api/class-quest-api.php` | Singleton + REST routes on `rest_api_init` |
| Player API | `api/class-player-api.php` | Singleton + REST routes |
| Verify API | `api/class-verify-api.php` | Singleton + REST routes |
| Main Plugin | `world-of-rectification.php` | Singleton `World_of_Rectification` + `WOR()` helper |

### Database Schema Patterns

```
Existing tables: None (uses WordPress post types and user_meta)

Plan proposes custom tables:
- wp_wor_scribes (user_id, cohort, expertise_tags JSON, onboarding_step)
- wp_wor_sprouts (user_id, primary_sefirah, assigned_scribe_id)
- wp_wor_transmissions (scribe_id, sprout_id, status, started_at, ended_at)
- wp_wor_transmission_messages (transmission_id, sender_type, message_text, intent_label)
- wp_wor_intent_clusters (intent_name, sample_phrases JSON, message_count)
```

### REST API Patterns

```php
// From class-quest-api.php
register_rest_route(self::API_NAMESPACE, '/quests', [
    'methods' => 'GET',
    'callback' => [$this, 'get_quests'],
    'permission_callback' => '__return_true',  // Public endpoints
]);

register_rest_route(self::API_NAMESPACE, '/quests/(?P<id>\d+)/complete', [
    'methods' => 'POST',
    'callback' => [$this, 'complete_quest'],
    'permission_callback' => [$this, 'check_auth'],  // Authenticated
]);
```

### Visual Bridge Integration

| Endpoint | Port | Purpose |
|----------|------|---------|
| `/agent/request` | 8769 (HTTP) | POST for agent requests, returns `task_id` |
| WebSocket | 8768 | Broadcasts to browser clients |
| Terminal | 8768/terminal | PTY session management |

Broadcast pattern from `visual_bridge.py`:
```python
await self._broadcast({
    "type": "SPROUT_HELP_REQUEST",
    "sprout_id": sprout_id,
    "quest_id": quest_id,
    "timestamp": time.time()
})
```

### CTRM Integration Points

| Hook | When Fired | Scribe Integration |
|------|------------|-------------------|
| `wor_ctrm_decision_recorded` | After decision recorded | Track scribe session quality |
| `wor_tms_level_up` | On level threshold | Scribe certification milestone |
| `wor_quest_completed` | After quest completion | Sprout context for help |

## Plan Verification

### Discrepancies Found

| Plan Reference | Actual State | Required Change |
|----------------|--------------|-----------------|
| `class-game-engine.php` | **Does not exist** | Use `world-of-rectification.php` for require statements |
| `create_tables()` method | **Does not exist** | Create new `WOR_Scribe_Setup` class or add to activation hook |
| REST API in GameEngine | **APIs are separate** | Create `api/class-scribe-api.php` following singleton pattern |
| `WoR_` prefix | Uses `WOR_` | Update class naming to `WOR_ScribePortal` etc. |

### Missing from Plan

1. **Scribe Dashboard Shortcode**: Need `[wor_scribe_dashboard]` for frontend
2. **Sprout Help Button**: Need UI component in quest templates
3. **Real-time Chat UI**: Need jQuery polling or WebSocket client in frontend
4. **Intent Classification Accuracy**: Plan uses regex patterns - consider ML upgrade path
5. **Session Timeout Handling**: Plan has 30-min stale cleanup but no reconnection logic

## Related Specs

| Spec | Relationship | May Need Update |
|------|--------------|-----------------|
| **transmission-protocol** | HIGH - Same domain (mentorship), Python backend vs this WordPress-only | Yes - coordinate data models |
| **agency-era-guilds** | MEDIUM - GuildAgent pattern could inform ScribeAgent if extending | No - different scope |
| **world-of-rectification** | HIGH - Base plugin being extended | Yes - new includes/api files |
| **wordpress-web-terminal** | LOW - Terminal integration pattern | No |

## Feasibility Assessment

| Aspect | Assessment | Notes |
|--------|------------|-------|
| Technical Viability | **High** | Well-defined plan, existing patterns to follow |
| Effort Estimate | **M** | ~17 tasks as planned, 2-3 days implementation |
| Risk Level | **Medium** | Plan file path errors, no frontend UI spec |

## Quality Commands

| Type | Command | Source |
|------|---------|--------|
| PHP Lint | `php -l` (per file) | Standard |
| WP Coding Standards | `phpcs --standard=WordPress` | Optional |
| Manual Test | Activate plugin in WP admin | Required |
| API Test | `curl` against REST endpoints | Required |

**Local CI**: `find . -name "*.php" -exec php -l {} \;`

## Recommendations for Requirements

1. **Fix class references**: Plan references `class-game-engine.php` which doesn't exist - create separate API class following `WOR_Quest_API` singleton pattern
2. **Add frontend templates**: Plan missing `[wor_scribe_portal]` shortcode and chat UI components
3. **Coordinate with transmission-protocol**: Both specs address mentorship - transmission-protocol uses Python/GuildAgent, this uses WordPress-only - clarify scope boundary
4. **Intent classification upgrade path**: Regex patterns are MVP - specify ML integration (lm_studio or external API)
5. **Session persistence**: WebSocket may disconnect - ensure polling fallback for chat continuity

## Open Questions

1. Should ScribePortal integrate with GuildAgent (Python backend) or remain WordPress-only?
2. What is the minimum rating threshold for Ghost Mentor training eligibility? (Plan says 3.5/5)
3. How to handle cross-session continuity if Sprout returns later?
4. Export format for LLM fine-tuning - JSONL? OpenAI messages format?

## Sources

- `/home/jericho/zion/projects/geometry_os/geometry_os/docs/plans/2026-02-23-scribe-protocol.md` - Implementation plan
- `/home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/plugins/world-of-rectification/` - Plugin codebase
- `/home/jericho/zion/projects/geometry_os/geometry_os/systems/visual_shell/api/visual_bridge.py` - WebSocket/HTTP integration
- `/home/jericho/zion/projects/geometry_os/geometry_os/specs/transmission-protocol/.progress.md` - Related spec progress
- `/home/jericho/zion/projects/geometry_os/geometry_os/specs/agency-era-guilds/.progress.md` - GuildAgent pattern reference
