; DESCRIPTION: Creates a yellow circular shape at (77, 105) with radius 60.
; PLAN: r0=77(x), r1=105(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 105
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
