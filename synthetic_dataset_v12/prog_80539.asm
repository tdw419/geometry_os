; DESCRIPTION: Creates a purple circular shape at (125, 78) with radius 54.
; PLAN: r0=125(x), r1=78(y), r2=54(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 78
LDI r2, 54
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
