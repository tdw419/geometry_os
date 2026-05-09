; DESCRIPTION: Draws a blue circle centered at (418, 184) with radius 15.
; PLAN: r0=418(x), r1=184(y), r2=15(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 184
LDI r2, 15
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
