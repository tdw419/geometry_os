; DESCRIPTION: Draws a blue circle centered at (84, 145) with radius 78.
; PLAN: r0=84(x), r1=145(y), r2=78(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 145
LDI r2, 78
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
