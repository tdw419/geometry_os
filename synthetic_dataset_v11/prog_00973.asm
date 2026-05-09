; DESCRIPTION: Creates a purple circular shape at (162, 167) with radius 32.
; PLAN: r0=162(x), r1=167(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 167
LDI r2, 32
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
