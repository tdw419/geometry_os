; DESCRIPTION: Creates a purple circular shape at (353, 196) with radius 36.
; PLAN: r0=353(x), r1=196(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 353
LDI r1, 196
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
