; DESCRIPTION: Creates a black circular shape at (117, 192) with radius 43.
; PLAN: r0=117(x), r1=192(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 192
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
