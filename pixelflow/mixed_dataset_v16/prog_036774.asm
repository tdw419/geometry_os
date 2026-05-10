; DESCRIPTION: Draws a green circle centered at (421, 157) with radius 11.
; PLAN: r0=421(x), r1=157(y), r2=11(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 421
LDI r1, 157
LDI r2, 11
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
