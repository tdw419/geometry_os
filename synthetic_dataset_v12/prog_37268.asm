; DESCRIPTION: Creates a purple circular shape at (403, 119) with radius 78.
; PLAN: r0=403(x), r1=119(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 119
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
