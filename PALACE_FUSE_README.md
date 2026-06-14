# Memory Palace as Filesystem - Quick Start

## What You Just Got

Two files:

1. **PALACE_AS_FILESYSTEM.md** - Architecture guide
   - Explains FUSE vs pure spatial filesystem
   - Decision matrix
   - Roadmap from FUSE → pure spatial

2. **palace_fuse.py** - Working FUSE driver
   - Mounts palace as Linux filesystem
   - Works with vim, git, all normal tools
   - File naming: `fact_<ANGLE>_<SUBJECT>.ext`

---

## Quick Start

### 1. Install FUSE dependencies

```bash
# Check if FUSE is installed
ls -la /dev/fuse

# If not, install
sudo apt install fuse libfuse2

# Check fusepy
python3 -c "import fuse; print('OK')" || pip3 install --user fusepy
```

### 2. Mount the palace

```bash
# Create mount point
mkdir -p /mnt/memory_palace

# Mount (foreground, shows logs)
python3 palace_fuse.py /mnt/memory_palace
```

You'll see:
```
INFO:root:Initializing PalaceFS...
INFO:root:Loaded 4 facts from facts file
INFO:root:Mounting Memory Palace at: /mnt/memory_palace
INFO:root:Ring structure:
INFO:root:  /mnt/memory_palace/inner_ring/    ← Critical files
INFO:root:  /mnt/memory_palace/middle_ring/   ← Important files
INFO:root:  /mnt/memory_palace/outer_ring/    ← Reference files
```

### 3. Use it like a normal filesystem

In a NEW terminal:

```bash
cd /mnt/memory_palace

# List rings
ls
# inner_ring/  middle_ring/  outer_ring/

# List files in a ring
ls inner_ring/
# fact_000_pixelpack_decode.md
# fact_180_pixelpack_encode.md

# Read a file
cat inner_ring/fact_000_pixelpack_decode.md

# Edit with vim
vim inner_ring/fact_000_pixelpack_decode.md

# Create new file
echo "critical insight about GeOS" > inner_ring/fact_270_new_insight.md

# Python code
cat > middle_ring/fact_090_helper.py << 'EOF'
def spatial_search(facts):
    """Search facts by spatial proximity."""
    pass
EOF

# Git integration
cd /mnt/memory_palace
git init
git add inner_ring/
git commit -m "Add spatial code to palace"
```

### 4. See changes in the palace

In ANOTHER terminal:

```bash
cd ~/projects/zion/projects/geometry_os/geometry_os

# Recompile facts
python3 compile_facts.py

# Re-run palace
python3 run_memory_palace.py

# Or just watch ASCII
python3 show_palace.py
```

You'll see the new files appear as colored dots in the palace!

### 5. Unmount

```bash
fusermount -u /mnt/memory_palace
```

---

## File Naming Convention

Files are named by their spatial position:

```
fact_<ANGLE>_<SUBJECT>.ext

angle   = Position on ring (0-359)
subject = Fact subject
ext     = File extension (.md, .py, .asm, .txt, etc.)
```

Examples:
```
inner_ring/fact_000_pixelpack_decode.md    # Angle 0, inner ring
inner_ring/fact_270_new_insight.md        # Angle 270, inner ring
middle_ring/fact_090_helper.py            # Angle 90, middle ring
outer_ring/fact_180_reference_doc.md      # Angle 180, outer ring
```

---

## Ring = Tier Mapping

| Ring Directory | Tier    | Color | Usage |
|---------------|---------|-------|-------|
| `inner_ring/`  | critical | 🔴   | Core code, critical insights |
| `middle_ring/` | important | 🟡   | Notes, helpers, utilities |
| `outer_ring/`  | reference | 🔵   | Docs, data, references |

---

## Development Workflow INSIDE the Palace

### Scenario 1: Add a new GeOS opcode

```bash
# Mount
python3 palace_fuse.py /mnt/memory_palace

# Create opcode file in inner ring (critical)
cd /mnt/memory_palace
vim inner_ring/fact_045_filewrite_opcode.asm

# Write assembly
; FILEWRITE opcode implementation
; r1 = file_handle, r2 = buffer_addr, r3 = size
...
```

Result:
- File IS a fact in the palace
- Appears as red dot at angle 45
- Content persists in memory_palace_facts.json
- Can be compiled and loaded from RAM

### Scenario 2: Track research notes

```bash
# Add to middle ring (important)
vim middle_ring/fact_120_vfs_research.md

# Write markdown
# VFS Implementation Notes

## Extent allocation
- Each extent = 256 bytes
- Allocation table at 0x3000
...
```

Result:
- Yellow dot at angle 120
- Git-tracked
- Viewable in palace

### Scenario 3: Organize by spatial proximity

```bash
# Put related facts nearby
inner_ring/fact_000_core.md
inner_ring/fact_015_core_extension.md
inner_ring/fact_030_core_tests.py
```

Result:
- All three appear clustered together
- Visual relationship = conceptual relationship
- Spatial organization IS code organization

---

## Git Integration

Because it's a normal filesystem, git works:

```bash
cd /mnt/memory_palace

# Initialize
git init
git add .
git commit -m "Initial palace structure"

# Feature branch
git checkout -b add-file-opcodes
vim inner_ring/fact_045_filewrite.asm
git commit -am "Add FILEWRITE opcode"

# Time travel
git log --oneline
git checkout <commit-hash>

# Spatial diffs
# See palace at different points in history
```

---

## The Breakthrough

**Before:**
- Files on disk → compile → load to RAM → render
- Palace visualizes external data

**After (with FUSE):**
- Files ARE facts in the palace
- Edit directly in palace structure
- Spatial organization = file organization
- Palace is your IDE

---

## What This Enables

### 1. Spatial Development
- Code organized by conceptual proximity
- Related facts cluster together
- Visual structure = mental model

### 2. Self-Documenting Code
- File name = spatial position
- Ring = tier/importance
- Angle = ordering

### 3. Multi-Tool Support
- vim, emacs, VS Code all work
- git integration
- Any editor, any tool

### 4. Instant Visualization
- Write code in ring
- See dot appear in palace
- Real-time feedback

### 5. Spatial Search
- Find files by ring/angle
- "What's in the inner ring?" = core code
- "What's at angle 90?" = specific topic

---

## Next Steps

### Phase 1 (Now): Use FUSE Mount
- ✅ Mount and use as filesystem
- ✅ Normal tool integration
- ✅ Git support
- ✅ Spatial file naming

### Phase 2 (Next): Add Palace Editor
- Build text editor IN the palace
- Edit files through palace interface
- Click file → overlay editor
- Save → auto-compile

### Phase 3 (Future): Pure Spatial FS
- Add FILE* opcodes
- Remove disk dependency
- Palace IS the filesystem
- Self-hosting

---

## Troubleshooting

### "fusepy not installed"
```bash
python3 -m pip install --user fusepy
```

### "Permission denied" on mount
```bash
# Add user to fuse group
sudo usermod -a -G fuse $USER
# Logout and login again
```

### "Transport endpoint is not connected"
```bash
# Force unmount
sudo umount -f /mnt/memory_palace
# Or
fusermount -u /mnt/memory_palace
```

### Changes not visible in palace
```bash
# Recompile facts
python3 compile_facts.py

# Re-run palace
python3 run_memory_palace.py
```

---

## Files Summary

- `PALACE_AS_FILESYSTEM.md` - Architecture, decision matrix, roadmap
- `palace_fuse.py` - FUSE driver implementation
- `memory_palace_facts.json` - Backing store (synced on write)

---

## The Vision

The palace becomes your development environment:

```
You navigate to inner_ring/fact_045/
    ↓
Click dot in palace
    ↓
Editor overlay appears
    ↓
Write assembly code
    ↓
Save
    ↓
Automatically compiled and tested
    ↓
Results shown in palace
```

No more "files on disk" mental model. You live IN the palace.

---

Start with:

```bash
mkdir -p /mnt/memory_palace
python3 palace_fuse.py /mnt/memory_palace
cd /mnt/memory_palace
ls
```

Welcome to your spatial IDE.