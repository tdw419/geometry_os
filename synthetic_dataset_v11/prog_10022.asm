; DESCRIPTION: Creates a yellow circular shape at (107, 105) with radius 78.
; PLAN: r0=107(x), r1=105(y), r2=78(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 105
LDI r2, 78
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
