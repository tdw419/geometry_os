; DESCRIPTION: Draws a black circle centered at (128, 179) with radius 26.
; PLAN: r0=128(x), r1=179(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 179
LDI r2, 26
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
