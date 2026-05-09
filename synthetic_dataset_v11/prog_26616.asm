; DESCRIPTION: Creates a purple circular shape at (119, 146) with radius 57.
; PLAN: r0=119(x), r1=146(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 146
LDI r2, 57
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
