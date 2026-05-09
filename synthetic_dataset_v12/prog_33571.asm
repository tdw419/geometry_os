; DESCRIPTION: Draws a blue circle centered at (432, 83) with radius 54.
; PLAN: r0=432(x), r1=83(y), r2=54(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 432
LDI r1, 83
LDI r2, 54
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
