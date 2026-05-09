; DESCRIPTION: Creates a black circular shape at (367, 203) with radius 49.
; PLAN: r0=367(x), r1=203(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 367
LDI r1, 203
LDI r2, 49
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
