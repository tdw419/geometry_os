; DESCRIPTION: Draws a green circle centered at (136, 159) with radius 31.
; PLAN: r0=136(x), r1=159(y), r2=31(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 159
LDI r2, 31
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
