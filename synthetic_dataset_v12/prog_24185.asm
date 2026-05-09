; DESCRIPTION: Creates a green circular shape at (336, 157) with radius 38.
; PLAN: r0=336(x), r1=157(y), r2=38(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 336
LDI r1, 157
LDI r2, 38
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
