; DESCRIPTION: Creates a purple circular shape at (169, 94) with radius 78.
; PLAN: r0=169(x), r1=94(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 94
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
