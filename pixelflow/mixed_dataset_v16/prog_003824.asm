; DESCRIPTION: Draws a black circle centered at (323, 79) with radius 36.
; PLAN: r0=323(x), r1=79(y), r2=36(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 79
LDI r2, 36
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
