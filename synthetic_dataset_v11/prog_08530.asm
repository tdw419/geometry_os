; DESCRIPTION: Draws a blue circle centered at (194, 98) with radius 38.
; PLAN: r0=194(x), r1=98(y), r2=38(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 98
LDI r2, 38
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
