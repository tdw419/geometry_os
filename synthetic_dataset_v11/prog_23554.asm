; DESCRIPTION: Creates a white circular shape at (62, 161) with radius 38.
; PLAN: r0=62(x), r1=161(y), r2=38(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 62
LDI r1, 161
LDI r2, 38
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
