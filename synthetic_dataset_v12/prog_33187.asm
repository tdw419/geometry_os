; DESCRIPTION: Draws a blue circle centered at (95, 162) with radius 80.
; PLAN: r0=95(x), r1=162(y), r2=80(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 162
LDI r2, 80
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
