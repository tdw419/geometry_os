# Boot Pixel Proof of Concept

## The Goal

Prove that a single pixel (24-bit RGB or 32-bit RGBA) can encode a **generative recipe** that, when "booted", unfolds into a working program. This is NOT compression -- it's generative expansion. The pixel stores a seed formula, not raw data.

## Context

This project is called **pixelpack**. The concept comes from years of research on pixel-native computing (see RAG research docs on "boot pixel", "pxpyramid", "pattern library"). The core idea:

- One pixel = 24-32 bits of information
- Those bits are NOT the data itself, but instructions/math that GENERATES data
- Like DNA: the pixel is the chromosome, the pattern library + expansion algorithm is the cellular machinery
- The "shared context" (pattern library, expansion rules) acts like a genome that makes the seed meaningful

Previous work in `/home/jericho/zion/apps/pixelpack-dict/` proved dictionary-based pixel encoding can beat gzip by 0.76%. That was warm-up. This is the real goal.

## What We've Already Learned

From the pixelpack-dict experiments:
- A shared dictionary mapping patterns to short markers works
- The marker byte must be rare in the corpus (least-common byte strategy)
- BPE (byte pair encoding) merges help after initial pattern selection
- zlib inside PNG is the compression substrate
- The 2-byte marker system (marker + index) is the reference mechanism

From RAG research doc 232 (encode_to_pixel_pattern_library_and_boot_pixels):
- Binary -> Unicode -> Pixel -> Pattern Pyramid -> Boot Pixels pipeline
- Recursive pattern library that grows across files
- Boot pixels as the apex of a compression pyramid
- The pattern library is "DNA" -- shared context that makes seeds meaningful

## The Hard Constraint

32 bits = ~4 billion possible values. You CANNOT encode arbitrary data in 32 bits. But you CAN encode:
- An index into a shared library (the pixel is a pointer)
- A small number (seed for a PRNG or LFSR)
- A formula/recipe that generates more data
- A compressed instruction sequence for a virtual machine

## What To Build

### Step 1: Design the expansion algorithm

Invent a simple virtual machine or generative system where a 32-bit seed produces meaningful output. Ideas:
- **LFSR-based**: seed initializes a linear feedback shift register, output bits form the program
- **Rule-based cellular automaton**: 32 bits encode initial state + rule number, run N generations to produce bytes
- **Micro-VM**: 32 bits encode a tiny program for a custom VM with ~8 opcodes
- **Fractal formula**: 32 bits encode parameters for an IFS or L-system that generates byte sequences

### Step 2: Prove the round-trip

Take a small real program (e.g., a 50-100 byte "Hello World" in some language). Show that:
1. You can find a 32-bit seed that, when expanded, produces that program
2. The expansion is deterministic (same pixel always produces same output)
3. It's verifiable (we can check the output matches the target)

### Step 3: Build the tools

Create in this directory:
- `expand.py` -- takes a pixel value (RGB/RGBA), runs expansion, outputs bytes
- `find_seed.py` -- takes target bytes, searches for a pixel seed that expands to it
- `boot.py` -- orchestrator: reads a PNG with one pixel, expands, writes output file
- `verify.py` -- verifies round-trip: encode -> expand -> compare to original

### Step 4: Prove it on a real target

Encode a small but real program into a single pixel PNG. Show the PNG. Expand it. Run the expanded program. Document the whole thing.

## Key Questions To Answer

1. What expansion algorithm gives the most useful output per bit of seed?
2. How much of the "meaning" comes from the seed vs the shared expansion rules?
3. What's the practical limit -- what's the largest program we can encode in one pixel?
4. Can we use the pixelpack-dict dictionary as part of the shared context?

## Important

- Start simple. Get a working round-trip FIRST, then optimize.
- The expansion algorithm MUST be deterministic.
- The seed search (find_seed.py) will likely be brute-force at first. That's fine for a PoC.
- Document everything. This is research.
- All code goes in `/home/jericho/zion/projects/pixelpack/`
- Read the existing pixelpack-dict code for reference: `/home/jericho/zion/apps/pixelpack-dict/compress.py`

## Source Directories

- `/home/jericho/zion/projects/pixelpack/` -- where new code goes (create if needed)
- `/home/jericho/zion/apps/pixelpack-dict/` -- reference implementation
