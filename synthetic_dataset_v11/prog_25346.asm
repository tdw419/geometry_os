; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (115, 199). Then Places a blue circle of radius 15 at center (186, 222).
; PLAN: r0=115(x), r1=199(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=186(x), r1=222(y), r2=15(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single cyan pixel at (115, 199).
; PLAN: r0=115(x), r1=199(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 115
LDI r1, 199
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Places a blue circle of radius 15 at center (186, 222).
; PLAN: r0=186(x), r1=222(y), r2=15(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 222
LDI r2, 15
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
