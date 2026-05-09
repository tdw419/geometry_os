; DESCRIPTION: Creates a purple circular shape at (303, 93) with radius 21.
; PLAN: r0=303(x), r1=93(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 93
LDI r2, 21
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
