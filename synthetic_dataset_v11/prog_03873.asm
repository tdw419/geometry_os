; DESCRIPTION: Composite: . Then Creates a purple circular shape at (101, 90) with radius 47. Then Sets a single purple pixel at (201, 123).
; PLAN: r0=101(x), r1=90(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=201(x), r1=123(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a purple circular shape at (101, 90) with radius 47.
; PLAN: r0=101(x), r1=90(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 90
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single purple pixel at (201, 123).
; PLAN: r0=201(x), r1=123(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 201
LDI r1, 123
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
