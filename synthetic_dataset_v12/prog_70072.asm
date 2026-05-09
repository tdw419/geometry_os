; DESCRIPTION: Creates a white circular shape at (287, 157) with radius 23.
; PLAN: r0=287(x), r1=157(y), r2=23(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 287
LDI r1, 157
LDI r2, 23
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
