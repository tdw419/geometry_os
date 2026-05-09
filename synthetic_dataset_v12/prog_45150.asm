; DESCRIPTION: Creates a black circular shape at (158, 108) with radius 70.
; PLAN: r0=158(x), r1=108(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 108
LDI r2, 70
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
