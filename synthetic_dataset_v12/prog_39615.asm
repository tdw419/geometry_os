; DESCRIPTION: Creates a purple circular shape at (96, 121) with radius 43.
; PLAN: r0=96(x), r1=121(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 121
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
