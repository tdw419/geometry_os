---
spec: wordpress-native-agent-triggers
phase: tasks
total_tasks: 6
created: 2026-02-21T00:00:00Z
generated: from-plan
---

# Tasks: WordPress-Native Agent Triggers

## Phase 1: Core Infrastructure

- [x] 1.1 Create PHP Agent Request Handler
  - **Do**: Add `geometry_os_send_agent_request()` and `geometry_os_get_task_status()` functions to `geometry_os_bridge.php`
  - **Files**: `wordpress_zone/wordpress/wp-content/mu-plugins/geometry_os_bridge.php`
  - **Done when**: Functions send HTTP POST to Visual Bridge and return task_id
  - **Verify**: `phpunit wordpress_zone/tests/test_agent_requests.php`
  - **Commit**: `feat(wp): add agent request handler for Evolution Daemon triggers`
  - _Requirements: FR-1_
  - _Design: PHP Agent Request Handler_

- [x] 1.2 Add Visual Bridge Agent Endpoints
  - **Do**: Add `/agent/request` and `/agent/status/{task_id}` HTTP endpoints to Visual Bridge
  - **Files**: `systems/visual_shell/api/visual_bridge.py`
  - **Done when**: Endpoints queue tasks and return status
  - **Verify**: `pytest tests/test_visual_bridge_agent_endpoint.py -v`
  - **Commit**: `feat(bridge): add HTTP endpoints for WordPress agent requests`
  - _Requirements: FR-2, FR-3_
  - _Design: Visual Bridge Endpoints_

- [ ] 1.3 Create WordPress Task Handler
  - **Do**: Create `wordpress_task_handler.py` with handlers for content_intelligence, evolution_publish, plugin_analysis
  - **Files**: `systems/evolution_daemon/wordpress_task_handler.py`
  - **Done when**: Handler executes all three agent types
  - **Verify**: `pytest tests/test_wordpress_task_handler.py -v`
  - **Commit**: `feat(daemon): add WordPress task handler for agent requests`
  - _Requirements: FR-4_
  - _Design: WordPress Task Handler_

## Phase 2: Admin UI

- [ ] 2.1 Create Admin UI Plugin
  - **Do**: Create `geometry_os_admin_ui.php` with metabox, buttons, AJAX handlers, and tools page
  - **Files**: `wordpress_zone/wordpress/wp-content/mu-plugins/geometry_os_admin_ui.php`
  - **Done when**: Metabox shows on post editor with working buttons
  - **Verify**: `phpunit wordpress_zone/tests/test_admin_ui.php`
  - **Commit**: `feat(wp): add admin UI buttons for triggering Evolution Daemon agents`
  - _Requirements: FR-5, FR-6, FR-7_
  - _Design: Admin UI_

## Phase 3: Automatic Hooks

- [ ] 3.1 Add Automatic WordPress Hooks
  - **Do**: Add `transition_post_status` hook for auto-tag and cron for evolution polling
  - **Files**: `wordpress_zone/wordpress/wp-content/mu-plugins/geometry_os_bridge.php`
  - **Done when**: Posts auto-tagged on publish, evolution events polled every 5 min
  - **Verify**: `phpunit wordpress_zone/tests/test_agent_requests.php`
  - **Commit**: `feat(wp): add automatic hooks for auto-tag and evolution publishing`
  - _Requirements: FR-8, FR-9_
  - _Design: Automatic Hooks_

## Phase 4: Integration Testing

- [ ] 4.1 Create Integration Tests
  - **Do**: Create end-to-end tests for WordPress → Bridge → Daemon flow
  - **Files**: `tests/test_wordpress_agent_integration.py`
  - **Done when**: All three agent types verified end-to-end
  - **Verify**: `pytest tests/test_wordpress_agent_integration.py -v`
  - **Commit**: `test: add integration tests for WordPress-Agent flow`
  - _Requirements: All_

## Verification Commands

```bash
# Start Visual Bridge
python3 systems/visual_shell/api/visual_bridge.py &

# Test agent request endpoint
curl -X POST http://127.0.0.1:8768/agent/request \
  -H "Content-Type: application/json" \
  -d '{"type":"agent_request","agent_type":"content_intelligence","payload":{"post_id":1,"action":"auto_tag"},"request_id":"manual-test-001"}'

# Check task status
curl http://127.0.0.1:8768/agent/status/wp-content_intelligence-1-<timestamp>
```

## Notes

- **Security**: Localhost-only, no external access
- **Error handling**: Graceful degradation when Visual Bridge unavailable
- **Performance**: 5-second HTTP timeout, 10-second polling max
