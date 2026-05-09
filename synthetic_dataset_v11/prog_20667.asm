; DESCRIPTION: Draws a green circle centered at (163, 174) with radius 22.
; PLAN: r0=163(x), r1=174(y), r2=22(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 174
LDI r2, 22
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
