; DESCRIPTION: Draws a blue circle centered at (96, 55) with radius 23.
; PLAN: r0=96(x), r1=55(y), r2=23(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 55
LDI r2, 23
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
