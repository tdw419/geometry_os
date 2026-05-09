; DESCRIPTION: Draws a blue circle centered at (54, 94) with radius 17.
; PLAN: r0=54(x), r1=94(y), r2=17(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 94
LDI r2, 17
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
