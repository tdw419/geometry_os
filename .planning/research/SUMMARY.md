# Research Summary: PixelRTS Expansion Architecture

**Domain:** PixelRTS v2 Expansion (Vision, FUSE, Installer, Catalog)
**Researched:** 2026-02-11
**Overall confidence:** HIGH

## Executive Summary

PixelRTS v2 is a spatial encoding format that stores binary data (OS kernels, initrds, WASM modules) as PNG images using Hilbert space-filling curves. The existing codebase provides solid foundations: encoding/decoding core (`pixelrts_v2_core.py`), vision analysis starter (`pixelrts_vision_analyzer.py`), and FUSE filesystem implementation (`systems/rts_fuse/`). The expansion requires integrating four new components: vision analysis pipeline (VLM integration), FUSE bridge for direct boot, installer engine with visual progress, and visual catalog manager.

Research indicates that the architecture should follow a layered approach with clear boundaries: Presentation Layer (catalog, installer UI), Integration Layer (vision pipeline, FUSE bridge, installer), Core Layer (PixelRTS v2 encoding/decoding), and Storage Layer (PNG files, metadata, registry). The key insight is that FUSE virtual filesystems are a well-established pattern (Google's mount-zip, explosive.fuse, ratarmount) for presenting archive contents as regular files, and Python has excellent FUSE support via `fusepy`. Vision model integration should use a Provider pattern to enable multiple backends (Claude API, LM Studio, local VLMs) and mocking for testing.

The recommended build order is: (1) Vision Analysis - to demonstrate PixelRTS's unique advantage of visual OS understanding; (2) FUSE Bridge - to enable direct PNG booting without extraction; (3) Installer Engine - first practical application combining vision verification with FUSE access; (4) Visual Catalog - polished experience delivering on the "visual OS" promise. This order prioritizes differentiation first (vision), then enabling infrastructure (FUSE), then practical applications (installer), then UX polish (catalog).

## Key Findings

**Stack:** Python 3.12+ with fusepy for FUSE, Pillow/numpy for image processing, requests for VLM API calls
**Architecture:** Layered design with Provider interface for vision models, Lazy FUSE mount pattern, Progress callback chain
**Critical pitfall:** Blocking VLM API calls on UI thread freezes interface - always use background threads

## Implications for Roadmap

Based on research, suggested phase structure:

1. **Phase 1: Vision Analysis Pipeline** - Demonstrates PixelRTS unique differentiator
   - Addresses: VISION-01, VISION-02 (kernel detection, tamper detection)
   - Avoids: Blocking UI by using async/threads for API calls
   - Depends on: Existing PixelRTSVisionAnalyzer, needs VLM client
   - Outputs: Kernel version, OS distro, architecture identification, tamper detection

2. **Phase 2: FUSE Bridge for Direct Boot** - Removes extraction friction
   - Addresses: DIRECT-01, DIRECT-02 (one-command boot, FUSE filesystem)
   - Avoids: Mount leaks by using context managers
   - Depends on: Existing systems/rts_fuse/, needs QEMU integration
   - Outputs: Virtual /kernel and /initrd accessible from PNG

3. **Phase 3: Visual Installer Engine** - Practical value delivery
   - Addresses: INSTALL-01 (visual progress feedback)
   - Avoids: Tight coupling by using provider interfaces
   - Depends on: Vision verification, FUSE access, existing extractor
   - Outputs: Installation from .rts.png to disk with progress visualization

4. **Phase 4: Visual Catalog Manager** - Complete UX realization
   - Addresses: CATALOG-01, CATALOG-02 (thumbnail gallery, one-click boot)
   - Avoids: UI blocking by background thumbnail generation
   - Depends on: All previous components
   - Outputs: Spatial OS gallery with instant boot capability

**Phase ordering rationale:**
- Vision first: It's PixelRTS's unique advantage over ISO booting, validates technical approach
- FUSE second: Enables subsequent "direct from PNG" workflows, leverages existing FUSE code
- Installer third: First practical use case combining vision verification + FUSE access
- Catalog last: Polished experience requiring all components, delivers on core value prop

**Research flags for phases:**
- Phase 1 (Vision): Standard HTTP client patterns, LOW research risk - provider pattern well-understood
- Phase 2 (FUSE): Existing FUSE implementation in codebase, LOW research risk - adapt existing patterns
- Phase 3 (Installer): Disk operations require care, MEDIUM risk - need to handle permissions, errors
- Phase 4 (Catalog): UI work can be time-consuming, LOW risk technically but HIGH effort for polish

## Confidence Assessment

| Area | Confidence | Notes |
|------|------------|-------|
| Architecture | HIGH | Based on existing codebase analysis and established FUSE patterns |
| Component Boundaries | HIGH | Clear separation of concerns verified through existing code structure |
| Data Flow | HIGH | Flows derived from existing FUSE and vision analyzer implementations |
| Build Order | HIGH | Dependency graph is clear, each phase builds on previous outputs |
| Integration Points | HIGH | Existing FUSE code provides proven integration patterns |

## Gaps to Address

- **VLM API specifics:** Claude API vision endpoint details (model pricing, rate limits) need verification during Phase 1
- **FUSE performance:** Hilbert LUT generation for large (>4K) images may need optimization benchmarks
- **Cross-platform FUSE:** Current design assumes Linux; macOS/Dokan support would need investigation
- **UI framework choice:** PyQt vs Tk vs web-based for catalog not yet decided (Phase 4 decision)

---
*Research summary for: PixelRTS v2 Expansion*
*Researched: 2026-02-11*
