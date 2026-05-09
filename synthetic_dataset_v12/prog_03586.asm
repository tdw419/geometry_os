; DESCRIPTION: Creates a purple circular shape at (28, 55) with radius 14.
; PLAN: r0=28(x), r1=55(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 28
LDI r1, 55
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
