; DESCRIPTION: Draws a green circle centered at (421, 78) with radius 37.
; PLAN: r0=421(x), r1=78(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 421
LDI r1, 78
LDI r2, 37
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
