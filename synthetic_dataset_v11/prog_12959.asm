; DESCRIPTION: Creates a black circular shape at (126, 158) with radius 78.
; PLAN: r0=126(x), r1=158(y), r2=78(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 158
LDI r2, 78
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
