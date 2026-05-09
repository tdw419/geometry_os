; DESCRIPTION: Draws a black circle centered at (156, 95) with radius 43.
; PLAN: r0=156(x), r1=95(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 95
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
