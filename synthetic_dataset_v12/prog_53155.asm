; DESCRIPTION: Draws a blue circle centered at (493, 14) with radius 14.
; PLAN: r0=493(x), r1=14(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 493
LDI r1, 14
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
