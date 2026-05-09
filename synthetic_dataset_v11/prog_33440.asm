; DESCRIPTION: Composite: . Then Sets a single purple pixel at (27, 11). Then Creates a black circular shape at (148, 90) with radius 54.
; PLAN: r0=27(x), r1=11(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=148(x), r1=90(y), r2=54(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single purple pixel at (27, 11).
; PLAN: r0=27(x), r1=11(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 27
LDI r1, 11
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Creates a black circular shape at (148, 90) with radius 54.
; PLAN: r0=148(x), r1=90(y), r2=54(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 90
LDI r2, 54
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
