# Memory Palace as Development Environment

## The Core Problem

We want to develop INSIDE the memory palace, not on disk.

**Current:**
- Files live on disk (`memory_palace_facts.json`)
- Palace reads from RAM and renders
- You write code outside the palace
- Palace visualizes external data

**Desired:**
- Palace IS the filesystem
- You write code inside the palace
- Files ARE facts in spatial memory
- The palace is both IDE and storage

---

## Two Approaches

### Approach A: FUSE Mount (Palace as Linux Filesystem)

Mount the memory palace as a filesystem in Linux.

```
/mnt/memory_palace/
├── inner_ring/
│   ├── critical_fact_1.asm
│   ├── critical_fact_2.py
│   └── critical_fact_3.md
├── middle_ring/
│   ├── important_note_1.txt
│   └── important_note_2.json
└── outer_ring/
    ├── reference_doc_1.md
    └── reference_doc_2.csv
```

**How it works:**

1. **FUSE driver** (`palace_fuse.py`):
   - Mounts at `/mnt/memory_palace`
   - Intercepts `read()`, `write()`, `readdir()`, `mkdir()`
   - Maps filesystem operations to palace RAM

2. **Spatial mapping:**
   - Directories = Rings (inner, middle, outer)
   - Files = Facts
   - File position on disk = Angle position in ring
   - File metadata = Fact tier, timestamp

3. **Write flow:**
   ```bash
   echo "critical insight" > /mnt/memory_palace/inner_ring/insight.md
   ```
   → FUSE intercepts
   → Creates new fact
   → Positions at next available angle
   → Writes content to RAM
   → Palace auto-renders

4. **Read flow:**
   ```bash
   cat /mnt/memory_palace/inner_ring/insight.md
   ```
   → FUSE intercepts
   → Locates fact by path
   → Reads content from RAM
   → Returns to caller

**Pros:**
- Works with ALL tools (vim, git, editors)
- Normal filesystem semantics
- No assembly needed
- Can git init inside palace
- Can use existing editors

**Cons:**
- Files still live in RAM (not truly "inside")
- Palace visualizes filesystem, not vice versa
- File ↔ Mapping complexity

---

### Approach B: Pure Spatial File System (Palace IS the Filesystem)

Everything lives in the palace as spatial memory. No disk files.

**Architecture:**

```
GeOS VM RAM
│
├── 0x2000: Palace VFS Header
│   ├── u32 magic (0x50414C43 = "PALC")
│   ├── u32 version
│   ├── u32 file_count
│   └── u32 root_extent
│
├── 0x2010: Extent Allocation Table
│   └── N × [u32 extent_id, u32 addr, u32 size, u32 flags]
│
├── 0x3000: File Directory (spatial index)
│   └── For each file:
│       ├── u32 file_id
│       ├── u32 ring (0=inner, 1=middle, 2=outer)
│       ├── u32 angle (0-359)
│       ├── u32 extent_id
│       ├── u32 size
│       └── u8[32] filename
│
└── 0x4000: File Content Extents
    └── File data stored in extents
```

**How it works:**

1. **Files are spatial:**
   - Each file = one fact + content extent
   - Ring = directory tier
   - Angle = file ordering
   - Distance from center = file age/scope

2. **Assembly opcodes for file I/O:**
   ```asm
   ; Open file at spatial position
   FILEOPEN r1, ring, angle    ; r1 = file_handle

   ; Read from file
   FILEREAD r1, r2, r3         ; r1=handle, r2=buffer, r3=bytes

   ; Write to file
   FILEWRITE r1, r2, r3        ; r1=handle, r2=buffer, r3=bytes

   ; Create new file
   FILECREATE r1, ring, angle, r2
                                 ; r1=handle, r2=extent_size

   ; List files in ring
   FILELIST r1, ring           ; r1 = list_handle
   ```

3. **Palace as editor:**
   - Navigate rings with arrow keys
   - Click file to open editor overlay
   - Edit in text buffer overlay
   - Save writes back to extent
   - Palace auto-renders new state

4. **Development workflow:**
   ```asm
   ; Add new opcode
   FILECREATE r1, 0, 45, 256    ; Create file at ring 0, angle 45
   FILEWRITE r1, str_buf, len   ; Write ASM source
   CLOSE r1

   ; Compile and run
   LOADASM r1, 0, 45            ; Load from spatial position
   ASSEMBLE r1, r2              ; r2 = bytecode_addr
   RUN r2                       ; Execute
   ```

**Pros:**
- Truly "inside" the palace
- Spatial organization IS filesystem
- Assembly programming in palace
- Self-hosting possible
- No disk dependency

**Cons:**
- Needs new opcodes (FILEOPEN, FILEREAD, etc.)
- Need editor in palace
- No normal tool integration
- Higher complexity

---

## GeOS Infrastructure for This

GeOS already has pieces for both approaches:

### VFS Surface (for Approach A)
```
MMIO: 0x7000_0000 - VFS Pixel Surface
- Canvases saved as files
- Round-trip verified
- In-memory filesystem
```

### Capability System (for Approach B)
```
- Check capabilities on file operations
- Permission layers
- Already in src/vfs.rs
```

### Extent-Based Storage (for Approach B)
```
- Extent allocation table
- File metadata tracking
- Already in roadmap
```

---

## Recommended: Start with FUSE (Approach A)

**Why:**
1. Immediate utility with existing tools
2. Lower complexity
3. Proven FUSE patterns in GeOS (see `references/pixelfs-fuse.md`)
4. Can add spatial semantics gradually
5. Bridge to pure spatial FS (Approach B) later

**MVP:**

```python
#!/usr/bin/env python3
"""
Memory Palace FUSE Driver

Mounts the palace as a Linux filesystem.

Usage:
  python3 palace_fuse.py /mnt/memory_palace
  cd /mnt/memory_palace
  ls
  echo "new fact" > inner_ring/fact.md
"""

from fuse import FUSE, FuseOSError, Operations
from pathlib import Path
import json
import struct

FACTS_FILE = Path.home() / "projects/zion/projects/geometry_os/geometry_os/memory_palace_facts.json"
PALACE_RAM = 0x2000


class PalaceFS(Operations):
    def __init__(self):
        self.facts = self._load_facts()

    def _load_facts(self):
        if FACTS_FILE.exists():
            with open(FACTS_FILE) as f:
                data = json.load(f)
            return data.get("facts", [])
        return []

    def _save_facts(self):
        data = {
            "version": 1,
            "facts": self.facts
        }
        with open(FACTS_FILE, "w") as f:
            json.dump(data, f, indent=2)

    def readdir(self, path, fh):
        # Map path to ring
        if path == "/":
            return [".", "..", "inner_ring", "middle_ring", "outer_ring"]
        elif path == "/inner_ring":
            return [".", ".."] + [f"fact_{i}" for i, f in enumerate(self.facts) if f["ring"] == 0]
        elif path == "/middle_ring":
            return [".", ".."] + [f"fact_{i}" for i, f in enumerate(self.facts) if f["ring"] == 1]
        elif path == "/outer_ring":
            return [".", ".."] + [f"fact_{i}" for i, f in enumerate(self.facts) if f["ring"] == 2]
        return [".", ".."]

    def getattr(self, path, fh=None):
        # Return file attributes
        # Size, permissions, etc.
        pass

    def read(self, path, size, offset, fh):
        # Read file content from fact
        pass

    def write(self, path, data, offset, fh):
        # Write content to fact (create if new)
        pass

    def mkdir(self, path, mode):
        # Create directory (ring)
        pass


def main(mountpoint):
    FUSE(PalaceFS(), mountpoint, nothreads=True, foreground=True)


if __name__ == "__main__":
    import sys
    if len(sys.argv) != 2:
        print("Usage: palace_fuse.py <mountpoint>")
        sys.exit(1)

    main(sys.argv[1])
```

**Usage:**

```bash
# Mount
python3 palace_fuse.py /mnt/memory_palace

# Normal tools work
cd /mnt/memory_palace
ls
echo "critical insight" > inner_ring/insight.md
vim inner_ring/code.asm

# Git integration
git init
git add inner_ring/
git commit -m "Add spatial code"

# Palace auto-updates
python3 show_palace.py  # Shows new file at spatial position
```

---

## Then: Add Spatial Semantics

Once FUSE works, add spatial awareness:

1. **Filename = Spatial position:**
   ```
   inner_ring/angle_045_insight.md  → Ring 0, angle 45
   middle_ring/angle_120_note.asm   → Ring 1, angle 120
   ```

2. **File age = Distance from center:**
   - Old files move to outer ring
   - New files start at inner ring
   - Automatically reorganize

3. **Git commits = Spatial snapshots:**
   - Each commit = palace state snapshot
   - Time-travel through git history
   - Visual diff with palace

---

## Finally: Pure Spatial FS (Approach B)

Once FUSE proves the concept, move to pure spatial:

1. **Add opcodes:** FILEOPEN, FILEREAD, FILEWRITE, FILECREATE
2. **Build editor in palace:** Text overlay, keyboard input
3. **Remove disk dependency:** Everything in RAM
4. **Self-hosting:** Palace edits itself

---

## Decision Matrix

| Criterion | FUSE (A) | Pure Spatial (B) |
|-----------|----------|------------------|
| **Tools integration** | ✓ All tools work | ✗ Only GeOS tools |
| **Complexity** | ✓ Low | ✗ High |
| **Truly "inside"** | ✗ Still RAM files | ✓ Pure spatial |
| **Editor needed** | ✗ No (use vim) | ✓ Yes (build it) |
| **Opcodes needed** | ✗ No | ✓ Yes (5+ opcodes) |
| **Self-hosting** | ✗ No | ✓ Yes |
| **Git support** | ✓ Native | ✗ Custom |
| **MVP time** | ✓ 1-2 days | ✗ 1-2 weeks |

---

## Recommendation

**Phase 1 (Now):** Build FUSE mount
- Mount at `/mnt/memory_palace`
- Normal tools work immediately
- Prove spatial ↔ filesystem mapping

**Phase 2 (Next):** Add spatial semantics
- Filename encoding (angle_XXX_file.ext)
- Age-based reorganization
- Git spatial snapshots

**Phase 3 (Future):** Pure spatial FS
- Add FILE* opcodes
- Build editor in palace
- Remove disk dependency

**Start with FUSE.** It gives you spatial development NOW with existing tools, then you can go deeper into pure spatial later.

The palace becomes your IDE, not just a visualizer.