; DESCRIPTION: Creates a purple circular shape at (154, 101) with radius 75.
; PLAN: r0=154(x), r1=101(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 101
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
