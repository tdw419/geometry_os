; DESCRIPTION: Draws a green circle centered at (40, 123) with radius 29.
; PLAN: r0=40(x), r1=123(y), r2=29(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 40
LDI r1, 123
LDI r2, 29
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
