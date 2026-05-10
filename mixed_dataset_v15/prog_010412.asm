; DESCRIPTION: Creates a black circular shape at (229, 126) with radius 62.
; PLAN: r0=229(x), r1=126(y), r2=62(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 229
LDI r1, 126
LDI r2, 62
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
