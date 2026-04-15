# Pixelpack Phase 2: Expand the Dictionary, Scale the Encoding

## The Problem

Pixelpack currently encodes 3-15 byte programs into a single 32-bit pixel using a hand-picked 16-entry dictionary. That's a proof of concept. We need to scale to 50-200+ byte programs. The bottleneck is the dictionary and the strategies.

## Current State

Read the existing code in this directory:
- `expand.py` -- 16 strategies (0x0-0xF), 16-entry DICTIONARY + 16-entry DICTIONARY_EXT
- `find_seed.py` -- analytical inverse search across strategies
- `boot.py` -- 1x1 RGBA PNG encode/decode
- `verify.py` -- 6/6 tests passing on tiny programs
- `README.md` -- full documentation

The current dictionary is hand-picked: print(, ), ", Hello, \n, echo, World, def, 42, main, (), ,, !, void, {, }. This can only compose programs that happen to be concatenations of these fragments.

## The Goal

Make pixelpack capable of encoding programs in the 50-200 byte range. This requires:

### 1. Auto-growing dictionary from corpus

Instead of hand-picking dictionary entries, analyze a corpus of real programs and find the most valuable entries automatically. The pixelpack-dict project at `/home/jericho/zion/apps/pixelpack-dict/compress.py` already has code for this -- greedy trial compression with BPE. Adapt that approach.

Steps:
- Create a corpus of target programs (shell scripts, Python one-liners, small C programs, assembly snippets)
- Analyze the corpus for common byte patterns (n-grams)
- Score each candidate by how many programs it helps encode and how many bits it saves
- Build the dictionary automatically

### 2. Multi-pixel support

A single pixel is 32 bits. But we can use larger images:
- 1x2 = 64 bits (2 pixels)
- 2x2 = 128 bits (4 pixels)  
- 4x4 = 512 bits (16 pixels)
- The image dimensions encode how many seeds to read

The expansion algorithm reads pixel 0, expands, reads pixel 1, expands, concatenates or chains the results. Each pixel in the grid is a separate seed with its own strategy.

### 3. Chained expansion

One pixel's output becomes input to the next pixel's expansion. This is the "fractal unfold" concept:
- Pixel 0 expands to a partial program
- Pixel 1 expands to more code that references or extends pixel 0's output
- The chain continues until the full program is assembled

### 4. Smarter strategies

The current 16 strategies are a start but have gaps:
- No conditional logic (if this byte, emit that)
- No back-references (reference a byte emitted earlier in the output)
- No variable-length dictionary indices (waste bits on short entries)
- No arithmetic encoding

Add at least 2-3 new strategies that address these gaps.

## Constraints

- MUST maintain backward compatibility with existing seeds (all current verify.py tests must still pass)
- The dictionary must be deterministic (same dictionary = same expansion, always)
- Multi-pixel images must be valid PNGs that display as actual images
- Keep it simple. Working code beats clever theory.
- All code stays in `/home/jericho/zion/projects/pixelpack/`

## Target Programs to Encode

The new version should be able to encode at least 3 of these:

```python
# Target 1: Python hello world with variable (34 bytes)
x = "Hello"\nprint(x)\n

# Target 2: Shell script with variable (28 bytes)
MSG="Hello"\necho $MSG\n

# Target 3: Python function (42 bytes)
def greet(name):\n    print(name)\n\n

# Target 4: C hello world (52 bytes)
#include <stdio.h>\nint main(){puts("Hello");}\n

# Target 5: Python loop (48 bytes)
for i in range(10):\n    print(i)\n

# Target 6: Geometry OS assembly (variable, use multi-pixel)
PSET 10 20\nCOLOR 255 0 0\nDRAW\n
```

## What Already Works

The phase 1 proof of concept (6/6 tests passing) proves the mechanism:
- 32-bit seed = 4-bit strategy + 28-bit params
- Dictionary strategies work: indices into shared word table
- PNG round-trip works: 1x1 RGBA, lossless
- Analytical seed search works: no brute force needed

Build on this. Don't rewrite from scratch. Extend expand.py, add multi-pixel support to boot.py, update find_seed.py for the new strategies.

## Source Directories

- `/home/jericho/zion/projects/pixelpack/` -- this project
- `/home/jericho/zion/apps/pixelpack-dict/` -- reference for auto-dictionary building (compress.py)
