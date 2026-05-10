; DESCRIPTION: Draws a blue circle centered at (34, 17) with radius 47.
; PLAN: r0=34(x), r1=17(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 34
LDI r1, 17
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
