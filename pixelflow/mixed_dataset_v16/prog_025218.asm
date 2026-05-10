; DESCRIPTION: Creates a black circular shape at (359, 28) with radius 20.
; PLAN: r0=359(x), r1=28(y), r2=20(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 359
LDI r1, 28
LDI r2, 20
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
