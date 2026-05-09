; DESCRIPTION: Creates a purple circular shape at (410, 35) with radius 33.
; PLAN: r0=410(x), r1=35(y), r2=33(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 410
LDI r1, 35
LDI r2, 33
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
