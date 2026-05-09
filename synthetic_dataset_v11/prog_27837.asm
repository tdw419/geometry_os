; DESCRIPTION: Draws a green circle centered at (142, 158) with radius 74.
; PLAN: r0=142(x), r1=158(y), r2=74(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 158
LDI r2, 74
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
