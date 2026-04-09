# ASCII Hex → Pixel Color Map

Every keystroke produces a pixel. The ASCII hex value of the key IS the pixel color.

The value lands in the blue channel. Red and green are zero. So ASCII 0x41 (A) produces pixel #000041 -- a very dark blue. Higher values produce brighter blues.

## How to Read This Table

- **Dec** -- decimal value of the character
- **Hex** -- hex value (this IS the pixel color)
- **Char** -- what you type to produce it
- **Pixel** -- the resulting color as #RRGGBB
- **Swatch** -- rough brightness indicator

## Control Characters (0x00–0x1F)

Not typeable directly, but representable as pixel values in memory.

| Dec | Hex  | Char   | Pixel   | Notes                |
|-----|------|--------|---------|----------------------|
| 0   | 0x00 | NUL    | #000000 | Black (empty)        |
| 1   | 0x01 | SOH    | #000001 |                      |
| 2   | 0x02 | STX    | #000002 |                      |
| 3   | 0x03 | ETX    | #000003 |                      |
| 4   | 0x04 | EOT    | #000004 |                      |
| 5   | 0x05 | ENQ    | #000005 |                      |
| 6   | 0x06 | ACK    | #000006 |                      |
| 7   | 0x07 | BEL    | #000007 | Bell                 |
| 8   | 0x08 | BS     | #000008 | Backspace            |
| 9   | 0x09 | HT     | #000009 | Tab                  |
| 10  | 0x0A | LF     | #00000A | Line feed            |
| 11  | 0x0B | VT     | #00000B |                      |
| 12  | 0x0C | FF     | #00000C |                      |
| 13  | 0x0D | CR     | #00000D | Enter/Return         |
| 14  | 0x0E | SO     | #00000E |                      |
| 15  | 0x0F | SI     | #00000F |                      |
| 16  | 0x10 | DLE    | #000010 |                      |
| 17  | 0x11 | DC1    | #000011 |                      |
| 18  | 0x12 | DC2    | #000012 |                      |
| 19  | 0x13 | DC3    | #000013 |                      |
| 20  | 0x14 | DC4    | #000014 |                      |
| 21  | 0x15 | NAK    | #000015 |                      |
| 22  | 0x16 | SYN    | #000016 |                      |
| 23  | 0x17 | ETB    | #000017 |                      |
| 24  | 0x18 | CAN    | #000018 |                      |
| 25  | 0x19 | EM     | #000019 |                      |
| 26  | 0x1A | SUB    | #00001A |                      |
| 27  | 0x1B | ESC    | #00001B | Escape               |
| 28  | 0x1C | FS     | #00001C |                      |
| 29  | 0x1D | GS     | #00001D |                      |
| 30  | 0x1E | RS     | #00001E |                      |
| 31  | 0x1F | US     | #00001F |                      |

## Printable Characters (0x20–0x7E)

These are the characters you can type. Each one paints a pixel.

### Space and Punctuation (0x20–0x2F)

| Dec | Hex  | Char | Pixel   | Brightness |
|-----|------|------|---------|------------|
| 32  | 0x20 | (space) | #000020 | ░░░░░░░░░░ |
| 33  | 0x21 | !    | #000021 | ░░░░░░░░░░ |
| 34  | 0x22 | "    | #000022 | ░░░░░░░░░░ |
| 35  | 0x23 | #    | #000023 | ░░░░░░░░░░ |
| 36  | 0x24 | $    | #000024 | ░░░░░░░░░░ |
| 37  | 0x25 | %    | #000025 | ░░░░░░░░░░ |
| 38  | 0x26 | &    | #000026 | ░░░░░░░░░░ |
| 39  | 0x27 | '    | #000027 | ░░░░░░░░░░ |
| 40  | 0x28 | (    | #000028 | ░░░░░░░░░░ |
| 41  | 0x29 | )    | #000029 | ░░░░░░░░░░ |
| 42  | 0x2A | *    | #00002A | ░░░░░░░░░░ |
| 43  | 0x2B | +    | #00002B | ░░░░░░░░░░ |
| 44  | 0x2C | ,    | #00002C | ░░░░░░░░░░ |
| 45  | 0x2D | -    | #00002D | ░░░░░░░░░░ |
| 46  | 0x2E | .    | #00002E | ░░░░░░░░░░ |
| 47  | 0x2F | /    | #00002F | ░░░░░░░░░░ |

### Digits (0x30–0x39)

| Dec | Hex  | Char | Pixel   | Brightness |
|-----|------|------|---------|------------|
| 48  | 0x30 | 0    | #000030 | ░░░░░░░░░░ |
| 49  | 0x31 | 1    | #000031 | ░░░░░░░░░░ |
| 50  | 0x32 | 2    | #000032 | ░░░░░░░░░░ |
| 51  | 0x33 | 3    | #000033 | ░░░░░░░░░░ |
| 52  | 0x34 | 4    | #000034 | ░░░░░░░░░░ |
| 53  | 0x35 | 5    | #000035 | ░░░░░░░░░░ |
| 54  | 0x36 | 6    | #000036 | ░░░░░░░░░░ |
| 55  | 0x37 | 7    | #000037 | ░░░░░░░░░░ |
| 56  | 0x38 | 8    | #000038 | ░░░░░░░░░░ |
| 57  | 0x39 | 9    | #000039 | ░░░░░░░░░░ |

### More Punctuation (0x3A–0x40)

| Dec | Hex  | Char | Pixel   | Brightness |
|-----|------|------|---------|------------|
| 58  | 0x3A | :    | #00003A | ░░░░░░░░░░ |
| 59  | 0x3B | ;    | #00003B | ░░░░░░░░░░ |
| 60  | 0x3C | <    | #00003C | ░░░░░░░░░░ |
| 61  | 0x3D | =    | #00003D | ░░░░░░░░░░ |
| 62  | 0x3E | >    | #00003E | ░░░░░░░░░░ |
| 63  | 0x3F | ?    | #00003F | ░░░░░░░░░░ |
| 64  | 0x40 | @    | #000040 | ░░░░░░░░░░ |

### Uppercase Letters (0x41–0x5A)

| Dec | Hex  | Char | Pixel   | Brightness |
|-----|------|------|---------|------------|
| 65  | 0x41 | A    | #000041 | ░░░░░░░░░░ |
| 66  | 0x42 | B    | #000042 | ░░░░░░░░░░ |
| 67  | 0x43 | C    | #000043 | ░░░░░░░░░░ |
| 68  | 0x44 | D    | #000044 | ░░░░░░░░░░ |
| 69  | 0x45 | E    | #000045 | ░░░░░░░░░░ |
| 70  | 0x46 | F    | #000046 | ░░░░░░░░░░ |
| 71  | 0x47 | G    | #000047 | ░░░░░░░░░░ |
| 72  | 0x48 | H    | #000048 | ░░░░░░░░░░ |
| 73  | 0x49 | I    | #000049 | ░░░░░░░░░░ |
| 74  | 0x4A | J    | #00004A | ░░░░░░░░░░ |
| 75  | 0x4B | K    | #00004B | ░░░░░░░░░░ |
| 76  | 0x4C | L    | #00004C | ░░░░░░░░░░ |
| 77  | 0x4D | M    | #00004D | ░░░░░░░░░░ |
| 78  | 0x4E | N    | #00004E | ░░░░░░░░░░ |
| 79  | 0x4F | O    | #00004F | ░░░░░░░░░░ |
| 80  | 0x50 | P    | #000050 | ▓▓▓▓▓░░░░░ |
| 81  | 0x51 | Q    | #000051 | ▓▓▓▓▓░░░░░ |
| 82  | 0x52 | R    | #000052 | ▓▓▓▓▓░░░░░ |
| 83  | 0x53 | S    | #000053 | ▓▓▓▓▓░░░░░ |
| 84  | 0x54 | T    | #000054 | ▓▓▓▓▓░░░░░ |
| 85  | 0x55 | U    | #000055 | ▓▓▓▓▓░░░░░ |
| 86  | 0x56 | V    | #000056 | ▓▓▓▓▓░░░░░ |
| 87  | 0x57 | W    | #000057 | ▓▓▓▓▓░░░░░ |
| 88  | 0x58 | X    | #000058 | ▓▓▓▓▓░░░░░ |
| 89  | 0x59 | Y    | #000059 | ▓▓▓▓▓░░░░░ |
| 90  | 0x5A | Z    | #00005A | ▓▓▓▓▓░░░░░ |

### Bracket Characters (0x5B–0x60)

| Dec | Hex  | Char | Pixel   | Brightness |
|-----|------|------|---------|------------|
| 91  | 0x5B | [    | #00005B | ▓▓▓▓▓░░░░░ |
| 92  | 0x5C | \    | #00005C | ▓▓▓▓▓░░░░░ |
| 93  | 0x5D | ]    | #00005D | ▓▓▓▓▓░░░░░ |
| 94  | 0x5E | ^    | #00005E | ▓▓▓▓▓░░░░░ |
| 95  | 0x5F | _    | #00005F | ▓▓▓▓▓░░░░░ |
| 96  | 0x60 | `    | #000060 | ▓▓▓▓▓░░░░░ |

### Lowercase Letters (0x61–0x7A)

| Dec | Hex  | Char | Pixel   | Brightness |
|-----|------|------|---------|------------|
| 97  | 0x61 | a    | #000061 | ▓▓▓▓▓▓░░░ |
| 98  | 0x62 | b    | #000062 | ▓▓▓▓▓▓░░░ |
| 99  | 0x63 | c    | #000063 | ▓▓▓▓▓▓░░░ |
| 100 | 0x64 | d    | #000064 | ▓▓▓▓▓▓░░░ |
| 101 | 0x65 | e    | #000065 | ▓▓▓▓▓▓░░░ |
| 102 | 0x66 | f    | #000066 | ▓▓▓▓▓▓░░░ |
| 103 | 0x67 | g    | #000067 | ▓▓▓▓▓▓░░░ |
| 104 | 0x68 | h    | #000068 | ▓▓▓▓▓▓░░░ |
| 105 | 0x69 | i    | #000069 | ▓▓▓▓▓▓░░░ |
| 106 | 0x6A | j    | #00006A | ▓▓▓▓▓▓░░░ |
| 107 | 0x6B | k    | #00006B | ▓▓▓▓▓▓░░░ |
| 108 | 0x6C | l    | #00006C | ▓▓▓▓▓▓░░░ |
| 109 | 0x6D | m    | #00006D | ▓▓▓▓▓▓░░░ |
| 110 | 0x6E | n    | #00006E | ▓▓▓▓▓▓░░░ |
| 111 | 0x6F | o    | #00006F | ▓▓▓▓▓▓░░░ |
| 112 | 0x70 | p    | #000070 | ▓▓▓▓▓▓▓▓░ |
| 113 | 0x71 | q    | #000071 | ▓▓▓▓▓▓▓▓░ |
| 114 | 0x72 | r    | #000072 | ▓▓▓▓▓▓▓▓░ |
| 115 | 0x73 | s    | #000073 | ▓▓▓▓▓▓▓▓░ |
| 116 | 0x74 | t    | #000074 | ▓▓▓▓▓▓▓▓░ |
| 117 | 0x75 | u    | #000075 | ▓▓▓▓▓▓▓▓░ |
| 118 | 0x76 | v    | #000076 | ▓▓▓▓▓▓▓▓░ |
| 119 | 0x77 | w    | #000077 | ▓▓▓▓▓▓▓▓░ |
| 120 | 0x78 | x    | #000078 | ▓▓▓▓▓▓▓▓░ |
| 121 | 0x79 | y    | #000079 | ▓▓▓▓▓▓▓▓░ |
| 122 | 0x7A | z    | #00007A | ▓▓▓▓▓▓▓▓░ |

### Remaining Printable (0x7B–0x7E)

| Dec | Hex  | Char | Pixel   | Brightness |
|-----|------|------|---------|------------|
| 123 | 0x7B | {    | #00007B | ▓▓▓▓▓▓▓▓░ |
| 124 | 0x7C | \|   | #00007C | ▓▓▓▓▓▓▓▓▓ |
| 125 | 0x7D | }    | #00007D | ▓▓▓▓▓▓▓▓▓ |
| 126 | 0x7E | ~    | #00007E | ▓▓▓▓▓▓▓▓▓ |

### DEL (0x7F)

| Dec | Hex  | Char | Pixel   | Brightness |
|-----|------|------|---------|------------|
| 127 | 0x7F | DEL  | #00007F | ▓▓▓▓▓▓▓▓▓ |

## The Brightness Problem

All 95 printable ASCII characters produce pixels from #000020 to #00007E. That's a range of 94 in the blue channel out of 255. On a screen, these are ALL very dark. The difference between space (#000020) and tilde (#00007E) is barely perceptible -- two shades of near-black blue.

This matters because if you're painting programs by typing, you can't visually distinguish the pixels. `A` and `Z` look almost identical.

### Solutions

1. **Palette remapping.** The ASCII hex value is the logical identity, but the display color goes through a palette lookup. Pixel value 0x41 logically means "the color for A", but the screen renders it as whatever the palette says. This is how real GPUs work -- pixel values are indices, not literal colors.

2. **Spread across channels.** Instead of stuffing everything into blue, distribute across RGB:
   - Low values (0x00-0x3F) → primarily red
   - Mid values (0x40-0x7F) → primarily green
   - High values (0x80-0xFF) → primarily blue
   
   This gives visible color variation without changing the pixel values.

3. **Extended range.** If pixel values can go beyond ASCII (0x80-0xFF), the full 0x00-0xFF range maps naturally to a full brightness gradient in any single channel, or a richer multi-channel palette.

4. **Zoom + labels.** The zoom renderer already blows pixels up to 8x8 cells. At that scale, each cell can show the character label inside it, making identity obvious regardless of color similarity.

The recommended approach is option 1 (palette lookup) plus option 4 (zoom labels). The pixel value stays pure ASCII hex, the display is whatever makes the program readable, and the zoom renderer labels each cell with its character for precision.
