; DESCRIPTION: Creates a purple circular shape at (143, 93) with radius 78.
; PLAN: r0=143(x), r1=93(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 93
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
