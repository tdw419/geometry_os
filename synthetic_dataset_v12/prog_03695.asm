; DESCRIPTION: Draws a blue circle centered at (102, 108) with radius 70.
; PLAN: r0=102(x), r1=108(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 108
LDI r2, 70
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
