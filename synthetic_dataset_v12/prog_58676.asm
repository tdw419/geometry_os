; DESCRIPTION: Creates a yellow circular shape at (250, 105) with radius 38.
; PLAN: r0=250(x), r1=105(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 250
LDI r1, 105
LDI r2, 38
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
