; DESCRIPTION: Composite: . Then Sets a single purple pixel at (158, 161). Then Places a yellow circle of radius 16 at center (100, 64).
; PLAN: r0=158(x), r1=161(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=100(x), r1=64(y), r2=16(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single purple pixel at (158, 161).
; PLAN: r0=158(x), r1=161(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 158
LDI r1, 161
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Places a yellow circle of radius 16 at center (100, 64).
; PLAN: r0=100(x), r1=64(y), r2=16(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 64
LDI r2, 16
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
