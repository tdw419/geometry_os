# Architecture Research

**Domain:** PixelRTS v2 Expansion (Vision, FUSE, Installer, Catalog)
**Researched:** 2026-02-11
**Confidence:** HIGH

## Standard Architecture

### System Overview

```
+-----------------------------------------------------------------------+
│                        Presentation Layer                             |
+-----------------------------------------------------------------------+
|  +---------------------+  +---------------------+  +---------------+  |
│  |  Visual Catalog     |  |  Installer UI       |  |  CLI Tools    |  |
│  |  (Thumbnail Gallery)|  |  (Progress Display) |  |  (boot, etc)  |  |
│  +---------+-----------+  +----------+----------+  +-------+-------+  |
+------------|---------------------------|-------------------|----------+
             |                           |                   |
+------------|---------------------------|-------------------|----------+
|            v                           v                   v          |
|                    Integration / Orchestration Layer                 |
|  +---------------------+  +---------------------+  +---------------+  |
│  |  Vision Pipeline    |  |  FUSE Bridge        |  |  Installer    |  |
│  |  (Analyzer + VLM)   |  |  (Virtual Files)    |  |  (Extractor)  |  |
│  +----------+----------+  +----------+----------+  +-------+-------+  |
+-------------|---------------------------|-------------------|----------+
              |                           |                   |
              v                           v                   v
+-----------------------------------------------------------------------+
|                        Core PixelRTS v2 Layer                         |
|  +---------------------+  +---------------------+  +---------------+  |
│  |  Encoder/Decoder    |  |  Registry Manager   |  |  Metadata     |  |
│  |  (Hilbert + PNG)    |  |  (Catalog Storage)  |  |  (tEXt chunks)|  |
│  +---------------------+  +---------------------+  +---------------+  |
+-----------------------------------------------------------------------+
                                |
                                v
+-----------------------------------------------------------------------+
|                        Storage Layer                                  |
|  +---------------------+  +---------------------+  +---------------+  |
│  |  .rts.png Files     |  |  .meta.json         |  |  SQLite       |  |
│  |  (PNG Containers)   |  |  (Sidecar Metadata)  |  |  (Registry)   |  |
│  +---------------------+  +---------------------+  +---------------+  |
+-----------------------------------------------------------------------+
```

### Component Responsibilities

| Component | Responsibility | Typical Implementation | Communicates With |
|-----------|----------------|------------------------|-------------------|
| **Vision Analyzer** | Extract visual features from PNG, prepare for VLM analysis | `PixelRTSVisionAnalyzer` class | Vision Model Client, Pattern Detector |
| **Vision Model Client** | Interface to Claude/VLM APIs for image understanding | API client with retry logic | Vision Analyzer, Installer |
| **FUSE Bridge** | Present .rts.png contents as virtual filesystem (kernel/initrd) | FUSE filesystem using `fusepy` | QEMU, boot loaders, shell tools |
| **Installer Engine** | Extract and write OS to disk with progress tracking | Threaded extractor with callbacks | Vision Analyzer, FUSE Bridge |
| **Visual Catalog** | Display thumbnail gallery with spatial layout | GUI using PyQt/Tk or TUI | Registry Manager, Vision Analyzer |
| **Registry Manager** | Store and query cartridge metadata | SQLite + JSON indexing | All components |

## Recommended Project Structure

```
systems/pixel_compiler/
├── vision/                    # Vision analysis pipeline
│   ├── __init__.py
│   ├── analyzer.py           # PixelRTSVisionAnalyzer (exists)
│   ├── vlm_client.py         # Claude/VLM API client
│   ├── prompts.py            # Analysis prompt templates
│   └── findings.py           # Response parsing
├── fuse/                      # FUSE filesystem bridge
│   ├── __init__.py
│   ├── rts_filesystem.py     # Main FUSE operations
│   ├── container.py          # PNG container handler
│   ├── mount.py              # Mount/unmount CLI
│   └── boot_integration.py   # QEMU integration
├── installer/                 # Installation engine
│   ├── __init__.py
│   ├── engine.py             # Main installer logic
│   ├── progress.py           # Progress tracking
│   ├── visualizer.py         # Visual progress display
│   └── disk.py               # Disk operations
├── catalog/                   # Visual catalog manager
│   ├── __init__.py
│   ├── gallery.py            # Thumbnail browser
│   ├── spatial_layout.py     # Spatial arrangement engine
│   └── launcher.py           # Boot-from-catalog handler
└── rts_registry_manager.py   # Existing registry backend
```

### Structure Rationale

- **vision/**: Isolated because vision analysis is optional (API key required). Can be mocked for testing.
- **fuse/**: Platform-specific (Linux FUSE). Clear boundary for portability concerns.
- **installer/**: Potentially dangerous (disk writes). Isolated for security and testing.
- **catalog/**: UI component that depends on other modules. Placed last in dependency order.

## Architectural Patterns

### Pattern 1: Provider Interface for Vision Models

**What:** Abstract interface for multiple vision model providers (Claude, LM Studio, local VLMs).

**When to use:** When you need to support multiple VLM backends or mock for testing.

**Trade-offs:** Adds abstraction layer (extra code) but enables flexibility and testing.

**Example:**
```python
from abc import ABC, abstractmethod
from typing import Dict, Any

class VisionModelProvider(ABC):
    """Abstract interface for vision model providers."""

    @abstractmethod
    def analyze(self, image_b64: str, prompt: str) -> str:
        """Analyze image and return text response."""
        pass

    @abstractmethod
    def build_kernel_prompt(self, metadata: Dict[str, Any]) -> str:
        """Build prompt for kernel version detection."""
        pass

class ClaudeVisionProvider(VisionModelProvider):
    """Claude API implementation."""

    def __init__(self, api_key: str):
        self.api_key = api_key

    def analyze(self, image_b64: str, prompt: str) -> str:
        # Anthropic API call
        pass

class MockVisionProvider(VisionModelProvider):
    """Mock for testing without API calls."""

    def analyze(self, image_b64: str, prompt: str) -> str:
        return '{"kernel_version": "6.6.0", "distro": "Alpine"}'
```

### Pattern 2: Lazy FUSE Mount

**What:** Mount FUSE filesystem only when first accessed, unmount after idle timeout.

**When to use:** When you want to present .rts.png as always available but avoid resource overhead.

**Trade-offs:** Adds complexity (mount/unmount lifecycle) but improves UX and resource usage.

**Example:**
```python
class LazyFUSEMount:
    """Lazy-mounting FUSE filesystem."""

    def __init__(self, rts_path: str, mountpoint: str, idle_timeout: int = 300):
        self.rts_path = rts_path
        self.mountpoint = mountpoint
        self.idle_timeout = idle_timeout
        self._mount_thread = None
        self._last_access = None

    def __enter__(self):
        """Mount on context entry."""
        self._ensure_mounted()
        return self.mountpoint

    def __exit__(self, *args):
        """Schedule unmount after timeout."""
        self._schedule_unmount()

    def _ensure_mounted(self):
        """Mount if not already mounted."""
        if not self._is_mounted():
            self._mount_thread = threading.Thread(
                target=self._mount_forever,
                daemon=True
            )
            self._mount_thread.start()
```

### Pattern 3: Progress Callback Chain

**What:** Chain of progress observers for visual installer feedback.

**When to use:** When multiple components need progress updates (UI, logger, metrics).

**Trade-offs:** More complex than single callback but enables multiple observers.

**Example:**
```python
class ProgressChain:
    """Chain multiple progress observers."""

    def __init__(self):
        self.observers = []

    def add_observer(self, observer):
        """Add progress observer (callable with progress, message)."""
        self.observers.append(observer)

    def update(self, progress: float, message: str):
        """Notify all observers."""
        for observer in self.observers:
            try:
                observer(progress, message)
            except Exception:
                pass  # Don't let one observer break others

class VisualProgressObserver:
    """Visual progress bar for installer."""

    def __call__(self, progress: float, message: str):
        # Update progress bar
        pass
```

## Data Flow

### Vision Analysis Flow

```
[User selects .rts.png]
         ↓
[PixelRTSVisionAnalyzer loads PNG]
         ↓
[generate_entropy_overlay() → creates visualization]
         ↓
[prepare_for_vision_model() → resize + base64]
         ↓
[VlmClient.analyze() → Claude API call]
         ↓
[parse_vision_findings() → structured JSON]
         ↓
[generate_findings_overlay() → annotated PNG]
         ↓
[Display results: version, distro, architecture, anomalies]
```

### FUSE Boot Flow

```
[User: boot_os alpine.rts.png]
         ↓
[InstallerEngine extracts kernel/initrd from PNG]
         ↓
[FUSERtsFilesystem.mount(mountpoint)]
         ↓
[QEMU reads /mount/vmlinuz via FUSE]
         ↓
[HilbertLUT translates file offset → PNG pixels]
         ↓
[RGBA bytes extracted from PNG image]
         ↓
[QEMU boots kernel from virtual file]
         ↓
[After boot, FUSE unmounts automatically]
```

### Installer Progress Flow

```
[User: install_os alpine.rts.png /dev/sda]
         ↓
[InstallerEngine.start()]
         ↓
[ProgressChain.add_observer(VisualProgressObserver)]
         ↓
[Analyzer: Vision analysis → verify OS type]
         ↓ update(0.1, "Verifying OS type...")
[Extractor: Decode PNG → get kernel + initrd]
         ↓ update(0.4, "Extracting kernel...")
[DiskWriter: Write kernel to disk]
         ↓ update(0.7, "Writing to /dev/sda...")
[DiskWriter: Write initrd to disk]
         ↓ update(0.9, "Writing filesystem...")
[Bootloader: Install GRUB/Syslinux]
         ↓ update(1.0, "Installation complete!")
[Cleanup: Unmount, close files]
```

### Catalog Boot Flow

```
[User launches visual catalog]
         ↓
[CatalogGallery.scan_directory() → find all .rts.png]
         ↓
[For each file: generate thumbnail via VisionAnalyzer]
         ↓
[SpatialLayout.arrange() → organize by similarity/type]
         ↓
[User double-clicks thumbnail]
         ↓
[CatalogLauncher.boot_selected()]
         ↓
[FUSERtsFilesystem.mount() → present as /mnt/rts]
         ↓
[QEMU boots: -kernel /mnt/rts/kernel -initrd /mnt/rts/initrd]
         ↓
[After boot, catalog updates status: "Last booted: now"]
```

## Scaling Considerations

| Scale | Architecture Adjustments |
|-------|--------------------------|
| 1-50 cartridges | Single-process, in-memory thumbnails, SQLite catalog |
| 50-500 cartridges | Thumbnail caching on disk, async vision analysis, catalog indexing |
| 500+ cartridges | Background thumbnail generation, pagination, search indexing, distributed cache |

### Scaling Priorities

1. **First bottleneck:** Vision analysis is slow (API latency). Mitigation: Cache results, parallel analysis, background generation.
2. **Second bottleneck:** PNG decoding for many thumbnails. Mitigation: Thumbnail cache, lazy loading, downsized previews.

## Anti-Patterns

### Anti-Pattern 1: Blocking Vision API Calls on UI Thread

**What people do:** Call `VlmClient.analyze()` directly in button click handler.

**Why it's wrong:** Freezes UI during API call (seconds to minutes).

**Do this instead:** Run vision analysis in background thread, show loading spinner, update UI when complete.

```python
# BAD
def on_button_click():
    result = vlm_client.analyze(img_b64, prompt)  # Blocks!
    update_ui(result)

# GOOD
def on_button_click():
    show_loading_spinner()
    threading.Thread(
        target=lambda: update_ui(vlm_client.analyze(img_b64, prompt)),
        daemon=True
    ).start()
```

### Anti-Pattern 2: Holding FUSE Mount Open Indefinitely

**What people do:** Mount FUSE and never unmount, leaking mounts.

**Why it's wrong:** Exhausts system resources, prevents cleanup, locks files.

**Do this instead:** Use context managers or atexit handlers to ensure unmount.

```python
# BAD
fuse_mount = mount_rts(path)  # Never unmounted!

# GOOD
with mount_rts(path) as mountpoint:
    use_mount(mountpoint)
# Automatically unmounted
```

### Anti-Pattern 3: Tight Coupling Between Installer and Vision

**What people do:** Installer directly calls Claude API, hard to test.

**Why it's wrong:** Can't test installer without API key, slow tests.

**Do this instead:** Use provider interface, inject mock for testing.

## Integration Points

### External Services

| Service | Integration Pattern | Notes |
|---------|---------------------|-------|
| **Claude API** | HTTP client with retry, async support | Needs API key in env/config |
| **LM Studio** | Local HTTP API (localhost:1234) | No auth required, fallback |
| **QEMU** | Subprocess with -kernel/-initrd pointing to FUSE mount | FUSE must be mounted before QEMU start |

### Internal Boundaries

| Boundary | Communication | Notes |
|----------|---------------|-------|
| **Vision ↔ VLM Client** | Provider interface | Enables multiple backends |
| **Installer ↔ FUSE** | Context manager | Ensures cleanup |
| **Catalog ↔ Registry** | SQLite queries | Read-heavy, add caching |
| **Installer ↔ Vision** | Callback/observer | Async progress updates |

## Build Order Implications

### Dependencies

```
1. Core PixelRTS v2 (DONE)
   ├── Encoder/Decoder
   ├── Registry Manager
   └── Metadata handling

2. Vision Pipeline (Phase 1)
   ├── VisionAnalyzer (exists, needs enhancement)
   ├── VLM Client (NEW)
   └── Prompt templates (NEW)

3. FUSE Bridge (Phase 2)
   ├── RTSFilesystem (exists, needs adaptation for boot)
   ├── Mount helpers (NEW)
   └── QEMU integration (NEW)

4. Installer Engine (Phase 3)
   ├── Extractor (exists in pixelrts_v2_extractor.py)
   ├── Progress tracking (NEW)
   └── Visual feedback (NEW)

5. Visual Catalog (Phase 4)
   ├── Thumbnail generation (uses VisionAnalyzer)
   ├── Spatial layout (NEW)
   └── Boot launcher (uses FUSE + QEMU)
```

### Recommended Build Order

**Phase 1: Vision Analysis (Foundational)**
- Rationale: Demonstrates PixelRTS unique advantage, informs all other components
- Builds on: Existing PixelRTSVisionAnalyzer
- Outputs: Kernel version detection, OS identification, tamper detection

**Phase 2: FUSE Bridge (Enables Direct Boot)**
- Rationale: Removes extraction step, enables "one-command boot"
- Builds on: Existing RTSFilesystem (systems/rts_fuse/)
- Outputs: Virtual /kernel and /initrd files from PNG

**Phase 3: Installer Engine (User Value)**
- Rationale: Enables OS installation, practical use case
- Builds on: VisionAnalyzer (verification), FUSE (access), extractor (writing)
- Outputs: Visual installer with progress tracking

**Phase 4: Visual Catalog (Complete Experience)**
- Rationale: Delivers on "visual OS" promise, spatial UI
- Builds on: All previous components
- Outputs: Thumbnail gallery, spatial layout, one-click boot

**Why this order:**
1. Vision first: Unique differentiator, validates technical approach
2. FUSE second: Enables all subsequent "direct from PNG" workflows
3. Installer third: First practical application using vision + FUSE
4. Catalog last: Polished experience combining all features

## Sources

### FUSE Filesystems
- [A hand-holding guide to writing FUSE filesystems in Python (Gunnar Wolf, 2024)](https://gwolf.org/2024/10/started-a-guide-to-writing-fuse-filesystems-in-python.html)
- [explosive.fuse Python Package](https://pypi.org/project/explosive.fuse/)
- [Building a virtual filesystem in Python using FUSE (DevGenius, 2025)](https://blog.devgenius.io/building-a-virtual-file-system-in-python-using-fuse-956f140c55b6)
- [Google mount-zip Project](https://github.com/google/mount-zip)

### Existing Codebase
- `/home/jericho/zion/projects/geometry_os/geometry_os/systems/pixel_compiler/pixelrts_vision_analyzer.py`
- `/home/jericho/zion/projects/geometry_os/geometry_os/systems/pixel_compiler/infinite_map_fuse.py`
- `/home/jericho/zion/projects/geometry_os/geometry_os/systems/rts_fuse/filesystem.py`
- `/home/jericho/zion/projects/geometry_os/geometry_os/.planning/codebase/ARCHITECTURE.md`
- `/home/jericho/zion/projects/geometry_os/geometry_os/.planning/PROJECT.md`

---
*Architecture research for: PixelRTS v2 Expansion*
*Researched: 2026-02-11*
