; DESCRIPTION: Draws a black circle centered at (64, 145) with radius 36.
; PLAN: r0=64(x), r1=145(y), r2=36(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 64
LDI r1, 145
LDI r2, 36
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
