; DESCRIPTION: Creates a purple circular shape at (238, 25) with radius 25.
; PLAN: r0=238(x), r1=25(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 238
LDI r1, 25
LDI r2, 25
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
