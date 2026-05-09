; DESCRIPTION: Draws a blue circle centered at (162, 123) with radius 70.
; PLAN: r0=162(x), r1=123(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 123
LDI r2, 70
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
