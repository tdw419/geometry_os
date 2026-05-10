; DESCRIPTION: Creates a purple circular shape at (160, 36) with radius 35.
; PLAN: r0=160(x), r1=36(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 36
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
