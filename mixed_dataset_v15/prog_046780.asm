; DESCRIPTION: Creates a white circular shape at (339, 145) with radius 42.
; PLAN: r0=339(x), r1=145(y), r2=42(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 145
LDI r2, 42
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
