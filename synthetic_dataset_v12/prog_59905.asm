; DESCRIPTION: Draws a blue circle centered at (266, 96) with radius 73.
; PLAN: r0=266(x), r1=96(y), r2=73(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 266
LDI r1, 96
LDI r2, 73
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
