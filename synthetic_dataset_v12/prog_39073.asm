; DESCRIPTION: Creates a green circular shape at (78, 126) with radius 55.
; PLAN: r0=78(x), r1=126(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 126
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
