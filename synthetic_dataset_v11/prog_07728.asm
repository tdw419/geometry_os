; DESCRIPTION: Composite: . Then Sets a single purple pixel at (0, 176). Then Creates a purple circular shape at (67, 158) with radius 27.
; PLAN: r0=0(x), r1=176(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=67(x), r1=158(y), r2=27(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single purple pixel at (0, 176).
; PLAN: r0=0(x), r1=176(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 0
LDI r1, 176
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Creates a purple circular shape at (67, 158) with radius 27.
; PLAN: r0=67(x), r1=158(y), r2=27(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 158
LDI r2, 27
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
