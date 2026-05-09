; DESCRIPTION: Creates a black circular shape at (450, 123) with radius 62.
; PLAN: r0=450(x), r1=123(y), r2=62(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 450
LDI r1, 123
LDI r2, 62
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
