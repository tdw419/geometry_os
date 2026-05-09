; DESCRIPTION: Draws a blue circle centered at (161, 29) with radius 26.
; PLAN: r0=161(x), r1=29(y), r2=26(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 29
LDI r2, 26
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
