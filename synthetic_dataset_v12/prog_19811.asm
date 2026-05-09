; DESCRIPTION: Draws a blue circle centered at (24, 79) with radius 19.
; PLAN: r0=24(x), r1=79(y), r2=19(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 24
LDI r1, 79
LDI r2, 19
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
