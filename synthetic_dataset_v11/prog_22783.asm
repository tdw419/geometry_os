; DESCRIPTION: Creates a white circular shape at (153, 85) with radius 80.
; PLAN: r0=153(x), r1=85(y), r2=80(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 85
LDI r2, 80
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
