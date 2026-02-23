---
spec: geometry-os-daemons-dashboard
phase: requirements
created: 2026-02-22
generated: auto
---

# Requirements: Geometry OS Daemons Dashboard

## Summary

WordPress admin dashboard to monitor Geometry OS daemon processes. Displays status, PID, uptime, CPU%, and memory% for each daemon. Auto-refreshes every 30 seconds.

## User Stories

### US-1: View Daemon Status

As a **site administrator**, I want to **see all Geometry OS daemons in one place** so that **I can quickly verify system health**.

**Acceptance Criteria**:
- AC-1.1: Dashboard shows all three daemons (Evolution, Directive, Visual Bridge)
- AC-1.2: Each daemon displays running/stopped status with visual indicator
- AC-1.3: Running daemons show PID, uptime, CPU%, memory%
- AC-1.4: Stopped daemons show process name for identification

### US-2: Monitor System Resources

As a **site administrator**, I want to **see CPU and memory usage per daemon** so that **I can identify resource issues**.

**Acceptance Criteria**:
- AC-2.1: CPU percentage displayed for each running daemon
- AC-2.2: Memory percentage displayed for each running daemon
- AC-2.3: Values formatted to 1 decimal place (e.g., "4.5%")

### US-3: Auto-Refresh Dashboard

As a **site administrator**, I want the **dashboard to refresh automatically** so that **I see current status without manual action**.

**Acceptance Criteria**:
- AC-3.1: Dashboard refreshes every 30 seconds
- AC-3.2: Manual refresh button available for immediate update
- AC-3.3: "Last updated" timestamp shows when data was fetched
- AC-3.4: Refresh indicator animation during data fetch

### US-4: Access Control

As a **site administrator**, I want the **dashboard restricted to admins** so that **unauthorized users cannot view system details**.

**Acceptance Criteria**:
- AC-4.1: Dashboard requires `manage_options` capability
- AC-4.2: AJAX endpoints verify nonce and capability
- AC-4.3: Accessible from WordPress admin menu

## Functional Requirements

| ID | Requirement | Priority | Source |
|----|-------------|----------|--------|
| FR-1 | Display top-level "Geometry OS" admin menu | Must | US-1 |
| FR-2 | Display "Daemons" submenu page with dashboard | Must | US-1 |
| FR-3 | Check status of 3 daemons: evolution, directive, visual_bridge | Must | US-1 |
| FR-4 | Show running/stopped status with color indicator (green/red) | Must | US-1 |
| FR-5 | Show PID for running daemons | Must | US-1 |
| FR-6 | Show uptime formatted human-readable (e.g., "4h 23m") | Must | US-1 |
| FR-7 | Show CPU% and Memory% for running daemons | Must | US-2 |
| FR-8 | Cache status for 30 seconds via WordPress transients | Must | US-3 |
| FR-9 | Auto-refresh frontend every 30 seconds via AJAX | Must | US-3 |
| FR-10 | Manual refresh button bypasses cache | Should | US-3 |
| FR-11 | Show "Last updated" timestamp | Should | US-3 |

## Non-Functional Requirements

| ID | Requirement | Category |
|----|-------------|----------|
| NFR-1 | PHP 8.0+ with strict types | Compatibility |
| NFR-2 | WordPress 6.0+ | Compatibility |
| NFR-3 | shell_exec must be enabled | Infrastructure |
| NFR-4 | Response time <500ms for AJAX requests | Performance |
| NFR-5 | Cache reduces shell_exec calls to once per 30s | Performance |

## Out of Scope

- Starting/stopping daemons (read-only monitoring)
- Historical metrics or graphs
- Email/SMS alerts for daemon failures
- Configuration of which daemons to monitor (hardcoded list)
- REST API endpoints (admin-only AJAX)

## Dependencies

- WordPress core (transients, admin menu, AJAX)
- jQuery (bundled with WordPress)
- PHP shell_exec function
- Unix pgrep/ps commands
