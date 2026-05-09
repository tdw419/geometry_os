; DESCRIPTION: Draws a blue circle centered at (108, 83) with radius 75.
; PLAN: r0=108(x), r1=83(y), r2=75(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 83
LDI r2, 75
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
