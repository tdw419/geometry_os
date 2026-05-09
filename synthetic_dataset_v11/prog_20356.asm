; DESCRIPTION: Creates a white circular shape at (86, 75) with radius 52.
; PLAN: r0=86(x), r1=75(y), r2=52(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 75
LDI r2, 52
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
