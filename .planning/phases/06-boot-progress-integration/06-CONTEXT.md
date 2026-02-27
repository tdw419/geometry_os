# Phase 6 Context: Boot Progress Integration

**Created:** 2026-02-27
**Goal:** Users see real-time boot progress and status for desktop containers

## Requirements

- BOOT-01: Progress indicator during QEMU boot (>1s operations)
- BOOT-02: Visual status indicator (running/stopped/error)
- BOOT-03: Error messages with actionable guidance

## Decisions

### Progress Visualization

| Decision | Choice |
|----------|--------|
| Position | Both - progress bar on object + details in side panel |
| Style | Linear progress bar (0-100%) |
| Fast boots | Always show progress, even if brief (<1s) |
| Information | Both percentage AND stage name (e.g., "Loading kernel... 45%") |

### Status Indicator Design

| Decision | Choice |
|----------|--------|
| Position | Corner badge (colored dot in corner of thumbnail) |
| Animation | Pulse animation while booting |
| Hover behavior | Show details tooltip (uptime, PID, memory usage) |
| Click behavior | Display only - no management actions from status indicator |

### Status Color Coding

| State | Color | Animation |
|-------|-------|-----------|
| Stopped | Gray | None |
| Booting | Yellow/Orange | Pulsing |
| Running | Green | None |
| Error | Red | None |

### Boot Stages

| Stage | Label | Description |
|-------|-------|-------------|
| 1 | "Starting QEMU..." | QEMU process launch |
| 2 | "Loading kernel..." | Kernel image loading |
| 3 | "Initializing..." | Init system startup |
| 4 | "Ready" | System fully booted |

### Progress Estimation

- **Method:** Time-based with stage labels
- **Behavior:** Progress advances based on elapsed time with stage-appropriate labels
- **No QEMU introspection:** We don't parse QEMU output for actual progress

### Error Handling

| Aspect | Decision |
|--------|----------|
| Timeout | 30 seconds maximum before marking as error |
| Error capture | Failed stage, elapsed time, boot config |
| NOT captured | QEMU stderr/stdout (too verbose for UI) |
| Presentation | Inline on object + expandable details |

### Error Message Format

When boot fails, show:
1. **Stage failed:** "Boot failed at: Loading kernel..."
2. **Elapsed time:** "After 12.3 seconds"
3. **Config used:** "Memory: 2G, CPUs: 2"
4. **Actionable guidance:** "Try increasing memory or check kernel compatibility"

## Technical Constraints

- QEMU runs as subprocess - no built-in progress reporting
- PID tracking needed for orphan prevention
- Status polling via catalog server API
- Must integrate with existing RTSDesktopObject component

## Integration Points

| Component | Integration |
|-----------|-------------|
| RTSDesktopObject | Add progress bar overlay, status badge |
| CatalogBridge | Add status polling, boot timeout handling |
| DesktopObjectManager | Wire status updates to UI |
| catalog_server.py | Add status endpoint, PID tracking |

## Deferred Ideas

- VNC console embedding (scope bloat)
- Live texture swap from running QEMU (v1.x)
- Boot log streaming (v1.x)
