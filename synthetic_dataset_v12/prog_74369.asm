; DESCRIPTION: Creates a white circular shape at (418, 56) with radius 49.
; PLAN: r0=418(x), r1=56(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 56
LDI r2, 49
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
