; DESCRIPTION: Draws a blue circle centered at (54, 55) with radius 11.
; PLAN: r0=54(x), r1=55(y), r2=11(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 55
LDI r2, 11
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
