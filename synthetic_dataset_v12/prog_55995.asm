; DESCRIPTION: Creates a purple circular shape at (112, 161) with radius 14.
; PLAN: r0=112(x), r1=161(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 161
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
