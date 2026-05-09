; DESCRIPTION: Draws a yellow circle centered at (140, 158) with radius 60.
; PLAN: r0=140(x), r1=158(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 158
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
