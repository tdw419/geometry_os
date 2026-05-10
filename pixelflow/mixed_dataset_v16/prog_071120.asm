; DESCRIPTION: Creates a black circular shape at (59, 157) with radius 34.
; PLAN: r0=59(x), r1=157(y), r2=34(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 157
LDI r2, 34
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
