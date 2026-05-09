; DESCRIPTION: Composite: . Then Places a purple circle of radius 75 at center (130, 173). Then Sets a single cyan pixel at (31, 12).
; PLAN: r0=130(x), r1=173(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=31(x), r1=12(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a purple circle of radius 75 at center (130, 173).
; PLAN: r0=130(x), r1=173(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 173
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single cyan pixel at (31, 12).
; PLAN: r0=31(x), r1=12(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 31
LDI r1, 12
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
