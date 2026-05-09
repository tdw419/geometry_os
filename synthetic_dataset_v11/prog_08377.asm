; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (13, 199). Then Places a purple circle of radius 58 at center (144, 114).
; PLAN: r0=13(x), r1=199(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=144(x), r1=114(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single cyan pixel at (13, 199).
; PLAN: r0=13(x), r1=199(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 13
LDI r1, 199
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Places a purple circle of radius 58 at center (144, 114).
; PLAN: r0=144(x), r1=114(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 114
LDI r2, 58
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
