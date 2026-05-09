; DESCRIPTION: Creates a white circular shape at (35, 191) with radius 10.
; PLAN: r0=35(x), r1=191(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 35
LDI r1, 191
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
