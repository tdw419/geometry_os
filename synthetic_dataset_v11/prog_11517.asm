; DESCRIPTION: Composite: . Then Sets a single green pixel at (189, 190). Then Places a blue circle of radius 31 at center (180, 118).
; PLAN: r0=189(x), r1=190(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=180(x), r1=118(y), r2=31(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single green pixel at (189, 190).
; PLAN: r0=189(x), r1=190(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 189
LDI r1, 190
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Places a blue circle of radius 31 at center (180, 118).
; PLAN: r0=180(x), r1=118(y), r2=31(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 118
LDI r2, 31
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
