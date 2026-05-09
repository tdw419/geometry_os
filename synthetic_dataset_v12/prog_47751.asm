; DESCRIPTION: Creates a white circular shape at (61, 61) with radius 54.
; PLAN: r0=61(x), r1=61(y), r2=54(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 61
LDI r2, 54
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
