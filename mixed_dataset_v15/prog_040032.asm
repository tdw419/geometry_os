; DESCRIPTION: Creates a black circular shape at (84, 170) with radius 69.
; PLAN: r0=84(x), r1=170(y), r2=69(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 170
LDI r2, 69
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
