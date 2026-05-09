; DESCRIPTION: Creates a purple circular shape at (141, 58) with radius 28.
; PLAN: r0=141(x), r1=58(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 58
LDI r2, 28
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
