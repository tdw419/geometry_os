; DESCRIPTION: Creates a yellow circular shape at (96, 105) with radius 70.
; PLAN: r0=96(x), r1=105(y), r2=70(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 105
LDI r2, 70
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
