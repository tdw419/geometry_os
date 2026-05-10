; DESCRIPTION: Draws a blue circle centered at (54, 2) with radius 58.
; PLAN: r0=54(x), r1=2(y), r2=58(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 2
LDI r2, 58
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
