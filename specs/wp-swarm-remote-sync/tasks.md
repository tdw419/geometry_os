# WordPress Swarm Remote Sync - Tasks

## Overview

Enable remote WordPress Swarm Nodes to discover and sync memories with the main Geometry OS cluster.

**Plan File:** `docs/plans/2026-02-21-wp-swarm-remote-sync.md`
**Team:** `apps/openspec/openspec/teams/wp-swarm-sync-team.yaml`

---

## Task 1: Add Sync Endpoint to WordPress Plugin

- [x] Complete

**Agent:** wp-sync-specialist
**Files:**
- Modify: `wordpress_zone/wordpress/wp-content/plugins/geometry-os-swarm-node/geometry-os-swarm-node.php`

**Steps:**
1. Add sync REST route to `register_routes()` method
2. Implement `api_sync()` callback method
3. Test: `curl -s "http://localhost:8080/index.php?rest_route=/geoos/v1/sync&since=0&limit=5"`
4. Commit: `feat(wp): add sync endpoint for remote node synchronization`

**Verification:** Sync endpoint returns JSON with `node_id`, `count`, and `posts` array

---

## Task 2: Create Python Sync Manager Module

- [x] Complete

**Agent:** sync-manager-specialist
**Files:**
- Create: `systems/swarm/sync_manager.py`
- Create: `tests/test_sync_manager.py`

**Steps:**
1. Write failing tests for RemoteNode, SyncResult, and SyncManager
2. Run tests to verify failure
3. Implement SyncManager with fetch_posts, store_posts, sync_node methods
4. Run tests to verify passing
5. Commit: `feat(sync): add SyncManager for remote WordPress node synchronization`

**Verification:** All unit tests pass

---

## Task 3: Integrate Sync Manager with Discovery Daemon

**Agent:** daemon-specialist
**Files:**
- Modify: `systems/swarm/wp_discovery_daemon.py`
- Modify: `tests/test_sync_manager.py`

**Steps:**
1. Add SyncManager import and initialization to daemon
2. Add _sync_loop() method for periodic sync
3. Update status reporting to include sync stats
4. Add integration test for sync with local WordPress
5. Commit: `feat(daemon): integrate SyncManager for automatic remote sync`

**Verification:** Integration test passes

---

## Task 4: Add Remote Node Configuration

**Agent:** daemon-specialist
**Files:**
- Create: `systems/swarm/remote_nodes.json`
- Modify: `systems/swarm/wp_discovery_daemon.py`

**Steps:**
1. Create remote_nodes.json config file structure
2. Add load_remote_nodes() method to daemon
3. Call load_remote_nodes() in start()
4. Commit: `feat(config): add remote_nodes.json for manual remote node config`

**Verification:** Config file loads without error

---

## Task 5: Update Test Runner for Level 2 Tests

**Agent:** test-specialist
**Files:**
- Modify: `systems/swarm/test_swarm.py`

**Steps:**
1. Add Level2Tests class with multi-node tests
2. Update main() to support --level argument
3. Add test_2_1_second_node_discovery
4. Add test_2_2_distributed_query
5. Add test_2_3_sync_manager
6. Commit: `test(swarm): add Level 2 multi-node sync tests`

**Verification:** `python3 systems/swarm/test_swarm.py --level 2` runs

---

## Task 6: Update Documentation

**Agent:** docs-specialist
**Files:**
- Modify: `WORDPRESS_SWARM_GUIDE.md`

**Steps:**
1. Add "Remote Node Sync" section after Cluster Management
2. Document sync architecture
3. Add remote_nodes.json configuration example
4. Add manual sync Python example
5. Commit: `docs: add remote sync documentation to swarm guide`

**Verification:** Guide renders correctly with new section
