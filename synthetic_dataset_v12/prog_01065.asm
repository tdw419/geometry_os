; DESCRIPTION: Draws a blue circle centered at (81, 188) with radius 54.
; PLAN: r0=81(x), r1=188(y), r2=54(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 188
LDI r2, 54
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
