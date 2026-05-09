; DESCRIPTION: Draws a purple circle centered at (84, 155) with radius 50.
; PLAN: r0=84(x), r1=155(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 155
LDI r2, 50
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
