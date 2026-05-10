; DESCRIPTION: Draws a blue circle centered at (350, 15) with radius 14.
; PLAN: r0=350(x), r1=15(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 15
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
