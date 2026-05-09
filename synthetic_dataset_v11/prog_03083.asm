; DESCRIPTION: Creates a purple circular shape at (121, 100) with radius 68.
; PLAN: r0=121(x), r1=100(y), r2=68(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 100
LDI r2, 68
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
