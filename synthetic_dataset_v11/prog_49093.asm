; DESCRIPTION: Creates a black circular shape at (117, 100) with radius 70.
; PLAN: r0=117(x), r1=100(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 100
LDI r2, 70
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
