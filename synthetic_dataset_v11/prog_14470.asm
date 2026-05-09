; DESCRIPTION: Draws a black circle centered at (49, 145) with radius 40.
; PLAN: r0=49(x), r1=145(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 49
LDI r1, 145
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
