; DESCRIPTION: Creates a white circular shape at (56, 153) with radius 23.
; PLAN: r0=56(x), r1=153(y), r2=23(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 153
LDI r2, 23
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
