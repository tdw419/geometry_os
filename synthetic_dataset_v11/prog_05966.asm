; DESCRIPTION: Composite: . Then Places a green circle of radius 52 at center (89, 185). Then Sets a single blue pixel at (104, 247).
; PLAN: r0=89(x), r1=185(y), r2=52(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=104(x), r1=247(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a green circle of radius 52 at center (89, 185).
; PLAN: r0=89(x), r1=185(y), r2=52(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 185
LDI r2, 52
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single blue pixel at (104, 247).
; PLAN: r0=104(x), r1=247(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 104
LDI r1, 247
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
