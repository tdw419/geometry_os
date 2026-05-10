; DESCRIPTION: Creates a white circular shape at (153, 100) with radius 70.
; PLAN: r0=153(x), r1=100(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 100
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
