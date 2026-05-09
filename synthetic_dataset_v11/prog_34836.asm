; DESCRIPTION: Creates a purple circular shape at (166, 78) with radius 17.
; PLAN: r0=166(x), r1=78(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 78
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
