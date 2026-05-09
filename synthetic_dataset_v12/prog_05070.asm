; DESCRIPTION: Creates a black circular shape at (170, 126) with radius 75.
; PLAN: r0=170(x), r1=126(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 126
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
