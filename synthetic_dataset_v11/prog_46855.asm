; DESCRIPTION: Creates a purple circular shape at (95, 16) with radius 11.
; PLAN: r0=95(x), r1=16(y), r2=11(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 16
LDI r2, 11
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
