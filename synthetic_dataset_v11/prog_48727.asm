; DESCRIPTION: Draws a blue circle centered at (161, 87) with radius 54.
; PLAN: r0=161(x), r1=87(y), r2=54(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 87
LDI r2, 54
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
