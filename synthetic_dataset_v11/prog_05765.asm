; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (211, 190). Then Places a cyan circle of radius 28 at center (158, 79).
; PLAN: r0=211(x), r1=190(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=158(x), r1=79(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single yellow pixel at (211, 190).
; PLAN: r0=211(x), r1=190(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 211
LDI r1, 190
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Places a cyan circle of radius 28 at center (158, 79).
; PLAN: r0=158(x), r1=79(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 79
LDI r2, 28
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
