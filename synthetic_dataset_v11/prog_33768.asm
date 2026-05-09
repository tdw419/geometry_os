; DESCRIPTION: Creates a purple circular shape at (166, 158) with radius 50.
; PLAN: r0=166(x), r1=158(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 158
LDI r2, 50
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
