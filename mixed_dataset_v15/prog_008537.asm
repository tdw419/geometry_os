; DESCRIPTION: Draws a black circle centered at (116, 14) with radius 11.
; PLAN: r0=116(x), r1=14(y), r2=11(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 14
LDI r2, 11
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
