# Requirements: Geometry OS Map WordPress Plugin

## Goal

Create a unified WordPress plugin that embeds the PixiJS Infinite Map via shortcode, Gutenberg block, and page template with configurable settings.

---

## Functional Requirements

### FR-1: Shortcode Support
- **FR-1.1**: Plugin provides `[geometry_os_map]` shortcode
- **FR-1.2**: Shortcode accepts attributes: `width`, `height`, `fullscreen`, `mode`, `theme`
- **FR-1.3**: Shortcode renders interactive PixiJS map in container
- **FR-1.4**: Multiple shortcodes per page supported (unique container IDs)

### FR-2: Gutenberg Block
- **FR-2.1**: Block registered as `geometry-os/map`
- **FR-2.2**: Block visible in block inserter under "Embed" category
- **FR-2.3**: Block has sidebar controls for all attributes
- **FR-2.4**: Block shows placeholder preview in editor
- **FR-2.5**: Block renders map on frontend via server-side render callback

### FR-3: Full-Screen Page Template
- **FR-3.1**: Template appears in Page Attributes dropdown
- **FR-3.2**: Template hides WordPress header/footer/admin bar
- **FR-3.3**: Template fills 100vw x 100vh viewport
- **FR-3.4**: Template can be selected per-page

### FR-4: Admin Settings
- **FR-4.1**: Settings page at Settings → Geometry OS Map
- **FR-4.2**: Configurable: Asset Base URL, Default Width, Default Height, Default Theme
- **FR-4.3**: Settings persist across plugin updates
- **FR-4.4**: Per-instance settings override global defaults

---

## Non-Functional Requirements

### NFR-1: Performance
- **NFR-1.1**: Scripts only load when map is present on page
- **NFR-1.2**: PixiJS loaded from CDN (not bundled)
- **NFR-1.3**: Module loading uses dependency ordering

### NFR-2: Compatibility
- **NFR-2.1**: WordPress 5.8+ support
- **NFR-2.2**: PHP 7.4+ support
- **NFR-2.3**: Works with block editor and classic editor
- **NFR-2.4**: Works with most WordPress themes

### NFR-3: Error Handling
- **NFR-3.1**: Graceful fallback if visual shell server unavailable
- **NFR-3.2**: Error message displayed in container on failure
- **NFR-3.3**: No JavaScript errors if GeometryOSApplication undefined

### NFR-4: Developer Experience
- **NFR-4.1**: Filter `geometry_os_asset_base_url` for programmatic override
- **NFR-4.2**: Helper function `geometry_os_render_map()` for PHP templates
- **NFR-4.3**: Custom event `geometryOSMapReady` dispatched on init

---

## User Stories

### US-1: Content Editor
> As a content editor, I want to add a map block to my page so visitors can explore the visualization.

**Acceptance Criteria:**
- Block appears in block inserter
- I can set width/height in sidebar
- Preview shows placeholder dimensions
- Published page shows working map

### US-2: Site Administrator
> As a site admin, I want to configure the asset URL in settings so I can point to production CDN.

**Acceptance Criteria:**
- Settings page accessible under Settings menu
- Asset URL field accepts valid URLs
- Changes apply to all maps immediately

### US-3: Developer
> As a developer, I want to override settings via filter so I can use environment-specific URLs.

**Acceptance Criteria:**
- `add_filter('geometry_os_asset_base_url', ...)` works
- Filter value takes precedence over database setting

---

## Out of Scope

- User authentication integration with map features
- WordPress media library connection to map tiles
- Custom post types for map markers
- Block patterns or reusable blocks
- WP-CLI commands
