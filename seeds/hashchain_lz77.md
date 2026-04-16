# RFL Seed: Hash-Chain LZ77 for Pixelpack Encoder

## Goal
Replace the O(n^2) brute-force LZ77 match finding in boot3.py with a hash-chain approach that runs in O(n) expected time. The decoder (expand3.py, strategy 0xC) already supports LZ77 back-references. The encoder just needs to find them efficiently.

## Context

### What pixelpack does
Pixelpack encodes files as PNG images where each 32-bit RGBA pixel (seed) expands to bytes via BPE + generative strategies. The encoder (boot3.py) uses DP optimal parsing across strategies: BPE, BYTEPACK, DICTX5, DICTX7, LZ77, NIBBLE.

### Current problem
- The encoder has a 120-second timeout. On fibonacci.py (254B), it finishes in ~1s and produces 34 seeds.
- On expand.py (13KB), the encoder TIMES OUT and falls back to V2 with 999 pixels.
- The bottleneck is the O(n^2) LZ77 search in `_find_lz77_at()` which brute-force scans all prior bytes for each position.
- Simulation shows expand.py has 27% LZ77 redundancy -- meaning hash-chain LZ77 could save ~471 seeds on that file alone.

### Existing LZ77 implementation (decoder side)
In expand3.py, strategy 0xC (LZ77_BACKREF) uses:
- Params layout (28 bits): [15:0] offset (16-bit distance back), [27:16] length (12-bit, up to 4096 bytes)
- Copies from accumulated output_buffer at position (len(buffer) - 1 - offset)
- Handles overlapping copies byte-by-byte

### Existing LZ77 implementation (encoder side)
In boot3.py:
- `_make_lz77_seed(offset, length)` packs an LZ77 seed: `(0xC << 28) | (length << 16) | offset`
- `_find_lz77_at(target, pos, emitted)` searches `emitted` (accumulated decoded output) for matches starting at position `pos`. Uses BRUTE FORCE O(n^2) scan.
- The DP parser (`_dp_shortest_path`) includes LZ77 matches but the match generation is the bottleneck.

### What to build
A hash-chain LZ77 implementation in boot3.py that:
1. Uses a hash table indexed by 3-byte sequences (trigrams)
2. Maintains a chain of positions for each hash bucket (like zlib's deflate)
3. For each position, finds the longest match by walking the chain
4. Limits chain length to prevent O(n) worst case per position (e.g., max 32 chain steps)
5. Integrates with the existing `_find_lz77_at()` and `_enumerate_matches_fast()` functions

### Specific implementation notes
- Hash function: `(data[i] << 10 ^ data[i+1] << 5 ^ data[i+2]) & table_mask` where table size is 2^14 = 16384
- Chain: `prev[i] = previous position with same hash`. Walk: `pos = prev[pos]` until 0 or chain_len exhausted.
- Window: only reference positions within last 32768 bytes (matches 16-bit offset field)
- Must produce the SAME LZ77 seeds as the current brute-force approach (same format, same decoder)
- The existing DP parser should work unchanged -- just feed it faster match results

### Files to modify
- `boot3.py`: Add `HashChainLZ77` class, modify `_find_lz77_at()` to use it, modify `_enumerate_matches_fast()` to use it
- DO NOT modify expand3.py (decoder) or expand4.py (boot decoder) -- they already work

### Testing
- fibonacci.py (254B) must still encode to exactly 34 seeds
- The encoder must finish in under 30 seconds on a 10KB Python file
- All existing tests in expand4.py (74 tests) must still pass
- Verify roundtrip: encode -> decode -> compare matches original

### Expected outcome
- fibonacci.py: still 34 seeds (hash-chain finds same matches)
- 1KB Python file: finishes in <5 seconds (currently times out)
- 10KB Python file: finishes in <30 seconds
- Seed count on larger files should decrease because more LZ77 matches are found within the time budget
