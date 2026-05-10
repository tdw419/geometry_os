; DESCRIPTION: Draws a blue circle centered at (244, 145) with radius 19.
; PLAN: r0=244(x), r1=145(y), r2=19(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 145
LDI r2, 19
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
