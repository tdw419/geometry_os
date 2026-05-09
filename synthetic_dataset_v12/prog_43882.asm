; DESCRIPTION: Creates a purple circular shape at (424, 38) with radius 37.
; PLAN: r0=424(x), r1=38(y), r2=37(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 424
LDI r1, 38
LDI r2, 37
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
