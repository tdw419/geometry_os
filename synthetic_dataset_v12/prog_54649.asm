; DESCRIPTION: Draws a blue circle centered at (226, 101) with radius 31.
; PLAN: r0=226(x), r1=101(y), r2=31(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 226
LDI r1, 101
LDI r2, 31
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
