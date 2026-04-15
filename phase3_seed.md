# Pixelpack Phase 3: Context-Dependent Expansion

## The Problem

Phase 2 scaled pixelpack to 254-byte programs, but the expansion ratio is terrible: 254 bytes needs 56 pixels (1792 bits). Each pixel expands independently, so repeated byte patterns (indentation, variable names, keywords) waste bits in every pixel.

## Current State

Read the existing code:
- `expand.py` -- 16 strategies (0x0-0xF), 16-entry DICTIONARY + 16-entry DICTIONARY_EXT. Seeds are independent.
- `expand2.py` -- multi-seed chaining, but each seed still expands independently
- `boot.py` / `boot2.py` -- 1x1 and NxM PNG encode/decode
- `find_seed.py` -- analytical inverse search
- `verify.py` / `verify2.py` -- 6+20 tests all passing
- `corpus.py`, `dict_build.py`, `dict_v2.py` -- auto-dictionary tools

The critical limitation: `expand_v1(seed)` and `expand_seed(seed)` are pure functions. Same seed always produces same bytes. No state, no context, no memory.

## The Goal

Add three new expansion strategies that break the "independent pixel" constraint. Pixels can now reference and build on previous output:

### Strategy 0xC: LZ77_BACKREF

The 28 param bits encode a back-reference into the running output buffer:

```
[CCCCCCCCCCCCCCCC] [LLLLLLLLLLLL]
^-- 16-bit offset -^-- 12-bit length --^
```

- **Offset** (16 bits): how far back in the accumulated output to look (0 = previous byte, 1 = two bytes back, etc.)
- **Length** (12 bits): how many bytes to copy

Copy `length` bytes starting at position `(total_output_so_far - 1 - offset)`. This is classic LZ77 -- repeated substrings become a single 32-bit pixel.

**Enables**: Programs with repeated tokens (Python indentation, repeated variable names, HTML tags) compress dramatically. A 200-byte Python program with 15 lines might have 60 bytes of repeated "    " indentation -- all handled by 2-3 back-reference pixels.

**Edge case**: If offset + length goes past the end of current output, wrap around (like LZ77 with cyclic buffer) or emit what's available. Must be deterministic.

### Strategy 0xD: DYN_DICT

Builds a dynamic dictionary during decode. Works in two modes selected by the top bit of params:

**Add mode** (bit 27 = 1): The pixel's output is literal bytes (using the existing DICTIONARY lookups). After expansion, the output string is added to a dynamic dictionary at the next available index (starting at index 0).

**Reference mode** (bit 27 = 0): The remaining 27 bits encode an index into the dynamic dictionary. Look up the string at that index and emit it.

```
Bit 27 = 0: [IIIIIIIIIIIIIIIIIIIIIIIIII-----]
             ^-- 27-bit dynamic dict index --^

Bit 27 = 1: [normal expansion happens, result gets added to dyn dict]
```

The dynamic dictionary is a list, populated in order of first occurrence. Common patterns (function names, repeated expressions) get added once by an "add mode" pixel, then referenced cheaply by "reference mode" pixels.

**Enables**: Each dynamic dict reference pixel can emit 5-20 bytes that were previously emitted. After the first occurrence of "def fibonacci(n):" (15 bytes), a reference pixel emits all 15 bytes from just a few bits of index.

**State**: The dynamic dictionary persists across pixels within the same PNG decode. Reset at the start of each new PNG decode.

### Strategy 0xE: XOR_CHANNEL

Instead of using the pixel's RGBA values directly, XOR the current pixel with the previous pixel to derive the actual seed. This creates a second information channel:

```
actual_seed[N] = pixel[N] XOR pixel[N-1]
```

The first pixel in the image is used as-is (no XOR). From pixel 2 onward, the decoder XORs with the previous pixel before extracting the strategy and params.

This means:
- Two pixels that look similar visually can encode completely different programs (because their XOR is different)
- The visual appearance of the image can be controlled independently of the encoded data
- Effectively doubles the entropy available in multi-pixel images

**Implementation**: This is NOT a new strategy selector. It's a decode mode. Add a flag in the PNG metadata (tEXt chunk) that says "xor_mode=true". When set, the decoder XORs each pixel with its predecessor before extracting the 4+28 bit seed.

**Enables**: Better visual control of the output image. More entropy per pixel pair. Steganographic properties.

## Architecture

The key change: expand functions now take a `context` parameter.

```python
@dataclass
class ExpandContext:
    """State that persists across pixel expansions within one decode."""
    output_buffer: bytearray     # accumulated output so far
    dyn_dict: list[str]          # dynamic dictionary entries
    prev_pixel: int | None       # previous raw pixel value (for XOR)

def expand_with_context(seed: int, ctx: ExpandContext) -> bytes:
    """Expand a seed using context-dependent strategies."""
    strategy = (seed >> 28) & 0xF
    params = seed & 0x0FFFFFFF

    if strategy <= 0xB:
        # Existing strategies -- no context needed
        return expand_v1(seed)
    elif strategy == 0xC:
        return _expand_lz77(params, ctx)
    elif strategy == 0xD:
        return _expand_dyn_dict(params, ctx)
    elif strategy == 0xE:
        return _expand_xor_channel(params, ctx)
```

The existing `expand_v1()` and `expand_seed()` functions remain unchanged. New context-dependent strategies live in a new file `expand3.py` alongside `expand2.py`.

## Constraints

- **MUST maintain backward compatibility**: All existing seeds (0x0-0xB strategies) must produce identical output. All 26 existing tests must pass.
- **Context resets per PNG**: The `ExpandContext` starts fresh for each new PNG decode. No cross-image state.
- **Deterministic**: Same PNG always decodes to the same program. No randomness.
- **Keep it simple**: Working code beats clever theory. Prefer clear, debuggable implementations.
- **All code stays in** `/home/jericho/zion/projects/pixelpack/`
- **New file**: `expand3.py` for context-dependent strategies. Don't modify `expand.py` or `expand2.py`.

## Test Targets

After implementation, these programs must encode and decode correctly:

```python
# Target 1: Heavy indentation (LZ77 shines)
# 50 bytes, lots of repeated "    "
def add(a, b):
    result = a + b
    return result

# Target 2: Repeated function signatures (DYN_DICT shines)  
# 80 bytes
def greet(name):
    print(f"Hello, {name}!")
def farewell(name):
    print(f"Goodbye, {name}!")

# Target 3: Dense program (XOR channel helps)
# The fibonacci program from verify2.py (254 bytes) should encode in fewer pixels
```

The fibonacci program that currently needs 56 pixels should need significantly fewer (aim for 30 or less) with context-dependent strategies.

## Files to Create/Modify

- `expand3.py` -- NEW: ExpandContext, expand_with_context(), LZ77, DYN_DICT, XOR strategies
- `boot3.py` -- NEW: Encoder that finds seeds using context-dependent strategies (tries LZ77 for repeated patterns, uses DYN_DICT for repeated tokens)
- `verify3.py` -- NEW: Tests for context-dependent strategies + all previous tests still passing
- `README.md` -- UPDATE: document the new strategies

Do NOT modify `expand.py`, `expand2.py`, `boot.py`, `boot2.py`, `verify.py`, or `verify2.py`.
