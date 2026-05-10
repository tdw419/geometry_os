; DESCRIPTION: Creates a white circular shape at (148, 57) with radius 24.
; PLAN: r0=148(x), r1=57(y), r2=24(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 57
LDI r2, 24
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
