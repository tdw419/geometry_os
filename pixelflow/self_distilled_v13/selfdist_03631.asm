; DESCRIPTION: Draws a blue circle centered at (377, 40) with radius 64.
; PLAN: r0=377(x), r1=40(y), r2=64(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 377
LDI r1, 40
LDI r2, 64
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
