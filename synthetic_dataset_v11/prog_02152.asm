; DESCRIPTION: Creates a purple circular shape at (159, 91) with radius 78.
; PLAN: r0=159(x), r1=91(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 91
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
