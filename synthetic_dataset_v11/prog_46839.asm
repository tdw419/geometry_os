; DESCRIPTION: Creates a purple circular shape at (93, 221) with radius 20.
; PLAN: r0=93(x), r1=221(y), r2=20(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 221
LDI r2, 20
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
