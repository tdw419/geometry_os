; DESCRIPTION: Creates a green circular shape at (339, 153) with radius 35.
; PLAN: r0=339(x), r1=153(y), r2=35(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 153
LDI r2, 35
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
