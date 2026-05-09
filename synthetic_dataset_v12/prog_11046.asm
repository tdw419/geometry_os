; DESCRIPTION: Creates a purple circular shape at (158, 225) with radius 28.
; PLAN: r0=158(x), r1=225(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 225
LDI r2, 28
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
