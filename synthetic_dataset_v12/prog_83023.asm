; DESCRIPTION: Creates a white circular shape at (120, 159) with radius 31.
; PLAN: r0=120(x), r1=159(y), r2=31(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 159
LDI r2, 31
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
