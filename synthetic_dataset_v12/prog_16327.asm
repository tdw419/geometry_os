; DESCRIPTION: Draws a blue circle centered at (47, 65) with radius 47.
; PLAN: r0=47(x), r1=65(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 47
LDI r1, 65
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
