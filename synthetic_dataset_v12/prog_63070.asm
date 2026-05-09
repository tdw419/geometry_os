; DESCRIPTION: Draws a black circle centered at (429, 81) with radius 16.
; PLAN: r0=429(x), r1=81(y), r2=16(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 429
LDI r1, 81
LDI r2, 16
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
