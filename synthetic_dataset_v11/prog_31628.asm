; DESCRIPTION: Composite: . Then Places a purple circle of radius 54 at center (114, 190). Then Sets a single cyan pixel at (244, 10).
; PLAN: r0=114(x), r1=190(y), r2=54(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=244(x), r1=10(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a purple circle of radius 54 at center (114, 190).
; PLAN: r0=114(x), r1=190(y), r2=54(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 190
LDI r2, 54
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single cyan pixel at (244, 10).
; PLAN: r0=244(x), r1=10(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 244
LDI r1, 10
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
