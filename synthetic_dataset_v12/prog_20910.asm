; DESCRIPTION: Creates a black circular shape at (179, 126) with radius 46.
; PLAN: r0=179(x), r1=126(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 126
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
