; DESCRIPTION: Draws a blue circle centered at (300, 78) with radius 73.
; PLAN: r0=300(x), r1=78(y), r2=73(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 300
LDI r1, 78
LDI r2, 73
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
