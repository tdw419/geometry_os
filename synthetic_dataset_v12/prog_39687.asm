; DESCRIPTION: Creates a purple circular shape at (153, 126) with radius 74.
; PLAN: r0=153(x), r1=126(y), r2=74(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 126
LDI r2, 74
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
