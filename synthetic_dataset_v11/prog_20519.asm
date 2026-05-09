; DESCRIPTION: Draws a green circle centered at (44, 158) with radius 12.
; PLAN: r0=44(x), r1=158(y), r2=12(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 44
LDI r1, 158
LDI r2, 12
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
