; DESCRIPTION: Draws a blue circle centered at (472, 20) with radius 18.
; PLAN: r0=472(x), r1=20(y), r2=18(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 472
LDI r1, 20
LDI r2, 18
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
