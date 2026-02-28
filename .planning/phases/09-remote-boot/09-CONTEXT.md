# Phase 9: Remote Boot - Context

**Gathered:** 2026-02-27
**Status:** Ready for planning

<domain>
## Phase Boundary

Users can boot containers from remote URLs with visual download progress. This phase handles the download → verify → boot flow for remote containers. Uploading containers and managing remote servers are separate phases.

</domain>

<decisions>
## Implementation Decisions

### Download Trigger
- **Single click** to initiate download (same as local container boot)
- **Immediate download** - no confirmation dialog
- **Auto-boot when complete** - no user action needed after download
- **Cancellable** - user can click to cancel mid-download

### Verification Feedback
- **Integrated with progress** - show "verifying" step at end of download progress
- **Visual style:** Checkmark icon + "Verified" text briefly, then boot starts
- **On failure:** Red X + "Verification failed" + retry option

### Offline Handling
- **Badge on cached containers** - visual indicator that container is available offline
- **Uncached + offline:** Block with error "Not cached - network required"
- **Stale cache:** SWR pattern - boot immediately from cache, fresh data loads in background

### Claude's Discretion
- Progress display design (progress bar style, percentage/speed/time format)
- Badge design for cached indicator
- Exact error message wording
- Download speed/time remaining calculation approach

</decisions>

<specifics>
## Specific Ideas

- Flow should feel seamless - click, see progress, container boots
- Consistent with existing local container click-to-boot UX
- Cache badge should be distinct from server source badge

</specifics>

<deferred>
## Deferred Ideas

- None — discussion stayed within phase scope

</deferred>

---

*Phase: 09-remote-boot*
*Context gathered: 2026-02-27*
