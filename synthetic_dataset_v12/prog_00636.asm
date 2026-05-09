; DESCRIPTION: Draws a blue circle centered at (115, 119) with radius 74.
; PLAN: r0=115(x), r1=119(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 119
LDI r2, 74
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
