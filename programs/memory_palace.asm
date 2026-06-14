; Memory Palace v4 - Ultra-compact
; Single highlight bar + selected content only
#define BUF 0x6000
#define SEL 0x5000

LDI r30, 0xFF00
LDI r0, 0
LDI r17, 0x5000
STORE r17, r0

main_loop:
IKEY r15
CMPI r15, 0
JZ r0, nokey
CMPI r15, 27
JNZ r0, noesc
HALT
noesc:
; Up arrow (82) = decrement band
CMPI r15, 82
JNZ r0, nup
LDI r17, 0x5000
LOAD r18, r17
JZ r18, nup
SUBI r18, 1
STORE r17, r18
nup:
; Down arrow (81) = increment band
CMPI r15, 81
JNZ r0, ndn
LDI r17, 0x5000
LOAD r18, r17
CMPI r18, 5
JNZ r0, dg
JMP ndn
dg:
ADDI r18, 1
STORE r17, r18
ndn:
nokey:

; RENDER
LDI r0, 0x0A0A0F
FILL r0

; Top bar
LDI r1, 0
LDI r2, 0
LDI r3, 256
LDI r4, 14
LDI r5, 0x1A1A28
RECTF r1, r2, r3, r4, r5
LDI r20, BUF
STRO r20, "MEMORY PALACE"
LDI r1, 4
LDI r2, 2
LDI r3, BUF
LDI r4, 0xAABBDD
LDI r5, 0x1A1A28
DRAWTEXT r1, r2, r3, r4, r5

; 6 compact nav dots at top-right
; x=180..230, y=4..10, each 6x6 with 2px gap
LDI r17, 0x5000
LOAD r19, r17

; B0 dot
LDI r1, 180
LDI r2, 4
LDI r3, 6
LDI r4, 6
CMPI r19, 0
JNZ r0, d0x
LDI r5, 0xFFFFFF
JMP d0d
d0x:
LDI r5, 0x3366CC
d0d:
RECTF r1, r2, r3, r4, r5

; B1 dot
LDI r1, 190
CMPI r19, 1
JNZ r0, d1x
LDI r5, 0xFFFFFF
JMP d1d
d1x:
LDI r5, 0x229955
d1d:
RECTF r1, r2, r3, r4, r5

; B2 dot
LDI r1, 200
CMPI r19, 2
JNZ r0, d2x
LDI r5, 0xFFFFFF
JMP d2d
d2x:
LDI r5, 0xCC8822
d2d:
RECTF r1, r2, r3, r4, r5

; B3 dot
LDI r1, 210
CMPI r19, 3
JNZ r0, d3x
LDI r5, 0xFFFFFF
JMP d3d
d3x:
LDI r5, 0x666677
d3d:
RECTF r1, r2, r3, r4, r5

; B4 dot
LDI r1, 220
CMPI r19, 4
JNZ r0, d4x
LDI r5, 0xFFFFFF
JMP d4d
d4x:
LDI r5, 0xAA33AA
d4d:
RECTF r1, r2, r3, r4, r5

; B5 dot
LDI r1, 230
CMPI r19, 5
JNZ r0, d5x
LDI r5, 0xFFFFFF
JMP d5d
d5x:
LDI r5, 0x229999
d5d:
RECTF r1, r2, r3, r4, r5

; Color accent bar for selected band (thin left edge)
LDI r1, 0
LDI r2, 16
LDI r3, 3
LDI r4, 224
CMPI r19, 0
JNZ r0, a0x
LDI r5, 0x4187F5
JMP a0d
a0x:
CMPI r19, 1
JNZ r0, a1x
LDI r5, 0x2DB95F
JMP a0d
a1x:
CMPI r19, 2
JNZ r0, a2x
LDI r5, 0xEB9B23
JMP a0d
a2x:
CMPI r19, 3
JNZ r0, a3x
LDI r5, 0x828291
JMP a0d
a3x:
CMPI r19, 4
JNZ r0, a4x
LDI r5, 0xC341C3
JMP a0d
a4x:
LDI r5, 0x37C3C3
a0d:
RECTF r1, r2, r3, r4, r5

; Content: header + up to 3 lines per band
CMPI r19, 0
JNZ r0, p0x
LDI r20, BUF
STRO r20, "PROJECT (24 facts)"
LDI r1, 8
LDI r2, 20
LDI r3, BUF
LDI r4, 0x88AAFF
LDI r5, 0x0A0A0F
DRAWTEXT r1, r2, r3, r4, r5
LDI r20, BUF
STRO r20, "MCP PixelPack GeOS RISC-V"
LDI r1, 8
LDI r2, 34
LDI r3, BUF
LDI r4, 0xA0C8FF
DRAWTEXT r1, r2, r3, r4, r5
LDI r20, BUF
STRO r20, "GasmAgent PixelFS PixelGPT"
LDI r1, 8
LDI r2, 48
LDI r3, BUF
DRAWTEXT r1, r2, r3, r4, r5
JMP fin
p0x:

CMPI r19, 1
JNZ r0, p1x
LDI r20, BUF
STRO r20, "CONVENTION (23 facts)"
LDI r1, 8
LDI r2, 20
LDI r3, BUF
LDI r4, 0x66DD88
LDI r5, 0x0A0A0F
DRAWTEXT r1, r2, r3, r4, r5
LDI r20, BUF
STRO r20, "STRCMP bool SBI v0.2 patch"
LDI r1, 8
LDI r2, 34
LDI r3, BUF
LDI r4, 0x88CC88
DRAWTEXT r1, r2, r3, r4, r5
JMP fin
p1x:

CMPI r19, 2
JNZ r0, p2x
LDI r20, BUF
STRO r20, "ENVIRONMENT (1 fact)"
LDI r1, 8
LDI r2, 20
LDI r3, BUF
LDI r4, 0xFFBB44
LDI r5, 0x0A0A0F
DRAWTEXT r1, r2, r3, r4, r5
LDI r20, BUF
STRO r20, "patch tool reverts on fmt"
LDI r1, 8
LDI r2, 34
LDI r3, BUF
LDI r4, 0xFFD4A0
DRAWTEXT r1, r2, r3, r4, r5
JMP fin
p2x:

CMPI r19, 3
JNZ r0, p3x
LDI r20, BUF
STRO r20, "OTHER (3 facts)"
LDI r1, 8
LDI r2, 20
LDI r3, BUF
LDI r4, 0xAAAACC
LDI r5, 0x0A0A0F
DRAWTEXT r1, r2, r3, r4, r5
LDI r20, BUF
STRO r20, "RISC-V boot AI-First Frm"
LDI r1, 8
LDI r2, 34
LDI r3, BUF
LDI r4, 0x8888AA
DRAWTEXT r1, r2, r3, r4, r5
JMP fin
p3x:

CMPI r19, 4
JNZ r0, p4x
LDI r20, BUF
STRO r20, "USER PROFILE"
LDI r1, 8
LDI r2, 20
LDI r3, BUF
LDI r4, 0xDD88DD
LDI r5, 0x0A0A0F
DRAWTEXT r1, r2, r3, r4, r5
LDI r20, BUF
STRO r20, "Jericho CDT tdw419 5090"
LDI r1, 8
LDI r2, 34
LDI r3, BUF
LDI r4, 0xCC88CC
DRAWTEXT r1, r2, r3, r4, r5
LDI r20, BUF
STRO r20, "Builder sysprog HF Sub"
LDI r1, 8
LDI r2, 48
LDI r3, BUF
DRAWTEXT r1, r2, r3, r4, r5
JMP fin
p4x:

; Band 5
LDI r20, BUF
STRO r20, "AGENT MEMORY (11 notes)"
LDI r1, 8
LDI r2, 20
LDI r3, BUF
LDI r4, 0x66DDDD
LDI r5, 0x0A0A0F
DRAWTEXT r1, r2, r3, r4, r5
LDI r20, BUF
STRO r20, "GeOS75% ollama tokens"
LDI r1, 8
LDI r2, 34
LDI r3, BUF
LDI r4, 0x88CCCC
DRAWTEXT r1, r2, r3, r4, r5

fin:
; Footer
LDI r1, 0
LDI r2, 242
LDI r3, 256
LDI r4, 14
LDI r5, 0x14141E
RECTF r1, r2, r3, r4, r5
LDI r20, BUF
STRO r20, "51 facts 7767 docs 11 notes"
LDI r1, 4
LDI r2, 244
LDI r3, BUF
LDI r4, 0x555566
LDI r5, 0x14141E
DRAWTEXT r1, r2, r3, r4, r5

FRAME
JMP main_loop
