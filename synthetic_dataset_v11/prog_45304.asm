; DESCRIPTION: Creates a purple circular shape at (102, 177) with radius 74.
; PLAN: r0=102(x), r1=177(y), r2=74(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 177
LDI r2, 74
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
