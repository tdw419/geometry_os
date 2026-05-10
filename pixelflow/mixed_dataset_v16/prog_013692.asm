; DESCRIPTION: Creates a white circular shape at (56, 171) with radius 10.
; PLAN: r0=56(x), r1=171(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 171
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
