; DESCRIPTION: Composite: . Then Sets a single purple pixel at (201, 195). Then Renders a magenta disk with center (64, 77) and radius 41.
; PLAN: r0=201(x), r1=195(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=64(x), r1=77(y), r2=41(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single purple pixel at (201, 195).
; PLAN: r0=201(x), r1=195(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 201
LDI r1, 195
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a magenta disk with center (64, 77) and radius 41.
; PLAN: r0=64(x), r1=77(y), r2=41(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 64
LDI r1, 77
LDI r2, 41
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
