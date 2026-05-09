; DESCRIPTION: Composite: . Then Renders a purple disk with center (50, 99) and radius 15. Then Sets a single purple pixel at (207, 201).
; PLAN: r0=50(x), r1=99(y), r2=15(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=207(x), r1=201(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a purple disk with center (50, 99) and radius 15.
; PLAN: r0=50(x), r1=99(y), r2=15(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 50
LDI r1, 99
LDI r2, 15
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single purple pixel at (207, 201).
; PLAN: r0=207(x), r1=201(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 207
LDI r1, 201
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
