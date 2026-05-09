; DESCRIPTION: Draws a black circle centered at (145, 99) with radius 60.
; PLAN: r0=145(x), r1=99(y), r2=60(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 99
LDI r2, 60
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
