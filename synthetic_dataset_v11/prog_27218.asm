; DESCRIPTION: Draws a black circle centered at (163, 65) with radius 60.
; PLAN: r0=163(x), r1=65(y), r2=60(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 65
LDI r2, 60
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
