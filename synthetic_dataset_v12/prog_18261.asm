; DESCRIPTION: Draws a green circle centered at (494, 56) with radius 11.
; PLAN: r0=494(x), r1=56(y), r2=11(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 494
LDI r1, 56
LDI r2, 11
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
