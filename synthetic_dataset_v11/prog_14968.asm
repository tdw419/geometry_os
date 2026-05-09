; DESCRIPTION: Creates a blue circular shape at (155, 76) with radius 74.
; PLAN: r0=155(x), r1=76(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 76
LDI r2, 74
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
