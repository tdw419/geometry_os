; DESCRIPTION: Composite: . Then Sets a single purple pixel at (24, 190). Then Places a orange circle of radius 64 at center (100, 122).
; PLAN: r0=24(x), r1=190(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=100(x), r1=122(y), r2=64(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single purple pixel at (24, 190).
; PLAN: r0=24(x), r1=190(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 24
LDI r1, 190
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Places a orange circle of radius 64 at center (100, 122).
; PLAN: r0=100(x), r1=122(y), r2=64(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 122
LDI r2, 64
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
