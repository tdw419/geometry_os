; DESCRIPTION: Composite: . Then Places a magenta circle of radius 24 at center (104, 30). Then Sets a single purple pixel at (5, 185).
; PLAN: r0=104(x), r1=30(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=5(x), r1=185(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a magenta circle of radius 24 at center (104, 30).
; PLAN: r0=104(x), r1=30(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 30
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single purple pixel at (5, 185).
; PLAN: r0=5(x), r1=185(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 5
LDI r1, 185
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
