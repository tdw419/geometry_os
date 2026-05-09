; DESCRIPTION: Draws a blue circle centered at (124, 159) with radius 74.
; PLAN: r0=124(x), r1=159(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 159
LDI r2, 74
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
