# Visual File Browser Design

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:writing-plans to create implementation plan from this design.

**Goal:** Create a spatial file browser where files are first-class objects on the infinite map.

**Architecture:** Python script (`file_browser.py`) uses VMLinuxBridge to execute `ls -la`, parses output into FileInfo objects, calculates spatial positions via layout engine, and renders color-coded tiles via CDP to PixiJS.

**Tech Stack:** Python asyncio, VMLinuxBridge, Chrome DevTools Protocol, PixiJS

---

## Design Decisions

### 1. Display Style: Free-Form Spatial
- Files are not confined to a window panel
- Files are independent objects on the infinite map
- Initial placement uses a grid pattern for order
- Files can be freely rearranged later

### 2. Navigation: Spatial Nesting
- Directories expand in-place when clicked
- Contents spread outward from parent directory
- Zooming out shows nested hierarchy
- Creates a traversable, zoomable filesystem universe

### 3. File Representation: Color-Coded Tiles
- Rectangular tiles (120x60px) with filename
- Color indicates file type for instant scanning
- Hover/select reveals full metadata (size, date)
- Space-efficient for dense spatial layouts

---

## Architecture

```
file_browser.py
    │
    ├── FileBrowser class
    │   ├── bridge: VMLinuxBridge (host/qemu/wgpu)
    │   ├── current_path: str
    │   ├── expanded_dirs: Set[str]
    │   └── file_cache: Dict[str, List[FileInfo]]
    │
    ├── Output Parser
    │   └── Parse ls -la → FileInfo objects
    │
    ├── Spatial Layout Engine
    │   ├── Grid placement (initial view)
    │   └── Radial expansion (nested dirs)
    │
    └── Renderer (CDP → PixiJS)
        └── Color-coded tiles on map
```

## Data Structures

### FileInfo

```python
@dataclass
class FileInfo:
    name: str
    path: str
    file_type: str  # 'directory', 'file', 'symlink', 'executable'
    size: int       # bytes
    permissions: str
    modified: str
    x: int = 0      # layout position
    y: int = 0
    color: int = 0xFFFFFF
```

### Color Coding

| Type | Color | Hex |
|------|-------|-----|
| Directory | Blue | `0x4A90D9` |
| Executable | Green | `0x2ECC71` |
| Code | Teal | `0x1ABC9C` |
| Data | Yellow | `0xF1C40F` |
| Media | Purple | `0x9B59B6` |
| Config | Orange | `0xE67E22` |
| Document | White | `0xECF0F1` |
| Other | Gray | `0x95A5A6` |

## Tile Layout

- **Dimensions**: 120px width × 60px height
- **Padding**: 10px between tiles
- **Grid columns**: 6 (adapts to viewport)
- **Radial expansion**: Files spread in arc around parent directory

## Interaction Model

1. **Click directory tile** → Expand in-place with radial layout
2. **Click file tile** → Show preview card with metadata
3. **Double-click** → Open file (future: integrate with apps)
4. **Click expanded directory** → Collapse back to single tile

## Usage

```bash
# Start file browser (host backend)
python3 file_browser.py

# Start with specific backend
python3 file_browser.py --backend qemu

# Start at specific path
python3 file_browser.py --path /home/user/projects
```
