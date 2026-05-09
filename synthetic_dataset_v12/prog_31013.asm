; DESCRIPTION: Creates a white circular shape at (81, 90) with radius 78.
; PLAN: r0=81(x), r1=90(y), r2=78(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 90
LDI r2, 78
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
