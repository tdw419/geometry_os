; DESCRIPTION: Composite: . Then Sets a single purple pixel at (100, 85). Then Places a black circle of radius 13 at center (197, 168).
; PLAN: r0=100(x), r1=85(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=197(x), r1=168(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single purple pixel at (100, 85).
; PLAN: r0=100(x), r1=85(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 100
LDI r1, 85
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Places a black circle of radius 13 at center (197, 168).
; PLAN: r0=197(x), r1=168(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 168
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
