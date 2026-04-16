# PIXELPACK Specification

A pixel encoding system where each RGBA pixel is a 32-bit seed that deterministically
expands into a byte sequence. Files are encoded as PNG images; decoding extracts seeds
from pixel values and expands them sequentially.

---

## 1. Seed Format

```
 31  28 27                                                    0
+------+------------------------------------------------------+
|STRAT |                    PAYLOAD (28 bits)                  |
+------+------------------------------------------------------+
```

- **Strategy** (bits 31-28): selects the expansion algorithm (0x0-0xF)
- **Payload** (bits 27-0): strategy-specific parameters

**Seed to RGBA:**
```
R = (seed >> 24) & 0xFF
G = (seed >> 16) & 0xFF
B = (seed >> 8)  & 0xFF
A =  seed        & 0xFF
```

**RGBA to Seed:**
```
seed = (R << 24) | (G << 16) | (B << 8) | A
```

---

## 2. Strategy Reference

### Strategy 0x0-0x6: DICT_N

Concatenate N entries from the 16-entry base DICTIONARY using 4-bit indices.

```
Payload: [I0:4][I1:4]...[I(N-1):4]  (N x 4-bit indices, LSB-first)
```

| Strategy | Name    | Entries | Payload bits used |
|----------|---------|---------|-------------------|
| 0x0      | DICT_1  | 1       | 4                 |
| 0x1      | DICT_2  | 2       | 8                 |
| 0x2      | DICT_3  | 3       | 12                |
| 0x3      | DICT_4  | 4       | 16                |
| 0x4      | DICT_5  | 5       | 20                |
| 0x5      | DICT_6  | 6       | 24                |
| 0x6      | DICT_7  | 7       | 28                |

**Example:** `0x00000037` = DICT_1, index 7 = `b'def '`
**Example:** `0x10000039` = DICT_2, indices [9,0] = `b'main'` + `b'print('` = `b'mainprint('`

### Strategy 0x7: NIBBLE

7 nibbles (4-bit values) each index into NIBBLE_TABLE.

```
Payload: [N0:4][N1:4][N2:4][N3:4][N4:4][N5:4][N6:4]  (7 x 4 bits = 28 bits)
Output:  7 bytes (one per nibble lookup)
```

**Example:** `0x700000CC` = NIBBLE, indices [C,0,0,0,0,0,0] = NIBBLE_TABLE[12] + 6x NIBBLE_TABLE[0]
= `0x41, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00` = `b'A\x00\x00\x00\x00\x00\x00'`

### Strategy 0x8: DICTX5

5 entries from the 32-entry DICTIONARY_EXT using 5-bit indices.

```
Payload: [I0:5][I1:5][I2:5][I3:5][I4:5]  (5 x 5 bits = 25 bits)
```

**Example:** `0x80000007` = DICTX5, indices [7,0,0,0,0] = `b'def '` + 4x `b'print('`

### Strategy 0x9: BPE

4 x 7-bit indices into the 128-entry BPE_PAIR_TABLE. Index 0 = terminator
(shorter outputs). Each non-zero index produces a 2-byte pair.

```
Payload: [I0:7][I1:7][I2:7][I3:7]  (4 x 7 bits = 28 bits)
Output:  0-8 bytes (terminator stops early)
```

**Example:** `0x90000005` = BPE, index 5 = `b'in'` (then terminator at 0)

**Example:** `0x90000A01` = BPE, indices [1,0,...] = `b'  '` (terminator after first pair)
- params = 1 | (0 << 7) | (0 << 14) | (0 << 21) = 0x01
- seed = 0x90000001

### Strategy 0xA: DICTX7

7 entries from SUB_DICT (DICTIONARY_EXT entries 16-31) using 4-bit indices.

```
Payload: [I0:4][I1:4][I2:4][I3:4][I4:4][I5:4][I6:4]  (7 x 4 bits = 28 bits)
```

**Example:** `0xA00000000` = DICTX7, all index 0 = DICTIONARY_EXT[16] x 7 = `b'x'` x 7 = `b'xxxxxxx'`

### Strategy 0xB: RLE

Run-length encoded repeating pattern.

```
Payload: [byte_a:8][byte_b:8][count_a:4][count_b:4][repeats:4]
Output:  repeats * (byte_a * (count_a+1) + byte_b * (count_b+1))
```

**Example:** `0xB00100101` = RLE, byte_a=0x01, byte_b=0x00, count_a=1, count_b=0, repeats=1
= 2 bytes: `[0x01, 0x01]`

### Strategy 0xC: XOR_CHAIN

XOR chain from a start byte.

```
Payload: [start:8][key:8][mask:8][count:4]
Output:  count+1 bytes
  val[0] = start
  val[i] = (val[i-1] ^ key) & mask   (mask=0 treated as 0xFF)
  if val == 0: val = key
```

**Example:** `0xC01000003` = XOR_CHAIN, start=1, key=0, mask=0x10, count=3
= 4 bytes: `[0x01, 0x00→key, ...]`

### Strategy 0xD: LINEAR

Linear byte sequence with optional modifier.

```
Payload: [start:8][step:8][count:4][modifier:8]
Output:  count+1 bytes
  val[0] = start
  val[i] = val[i-1] + step  (step signed: >127 means negative)
  if i is odd and modifier != 0: val[i] ^= modifier
```

**Example:** `0xD00010003` = LINEAR, start=0, step=0x10=16, count=3, modifier=0
= 4 bytes: `[0x00, 0x10, 0x20, 0x30]`

### Strategy 0xE: BYTEPACK

Direct byte encoding with 8 sub-modes. The mode field occupies bits [2:0] of params,
data occupies bits [27:3] (25 bits).

```
Params: [mode:3][data:25]
```

#### Mode 0: Raw Bytes

```
Data: [b0:8][b1:8][b2:8][extra:4]
Output: [b0, b1, b2] if extra==0, else [b0, b1, b2] + [b0]*extra
```
Note: data is 25 bits, so extra is effectively 0 or 1 (1 bit at position 24).

**Example:** `0xE0000041` (approx) = BYTEPACK mode 0, b0=0x41='A', b1=0, b2=0 = `b'A\x00\x00'`

#### Mode 1: XOR Delta

```
Data: [base:8][d1:8][d2:8][extra:4]
Output: [base, base^d1, (base^d1)^d2] + optional repeat of last byte
```

#### Mode 2: ADD Delta

```
Data: [base:8][d1:8][d2:8][d3:4]
Output: [base, (base+d1)&0xFF, (base+d1+d2)&0xFF] + optional 4th byte
```

#### Mode 3: Compact Table (6 chars)

```
Data: [I0:4][I1:4][I2:4][I3:4][I4:4][I5:4]  (6 x 4 bits = 24 bits)
Output: 6 bytes from lookup table
```

Default table: `' \netnari=:s(,lfd'` (index 0=space, 1=newline, 2='e', ...)

When a file-specific table is set (via `bp8table` PNG metadata), this mode uses
that table instead. See Section 6.

**Example:** `0xE60000000` = mode 3, all indices 0 = 6 spaces `b'      '`

#### Mode 4: 7-bit Bytes

```
Data: [b0:7][b1:7][b2:7][b3:7]  (4 x 7 bits = 28 bits, but data is 25 bits so b3 is limited)
Output: [b0, b1, b2, b3]
```

#### Mode 5: Base + Nibble Offsets

```
Data: [base:8][n0:4][n1:4][n2:4][n3:4]  (8 + 4x4 = 24 bits)
Output: [base+n0, base+n1, base+n2, base+n3]
```

#### Mode 6: 32-char Table (5 chars)

```
Data: [I0:5][I1:5][I2:5][I3:5][I4:5]  (5 x 5 bits = 25 bits)
Output: 5 bytes from 32-char Python-source table
```

Table: `' etnsa=riodp_lf()ubcmx:g,0hy"\'.-[]vF2<E#TN>kP3+BwADRO4{}5L&'`
(This is the top 32 most frequent characters in Python source code, ~90.6% coverage)

#### Mode 7: Secondary 32-char Table (5 chars)

Same layout as mode 6 but uses the secondary table (characters ranked 33-64).

Table: `'.1[]vF27<E#TN>kP3CwBADO4{}5L&6S8GMjXzq9H;Y/!U*KWQ%JV\\@Z^~`|'` (first 32 chars)

### Strategy 0xF: TEMPLATE

Template string + XOR substitution + 2 extra bytes.

```
Payload: [idx:4][xor_key:8][extra1:8][extra2:8]
Output: template[idx] with each byte XOR'd by xor_key, then extra1 and extra2 appended
```

Templates:
```
 0: b'Hello, World!\n'    4: b'mov r0, #1\n'    8: b'ld a, 0\n'     12: b'fn f()\n'
 1: b'print("hi")\n'      5: b'AAAA'             9: b'push 42\n'    13: b'pub fn\n'
 2: b'echo hello\n'       6: b'BBBB'            10: b'x = 1\n'     14: b'val x\n'
 3: b'int main(){}\n'     7: b'CCCC'            11: b'a = b\n'     15: b'let x\n'
```

**Example:** `0xF00000000` = TEMPLATE, idx=0, xor_key=0, extras=[0,0]
= `b'Hello, World!\n\x00\x00'`

---

## 3. Dictionary Contents

### DICTIONARY (16 entries, indices 0-15)

| Idx | Bytes      | Description           |
|-----|------------|-----------------------|
| 0   | `b'print('`| Python print call (6B)|
| 1   | `b')'`     | close paren (1B)      |
| 2   | `b'"'`     | double quote (1B)     |
| 3   | `b'Hello'` | Hello (5B)            |
| 4   | `b'\n'`    | newline (1B)          |
| 5   | `b'echo '` | shell echo (5B)       |
| 6   | `b'World'` | World (5B)            |
| 7   | `b'def '`  | Python def (4B)       |
| 8   | `b'42'`    | common value (2B)     |
| 9   | `b'main'`  | main function (4B)    |
| 10  | `b'()'`    | empty parens (2B)     |
| 11  | `b', '`    | comma space (2B)      |
| 12  | `b'!'`     | exclamation (1B)      |
| 13  | `b'void '` | C keyword (5B)        |
| 14  | `b'{'`     | open brace (1B)       |
| 15  | `b'}'`     | close brace (1B)      |

### DICTIONARY_EXT (32 entries, indices 0-31)

Entries 0-15 are identical to DICTIONARY. Entries 16-31:

| Idx | Bytes       | Description           |
|-----|-------------|-----------------------|
| 16  | `b'x'`      | variable x (1B)       |
| 17  | `b'='`      | assignment (1B)       |
| 18  | `b'+'`      | plus (1B)             |
| 19  | `b'-'`      | minus (1B)            |
| 20  | `b'*'`      | multiply (1B)         |
| 21  | `b';'`      | semicolon (1B)        |
| 22  | `b'1'`      | literal 1 (1B)        |
| 23  | `b'0'`      | literal 0 (1B)        |
| 24  | `b'if '`    | if keyword (3B)       |
| 25  | `b'return '`| return keyword (8B)   |
| 26  | `b'int '`   | int type (4B)         |
| 27  | `b'for '`   | for keyword (4B)      |
| 28  | `b'while '` | while keyword (6B)    |
| 29  | `b'class '` | class keyword (6B)    |
| 30  | `b' '`      | space (1B)            |
| 31  | `b'fn '`    | fn keyword (3B)       |

### SUB_DICT (= DICTIONARY_EXT[16:32])

Same as DICTIONARY_EXT entries 16-31, re-indexed 0-15 for DICTX7.

### NIBBLE_TABLE (16 entries, indices 0-15)

| Idx | Hex    | ASCII  | Idx | Hex    | ASCII |
|-----|--------|--------|-----|--------|-------|
| 0   | 0x00   | NUL    | 8   | 0x2C   | `,`   |
| 1   | 0x0A   | LF     | 9   | 0x3A   | `:`   |
| 2   | 0x20   | SP     | 10  | 0x3B   | `;`   |
| 3   | 0x21   | `!`    | 11  | 0x3D   | `=`   |
| 4   | 0x22   | `"`    | 12  | 0x41   | `A`   |
| 5   | 0x28   | `(`    | 13  | 0x61   | `a`   |
| 6   | 0x29   | `)`    | 14  | 0x7B   | `{`   |
| 7   | 0x2F   | `/`    | 15  | 0x7D   | `}`   |

### BPE_PAIR_TABLE (128 entries, indices 0-127)

Index 0 = empty (terminator). Indices 1-127 = 2-byte pairs from Python source corpus:

| Idx | Pair   | Idx | Pair   | Idx | Pair   | Idx | Pair   |
|-----|--------|-----|--------|-----|--------|-----|--------|
| 0   | (end)  | 32  | `le`   | 64  | `li`   | 96  | `b\n`  |
| 1   | `  `   | 33  | `st`   | 65  | ` b`   | 97  | `(n`   |
| 2   | `\n `  | 34  | ` r`   | 66  | `f.`   | 98  | `(i`   |
| 3   | `se`   | 35  | `he`   | 67  | ` n`   | 99  | `i)`   |
| 4   | `e `   | 36  | ` f`   | 68  | `na`   | 100 | `n)`   |
| 5   | `in`   | 37  | `\n\n` | 69  | `ur`   | 101 | `b)`   |
| 6   | `, `   | 38  | `al`   | 70  | `ng`   | 102 | `b,`   |
| 7   | ` i`   | 39  | `is`   | 71  | `io`   | 103 | `a,`   |
| 8   | `re`   | 40  | `ar`   | 72  | `tr`   | 104 | `(1`   |
| 9   | ` s`   | 41  | `ne`   | 73  | `ss`   | 105 | `(2`   |
| 10  | `s `   | 42  | `lf`   | 74  | `to`   | 106 | `0)`   |
| 11  | `er`   | 43  | `ti`   | 75  | `il`   | 107 | `1)`   |
| 12  | ` t`   | 44  | `an`   | 76  | `rn`   | 108 | `2,`   |
| 13  | `on`   | 45  | `nt`   | 77  | `# `   | 109 | `0:`   |
| 14  | `or`   | 46  | ` c`   | 78  | `fi`   | 110 | `1:`   |
| 15  | `el`   | 47  | ` o`   | 79  | `tu`   | 111 | `<=`   |
| 16  | `t `   | 48  | ` d`   | 80  | `__`   | 112 | `+ `   |
| 17  | `:\n`  | 49  | `d `   | 81  | `ex`   | 113 | ` {`   |
| 18  | `n `   | 50  | `r `   | 82  | ` m`   | 114 | `f"`   |
| 19  | `th`   | 51  | `""`   | 83  | `):`   | 115 | `"f`   |
| 20  | `at`   | 52  | `ta`   | 84  | `ef`   | 116 | `{i`   |
| 21  | `= `   | 53  | `co`   | 85  | `ge`   | 117 | `{f`   |
| 22  | ` a`   | 54  | `if`   | 86  | `ri`   | 118 | `}"`   |
| 23  | `f `   | 55  | `ro`   | 87  | `ce`   | 119 | `})`   |
| 24  | `en`   | 56  | `ra`   | 88  | ` p`   | 120 | `ib`   |
| 25  | `me`   | 57  | ` e`   | 89  | `la`   | 121 | `ci`   |
| 26  | `et`   | 58  | `ed`   | 90  | ` "`   | 122 | `bo`   |
| 27  | `te`   | 59  | `==`   | 91  | `pe`   | 123 | `i(`   |
| 28  | ` =`   | 60  | `am`   | 92  | `e:`   | 124 | `cc`   |
| 29  | `es`   | 61  | `nd`   | 93  | `0\n`  | 125 | `nf`   |
| 30  | `)\n`  | 62  | `as`   | 94  | `1\n`  | 126 | `0,`   |
| 31  | `de`   | 63  | `it`   | 95  | `b\n`  | 127 | `++`   |

### BYTEPACK Mode 3 Default Table

```
Index: 0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15
Char:  SP \n  e  t  n  a  r  i  =  :  s  (  ,  l  f  d
```
(Hex: 20 0A 65 74 6E 61 72 69 3D 3A 73 28 2C 6C 66 64)

### BYTEPACK Mode 6 Table (32 chars)

```
' etnsa=riodp_lf()ubcmx:g,0hy"\'.-[]vF2<E#TN>kP3+BwADRO4{}5L&'
```
~90.6% coverage of Python source characters.

### BYTEPACK Mode 7 Table (32 chars)

```
'.1[]vF27<E#TN>kP3CwBADO4{}5L&6S8GMjXzq9H;Y/!U*KWQ%JV\\@Z^~`|'
```
Characters ranked 33-64 by Python source frequency.

---

## 4. PNG Format

### Pixel Encoding

Each pixel is stored as 8-bit RGBA (color type 6 in IHDR). The seed is reconstructed as:
```
seed = (R << 24) | (G << 16) | (B << 8) | A
```

Pixels are stored left-to-right, top-to-bottom. Each row has a filter byte prefix (value 0 = None).

### Chunk Structure

```
PNG Signature: 89 50 4E 47 0D 0A 1A 0A
IHDR:  width, height, bit_depth=8, color_type=6 (RGBA), compression=0, filter=0, interlace=0
tEXt:  metadata key-value pairs (see below)
IDAT:  zlib-compressed pixel data
IEND:  empty
```

### Metadata tEXt Chunks

| Key       | Value            | Version | Description                                |
|-----------|------------------|---------|--------------------------------------------|
| `seedcnt` | decimal integer  | V2+     | Number of real seeds (excluding padding)   |
| `t3mode`  | `"1"`            | V3      | Enables context-dependent expansion        |
| `dict_only`| decimal integer | V3      | Number of setup seeds at start (no output) |
| `xor_mode`| `"true"`         | V3      | Enables XOR channel between seeds          |
| `bp8table`| hex string       | V3      | File-specific BYTEPACK mode 3 table (32 hex chars = 16 bytes)|

---

## 5. V3 Context Expansion

When `t3mode=1` is present, expansion uses an `ExpandContext` object that accumulates
state across seed expansions.

### ExpandContext

```
output_buffer: bytearray  - all previously expanded bytes
dyn_dict: list[bytes]     - dynamic dictionary entries
prev_seed: int            - previous raw seed (for XOR channel)
xor_mode: bool            - whether XOR channel is active
```

### Strategy Remapping in V3

| Strategy | V1 Behavior          | V3 Behavior                                      |
|----------|----------------------|--------------------------------------------------|
| 0x0-0xB  | Delegated to V1      | Same as V1, output appended to context buffer    |
| 0xC      | XOR_CHAIN            | **LZ77_BACKREF**: copy from output_buffer         |
| 0xD      | LINEAR               | **DYN_DICT**: add/reference dynamic dict entries  |
| 0xE      | BYTEPACK             | Same as V1, output appended to context buffer    |
| 0xF      | TEMPLATE             | Same as V1, output appended to context buffer    |

### LZ77 Back-Reference (Strategy 0xC in V3)

```
Payload: [offset:16][length:12]
  offset: distance back from end of output_buffer
  length: number of bytes to copy
```

Start position: `buf_start = len(output_buffer) - 1 - offset`
Copy `length` bytes from `output_buffer[buf_start:]`, supporting overlapping copies
(byte-by-byte copy so that repeated patterns expand correctly).

### Dynamic Dictionary (Strategy 0xD in V3)

**Add mode** (bit 27 = 1):
```
Payload bit 27 = 1
Bits 26:24 = entry count (1-7, 0 means 1)
Bits 23:0  = 4-bit indices into base DICTIONARY (up to 6 entries)
```
Expands dictionary entries, adds result to dyn_dict, AND emits as output.

**Reference mode** (bit 27 = 0):
```
Payload bits 26:0 = index into dynamic dictionary
```
Emits the bytes stored at that dyn_dict index.

### Setup Seeds

The first `dict_only` seeds in the seed stream are "setup seeds". They expand into
the reference buffer (so LZ77 can reference their content) but do NOT produce output.
Setup seeds always use V1 strategies (no context needed).

### XOR Channel

When `xor_mode=true`, before expanding each seed (except the first):
```
seed = seed XOR previous_seed
```
This allows different raw pixel values to decode to the same logical seed.

---

## 6. File-Specific BYTEPACK Table

When the `bp8table` tEXt chunk is present in a V3 PNG:

1. Decode the hex string (32 hex chars = 16 bytes)
2. Use these 16 bytes as the BYTEPACK mode 3 lookup table
3. The table replaces the default `' \netnari=:s(,lfd'` for the duration of expansion
4. After expansion completes, the table is reset to default

The table is built from the input file's byte frequency distribution:
- Index 0 = most frequent byte in the file
- Index 15 = 16th most frequent byte
- Only used when it improves coverage by >3% over the default table

This allows mode 3 to achieve higher coverage on non-Python files.

---

## 7. Encoding Algorithm Overview

The V3 encoder (`encode_v3`) uses a multi-phase approach:

### Phase 1: V2 Baseline

Encode the input using V2 multi-seed DP encoding as a baseline pixel count.

### Phase 2: File-Specific Table

Build an optimal 16-char BYTEPACK table from byte frequency analysis. If the
optimal table improves coverage by >3%, activate it for encoding.

### Phase 3: Setup Pattern Analysis

Scan for repeated substrings that are expensive in V1 but cheap via LZ77 after
setup. For each candidate:
- Compute V1 cost (seeds needed to encode one occurrence)
- Compute setup cost (seeds to pre-emit the pattern)
- Net savings = `v1_cost * occurrences - setup_cost - occurrences`

Select top patterns that don't overlap, limited to 50 setup seeds total.

### Phase 4: DP Optimal Parsing

Enumerate all possible strategy matches at every position in the target:
- **V1 matches**: DICT_N, DICTX5, DICTX7, NIBBLE, BPE, BYTEPACK
- **LZ77 matches**: back-references into setup_buffer + already-encoded prefix

Use BFS/DP shortest-path from position 0 to len(target), where each edge has cost 1
(one seed). This finds the minimum-seed encoding.

### Phase 5: Consolidation

Post-DP optimization: replace runs of short (<=5 byte) non-LZ77 seeds with single
LZ77 seeds when the combined bytes appear earlier in the target.

### Phase 6: Comparison

The encoder tries both with-setup and without-setup paths, picks the one with
fewer total seeds. Never uses more pixels than the V2 baseline.
