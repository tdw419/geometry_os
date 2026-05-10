; DESCRIPTION: Draws a black circle centered at (195, 116) with radius 74.
; PLAN: r0=195(x), r1=116(y), r2=74(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 116
LDI r2, 74
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
