; DESCRIPTION: Draws a green circle centered at (183, 158) with radius 11.
; PLAN: r0=183(x), r1=158(y), r2=11(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 158
LDI r2, 11
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
