; DESCRIPTION: Draws a blue circle centered at (244, 125) with radius 73.
; PLAN: r0=244(x), r1=125(y), r2=73(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 125
LDI r2, 73
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
