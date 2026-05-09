; DESCRIPTION: Creates a purple circular shape at (98, 167) with radius 43.
; PLAN: r0=98(x), r1=167(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 167
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
