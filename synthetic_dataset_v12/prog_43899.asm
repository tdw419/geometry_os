; DESCRIPTION: Draws a black circle centered at (181, 143) with radius 15.
; PLAN: r0=181(x), r1=143(y), r2=15(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 143
LDI r2, 15
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
