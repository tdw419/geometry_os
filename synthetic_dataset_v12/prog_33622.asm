; DESCRIPTION: Creates a purple circular shape at (367, 121) with radius 35.
; PLAN: r0=367(x), r1=121(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 367
LDI r1, 121
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
