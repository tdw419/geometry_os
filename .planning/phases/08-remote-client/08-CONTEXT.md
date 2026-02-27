# Phase 8: Remote Client - Context

**Gathered:** 2026-02-27
**Status:** Ready for planning

<domain>
## Phase Boundary

Users can browse and discover containers from remote catalog servers. This phase adds the ability to view remote containers, see which server each comes from, and manage server URLs. Downloading and booting remote containers is Phase 9.

</domain>

<decisions>
## Implementation Decisions

### Display Integration
- Remote and local containers appear **mixed together** on the same infinite canvas
- Remote containers identified by **badge/overlay** (colored dot + hover shows server name)
- Badge style: Claude's discretion — should match existing UI patterns

### Server Management
- **Dedicated settings panel** for full server management (add/remove/edit)
- **Quick-add button** on canvas for adding new servers without opening settings
- Server metadata:
  - URL (required)
  - Display name (e.g., "Company Catalog")
  - Color (for badge/indicators from this server)
  - Enabled toggle (disable without deleting)
- Unreachable servers are **added with error state** — allows retry without re-entry

### Loading & Error States
- **Skeleton loaders** shown while fetching remote catalog
- **Error status** displayed in settings panel (red indicator on server entry)
- **10 second timeout** before marking server as unreachable
- Stale-while-revalidate pattern: show cached data while fetching fresh

### Claude's Discretion
- Exact badge design (colored dot style, size, position)
- Skeleton loader appearance
- Settings panel layout

</decisions>

<specifics>
## Specific Ideas

- Badge should be subtle but visible — not cluttering the canvas
- User can manage servers even when offline (settings always available)

</specifics>

<deferred>
## Deferred Ideas

- Downloading remote containers — Phase 9
- Boot progress for remote containers — Phase 9
- Retry with exponential backoff — Phase 11
- Clear cache UI — Phase 11

</deferred>

---

*Phase: 08-remote-client*
*Context gathered: 2026-02-27*
