; DESCRIPTION: Draws a blue circle centered at (370, 101) with radius 19.
; PLAN: r0=370(x), r1=101(y), r2=19(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 370
LDI r1, 101
LDI r2, 19
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
