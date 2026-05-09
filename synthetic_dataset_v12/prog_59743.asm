; DESCRIPTION: Creates a purple circular shape at (403, 199) with radius 40.
; PLAN: r0=403(x), r1=199(y), r2=40(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 199
LDI r2, 40
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
