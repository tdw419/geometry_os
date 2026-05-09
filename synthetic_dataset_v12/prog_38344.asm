; DESCRIPTION: Creates a white circular shape at (423, 157) with radius 38.
; PLAN: r0=423(x), r1=157(y), r2=38(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 423
LDI r1, 157
LDI r2, 38
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
