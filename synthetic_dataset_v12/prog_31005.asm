; DESCRIPTION: Draws a green circle centered at (136, 169) with radius 60.
; PLAN: r0=136(x), r1=169(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 169
LDI r2, 60
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
