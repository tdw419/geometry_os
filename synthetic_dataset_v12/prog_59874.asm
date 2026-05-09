; DESCRIPTION: Creates a purple circular shape at (317, 102) with radius 74.
; PLAN: r0=317(x), r1=102(y), r2=74(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 317
LDI r1, 102
LDI r2, 74
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
