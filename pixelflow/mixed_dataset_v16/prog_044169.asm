; DESCRIPTION: Creates a white circular shape at (269, 203) with radius 53.
; PLAN: r0=269(x), r1=203(y), r2=53(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 269
LDI r1, 203
LDI r2, 53
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
