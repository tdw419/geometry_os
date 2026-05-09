; DESCRIPTION: Draws a blue circle centered at (163, 121) with radius 79.
; PLAN: r0=163(x), r1=121(y), r2=79(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 121
LDI r2, 79
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
