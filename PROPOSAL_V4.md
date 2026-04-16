# Pixelpack V4 Proposal: Squeezing More From 32 Bits

## Current State (expand.py, 14116 bytes)

| Metric | Value |
|--------|-------|
| Bytes/seed | **7.07** |
| Total seeds | 1,996 |
| LZ77 seeds | 959 (48%) producing 9,397 bytes (9.8 B/seed) |
| BYTEPACK seeds | 856 (43%) producing 3,474 bytes (4.1 B/seed) |
| BPE+other seeds | 181 (9%) producing 1,245 bytes (6.9 B/seed) |

The bottleneck is clear: **BYTEPACK at 4.1 B/seed drags the average down from LZ77's 9.8**. If we could get BYTEPACK to even 6 B/seed, we'd save ~370 seeds (18% reduction).

## Where BYTEPACK Wastes Seeds

### Mode 0 (RAW3): 386 seeds, 1182 bytes (3.1 B/seed) -- THE PROBLEM

Mode 0 encodes 3 raw bytes in 24 bits + a 4-bit repeat counter. It's used when:
- No LZ77 match exists (byte sequence hasn't appeared before)
- No table covers the bytes (not all bytes in mode-6 or mode-7 table)

386 of 856 BYTEPACK seeds (45%) are mode-0. These encode just 1182 bytes -- that's 27% of BYTEPACK bytes but 45% of BYTEPACK seeds.

The math: 25 data bits encoding 3 bytes = 3.0 B/seed theoretical, 3.1 actual. This is fundamentally limited by the bit budget.

### Mode 6 (TABLE5): 395 seeds, 1975 bytes (5.0 B/seed) -- GOOD

Mode 6 uses a 32-char table with 5-bit indices, encoding 5 bytes per seed. 5 × 5 = 25 bits, fits in 28-bit payload. This is already efficient.

### Mode 7 (TABLE5_EXT): 17 seeds, 85 bytes (5.0 B/seed) -- FINE

Extended table, same efficiency as mode 6. Low usage because it covers rarer chars.

## The Three Levers

### Lever 1: Expand Mode-0 from RAW3 to RAW4 (expected: +250 seeds saved)

**Current mode-0 bit layout (25 data bits):**
```
[2:0] mode = 0
[10:3] byte0 (8 bits)
[18:11] byte1 (8 bits)
[26:19] byte2 (8 bits)
[30:27] repeat count (4 bits) -- rarely used
```

**Proposed: mode-0 becomes RAW4 using 6-bit encoding**
```
[2:0] mode = 0
[8:3]   byte0 top-6 bits
[14:9]  byte1 top-6 bits
[20:15] byte2 top-6 bits
[26:21] byte3 top-6 bits
[27]    low-bit selector (0 = top 6 bits match, 1 = escape to current behavior)
```

Wait -- 6-bit encoding only covers 64 values, not 256. That won't work for arbitrary bytes.

**Real proposal: RAW4 via reduced precision is a dead end. The 28-bit payload simply can't hold 4 arbitrary bytes (32 bits needed).**

### Lever 1 (revised): Byte-stuffed RAW4 with restricted alphabet

The insight: mode-0 seeds encode bytes that aren't in ANY table. But these "uncovered" bytes are rare -- they're the long tail. Most mode-0 seeds have 1-2 uncovered bytes mixed with covered bytes.

**Better idea: Hybrid LZ77 + literal escape**

When LZ77 finds a partial match (e.g., 4 of 5 bytes match a prior position), encode the LZ77 match + 1 literal escape byte in a single seed. Currently the encoder can't do this -- it either matches fully or falls back to BYTEPACK mode-0.

**Bit layout for "LZ77_SHORT + 1 literal" (new BYTEPACK mode):**
```
[2:0]   mode = 0 (repurpose)
[15:3]  LZ77 offset (13 bits, up to 8192 back)
[19:16] match length (4 bits, 1-16 bytes)
[27:20] literal byte (8 bits)
```

This encodes (1-16 matched bytes) + 1 literal byte per seed. For a 4+1 case, that's 5 bytes/seed vs current 3.1.

Expected impact: Many of the 386 mode-0 seeds sit between LZ77 matches. A hybrid seed could extend LZ77 runs by 1 byte past where they currently stop, converting mode-0 seeds into longer LZ77 chains.

**Estimated savings: 100-150 seeds (5-7% reduction)**

### Lever 2: Mode-6 file-specific table (seed-stream encoded)

The current mode-6 table is hardcoded for Python source:
```
 etab\nr\'sni,d)(lxop=y0u_:Fc-fm1"
```

For expand.py specifically, this covers ~86.6% of individual bytes. But the "all 5 bytes must be in table" constraint drops effective coverage.

**Proposal: File-specific mode-6 table transported as setup seeds**

Before encoding data, emit 2-3 setup seeds that define a custom 32-char table optimized for THIS file. Use DYN_DICT (strategy 0xD in V3) to transport table entries.

Current DYN_DICT in expand3.py supports adding entries and referencing them. We'd:
1. Analyze byte frequency for the target file
2. Pick top 32 bytes
3. Encode as setup seeds using DYN_DICT or a dedicated mechanism
4. Use the file-specific table for all mode-6 seeds

**Bit layout unchanged -- just the table content changes.**

The challenge: transporting 32 chars costs ~2-3 setup seeds (each seed carries ~7 bytes). For expand.py, this breaks even if it saves 2-3 mode-0 seeds. It would save many more.

**Estimated savings: 50-100 mode-0 seeds convert to mode-6 (2-5% reduction)**

### Lever 3: Two-pass LZ77 with deferred literals

**The biggest architectural change.**

Current flow:
1. Parse left-to-right with DP shortest path
2. Each position: try all strategies, pick best
3. LZ77 matches reference earlier encoded bytes

Problem: LZ77 can only reference bytes that appear EARLIER in the file. The first occurrence of any byte sequence must use BYTEPACK. For a 14KB Python file with lots of unique strings early on, this wastes seeds.

**Proposal: Two-pass encoding**

Pass 1: Identify the top N repeated substrings in the file (not just prefix matches -- suffix too). Emit these as DYN_DICT setup seeds at the start, so LZ77 can reference them from position 0.

Pass 2: Normal DP encoding, but now LZ77 has a richer back-reference pool.

This is how real compression works (DEFLATE does this with the Huffman table). The cost: N setup seeds. The gain: every repeated substring becomes LZ77-referenceable from the start.

For expand.py, the top repeated substrings are:
```
"\n        " (9 bytes, 125 occurrences) -- already caught by setup seeds
"    result = bytearray()\n    " (29 bytes, 8 occurrences)
"   return bytes(result)\n\n" (25 bytes, 8 occurrences)
```

The current encoder already captures these via setup seeds. But it misses shorter patterns:
- `self.` (5 bytes, many occurrences)
- `import ` (7 bytes, several occurrences)
- `def ` (4 bytes, many occurrences)
- `class ` (6 bytes, several)

These are already in DICTIONARY/DICTIONARY_EXT. The real question is whether more aggressive DYN_DICT seeding helps.

**Estimated savings: 30-60 seeds (1-3% reduction)**

## Priority Order

| Priority | Lever | Effort | Expected Gain | Risk |
|----------|-------|--------|---------------|------|
| 1 | LZ77+literal hybrid mode | Medium | 100-150 seeds (5-7%) | Medium -- new decode path |
| 2 | File-specific mode-6 table | Low | 50-100 seeds (2-5%) | Low -- table swap only |
| 3 | Aggressive DYN_DICT seeding | Medium | 30-60 seeds (1-3%) | Low -- uses existing V3 |
| 4 | Hash chain improvements | Low | ~20 seeds (1%) | None -- just tune params |

**Combined estimate: 200-330 seeds saved, bringing bytes/seed from 7.07 to ~8.2-8.9**

## The Hard Truth

Getting bytes/seed above 9.0 requires either:
- **Fundamentally more bits per seed** (32 bits is the constraint)
- **More LZ77 coverage** (already at 73% of positions)
- **Better table coverage** (diminishing returns past 90% byte coverage)

The theoretical maximum with current 32-bit seeds and 16 strategies is probably ~10 B/seed (pure LZ77 on highly repetitive data). For typical Python source, 8-9 B/seed is realistic.

Going above that means either:
1. Multi-seed strategies (2 seeds encoding 20+ bytes)
2. Adaptive seed width (some seeds use 2 pixels)
3. A fundamentally different encoding paradigm

## What I Recommend Building First

**Start with Lever 2 (file-specific mode-6 table).** It's the lowest risk, touches only expand.py and boot3.py, and we have the file-specific table infrastructure already. Run before/after benchmarks on 3-4 test files.

Then tackle Lever 1 (LZ77+literal hybrid) if the gains from Lever 2 aren't sufficient.

Lever 3 is speculative -- pursue only if the first two don't reach 8.0 B/seed.
