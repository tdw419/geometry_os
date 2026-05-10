; DESCRIPTION: Creates a black circular shape at (444, 38) with radius 10.
; PLAN: r0=444(x), r1=38(y), r2=10(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 444
LDI r1, 38
LDI r2, 10
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
