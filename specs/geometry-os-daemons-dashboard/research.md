---
spec: geometry-os-daemons-dashboard
phase: research
created: 2026-02-22
generated: auto
---

# Research: Geometry OS Daemons Dashboard

## Executive Summary

Feasibility: High. Extend existing `Daemon_Status` pattern from ascii-desktop-control plugin to support multi-daemon monitoring. Use same transient caching approach with `pgrep`/`ps` shell commands. WordPress admin integration straightforward.

## Codebase Analysis

### Existing Patterns

| Pattern | File | Usage |
|---------|------|-------|
| Daemon status checking | `plugins/ascii-desktop-control/includes/class-daemon-status.php` | `pgrep -f` with transient caching |
| Plugin structure | `plugins/ascii-desktop-control/ascii-desktop-control.php` | Class-based, hooks in constructor |
| Admin menu | Same file | `add_menu_page()` + `add_submenu_page()` |
| AJAX handlers | Same file | `wp_ajax_*` hooks with nonce verification |
| Auto-refresh JS | `plugins/ascii-desktop-control/assets/js/control.js` | jQuery AJAX with setInterval |

### Daemons to Monitor

| Daemon | Process Name | Location |
|--------|--------------|----------|
| Evolution Daemon | `evolution_daemon.py` | `systems/evolution_daemon/` |
| Directive Daemon | `directive_daemon.py` | Ascii desktop system |
| Visual Bridge | `visual_bridge.py` | `systems/visual_shell/api/` |

### Dependencies

- WordPress 6.0+ (already in use)
- PHP 8.0+ (already in use)
- shell_exec enabled (used by existing Daemon_Status)
- jQuery (bundled with WordPress)

### Constraints

- Must use `shell_exec` for process inspection (security implications documented)
- Transient cache TTL: 30 seconds (same as existing)
- AJAX nonce verification required for all requests
- `manage_options` capability for access control

## Feasibility Assessment

| Aspect | Assessment | Notes |
|--------|------------|-------|
| Technical Viability | High | Extends proven pattern from ascii-desktop-control |
| Effort Estimate | S | 7 tasks, ~2-3 hours |
| Risk Level | Low | Well-trodden WordPress plugin patterns |

## Recommendations

1. Create new standalone plugin `geometry-os-daemons` (not merge with existing)
2. Extend Daemon_Status to Daemon_Monitor supporting multiple processes
3. Add CPU/memory metrics via `ps` command (not in original)
4. Use card-based grid layout for dashboard (different from ascii-desktop-control)
5. Auto-refresh every 30 seconds via AJAX (same as existing)
