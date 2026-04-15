# pixelpack

One pixel. A working program.

A single pixel (32-bit RGBA) encodes a generative recipe that, when booted, expands into a runnable program. This is not compression. The pixel stores a formula, not data. Like DNA, the pixel is a seed that needs cellular machinery to become something.

## The Idea

A pixel has 4 channels: R, G, B, A. That's 32 bits. 32 bits is not enough to store a program. But 32 bits IS enough to store a recipe -- a set of instructions for a generative process that produces a program.

The recipe works because of **shared context**. The pixel alone is meaningless, just like DNA without a cell. The "cellular machinery" here is a set of 16 expansion strategies -- recipes for generating bytes from a small number of parameters. The pixel selects which recipe to run and supplies the parameters.

```
32-bit seed (one pixel)
    |
    +-- top 4 bits: which recipe to use (0-F)
    +-- bottom 28 bits: parameters for that recipe
    |
    v
Recipe executes
    |
    v
Bytes come out
    |
    v
Those bytes ARE a working program
```

## How It Works

### The Seed Format

Every 32-bit seed is split into two parts:

```
[SSSS] [PPPPPPPPPPPPPPPPPPPPPPPPPPPP]
 ^---^ ^----------------------------^
 4 bits        28 bits
 strategy      parameters
```

- **Strategy** (top 4 bits, 0x0-0xF): selects one of 16 expansion methods
- **Parameters** (bottom 28 bits): feeds into the chosen strategy

### The 16 Strategies

The strategies are the "genome" -- shared context that gives meaning to the seed.

| Hex | Name | What it does | Max output |
|-----|------|-------------|------------|
| 0-6 | DICT_N | Concatenate N entries (1-7) from a 16-word dictionary using 4-bit indices | ~35 bytes |
| 7 | NIBBLE | 7 nibbles each look up a byte in a common-symbol table | 7 bytes |
| 8 | DICTX5 | 5 entries from a 32-word extended dictionary using 5-bit indices | ~40 bytes |
| 9 | DICTX6 | 6 entries from extended dictionary entries 16-31 | ~18 bytes |
| A | DICTX7 | 7 entries from extended dictionary entries 16-31 | ~21 bytes |
| B | RLE | Run-length encoded patterns (byte A x count A + byte B x count B, repeated) | ~512 bytes |
| C | XOR_CHAIN | XOR chain: start byte, each next = (prev XOR key) AND mask | 16 bytes |
| D | LINEAR | Linear sequence: start, start+step, start+2*step, with XOR modifier | 16 bytes |
| E | BYTEPACK | Direct byte encoding with 8 sub-modes (raw, XOR delta, ADD delta, nibble, etc.) | 7 bytes |
| F | TEMPLATE | XOR substitution on 16 built-in program templates + 2 extra bytes | ~16 bytes |

### The Dictionary

The core strategies (0x0-0x6) use a shared 16-entry dictionary of programming fragments:

```
Index  Fragment   Length
0      print(       6
1      )            1
2      "            1
3      Hello        5
4      \n           1
5      echo         5
6      World        5
7      def          4
8      42           2
9      main         4
10     ()           2
11     ,            2
12     !            1
13     void         5
14     {            1
15     }            1
```

An extended dictionary adds 16 more entries (x, =, +, -, *, ;, 1, 0, if, return, int, for, while, class, space, fn) for strategies 8-A.

The dictionary IS the shared context. A pixel that contains indices [0, 2, 3, 2, 1, 4] means: concatenate dictionary entries 0, 2, 3, 2, 1, 4 = `print(` + `"` + `Hello` + `"` + `)` + `\n` = `print("Hello")\n`. One pixel. Working Python program.

### An Extended Dictionary Example

Strategy 8 (DICTX5) uses 5-bit indices into the full 32-entry dictionary. With 25 bits for indices and 3 bits spare, this can build longer programs from richer fragments. For example, indices [0, 8, 1, 4] in the base dictionary give `print(` + `42` + `)` + `\n` = `print(42)\n`.

## The Pipeline

```
ENCODE (file -> pixel):
  1. Read target bytes
  2. find_seed.py searches all 16 strategies analytically
  3. Each strategy inverts its expansion: given target bytes, compute what parameters would produce them
  4. First matching seed wins
  5. boot.py writes the seed as a 1x1 RGBA PNG

DECODE (pixel -> file):
  1. boot.py reads the 1x1 PNG, extracts RGBA -> 32-bit seed
  2. expand.py runs the strategy selected by top 4 bits
  3. Strategy generates bytes from the 28-bit parameter
  4. Output bytes are the original program
  5. Execute it
```

## Proven Examples

All 6 targets pass full round-trip: encode to pixel, decode back, verify match, run the program.

| Target program | Pixel (RGBA) | Seed | Expansion |
|---------------|-------------|------|-----------|
| `print("Hello")\n` | (80, 65, 35, 32) | 0x50412320 | 15B from 32 bits (3.8x) |
| `echo Hello\n` | (32, 0, 4, 53) | 0x20000435 | 11B from 32 bits (2.8x) |
| `42\n` | (16, 0, 0, 72) | 0x10000048 | 3B from 32 bits (0.8x) |
| `Hello, World!\n` | (64, 4, 198, 179) | 0x4004C6B3 | 14B from 32 bits (3.5x) |
| `print(42)\n` | (48, 0, 65, 128) | 0x30004180 | 10B from 32 bits (2.5x) |
| `void main(){}\n` | (80, 79, 234, 157) | 0x504FEA9D | 14B from 32 bits (3.5x) |

The Python programs actually run and produce correct output.

## The Key Insight

This is NOT compression. Compression takes N bits and makes them smaller. This takes 32 bits and GENERATES more bits from nothing but a recipe.

The reason it works: most of the "meaning" lives in the shared context (the strategies + dictionary), not in the seed. The seed is a pointer into a space of known recipes. Like how "JMP 0x42" means nothing without a CPU to execute it, the pixel means nothing without the expander.

This is the DNA analogy made literal:
- DNA (the pixel): a small sequence that encodes instructions
- Ribosomes (the expander): machinery that reads those instructions and produces proteins (bytes)
- The genome (dictionary + strategies): shared infrastructure that makes the instructions meaningful

## Files

```
pixelpack/
  expand.py      The SEED-VM. 16 expansion strategies. Takes a 32-bit seed, produces bytes.
  find_seed.py   Analytical seed search. Inverts each strategy to find seeds for target bytes.
  boot.py        PNG encoder/decoder. Writes a 1x1 RGBA PNG, reads it back.
  verify.py      Round-trip test suite. 6 targets, all pass.
```

## Usage

```bash
# Verify the proof
python3 verify.py

# Encode a program into a pixel
python3 boot.py encode program.py boot_pixel.png

# Decode a pixel back into a program
python3 boot.py decode boot_pixel.png recovered.py

# Run the demo
python3 boot.py demo

# Expand a seed directly
python3 expand.py 50412320
```

## Limitations (Honest Assessment)

1. **The dictionary is hand-picked.** It knows about "print", "Hello", "void", "main". The proof works because we chose targets the dictionary can represent. Arbitrary programs won't work unless their byte sequences happen to decompose into dictionary entries.

2. **32 bits is 32 bits.** The maximum program we can encode depends on how well it decomposes into dictionary fragments. The best case is ~35 bytes (7 dictionary entries averaging 5 bytes each). Most real programs are much larger.

3. **The search is analytical, not brute-force.** Each strategy has a known parameter layout, so find_seed.py can compute the inverse. This is fast but means only programs that fit a strategy's output pattern can be encoded.

4. **Not a general-purpose encoder.** You can't point this at an arbitrary file and expect it to work. It works on programs that are composed of dictionary fragments.

## Where This Could Go

The current proof shows the mechanism works. To scale up:

- **Larger dictionary:** More entries = more programs representable with fewer indices
- **Multi-pixel seeds:** A 2x2 image gives 128 bits, a 4x4 gives 512 bits. More bits = more complex recipes
- **Chained expansion:** One pixel expands to a program that, when run, generates more pixels that expand further
- **Geometry OS integration:** A boot pixel that expands into assembly code for the Geometry OS VM

## History

This project sits on years of research. The original concept -- "boot pixels" that encode programs as pixel colors -- traces back to early PXOS design work. The pixelpack-dict project (0.9924x gzip) proved the dictionary mechanism works. This project proves the generative expansion mechanism works.

Built with the Recursive Feedback Loop (RFL) -- 5 iterations over 71 minutes, each one refining the design, fixing bugs, and adding capabilities.
