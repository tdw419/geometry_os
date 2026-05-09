; DESCRIPTION: Composite: . Then Renders a blue disk with center (90, 151) and radius 49. Then Sets a single yellow pixel at (104, 106).
; PLAN: r0=90(x), r1=151(y), r2=49(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=104(x), r1=106(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a blue disk with center (90, 151) and radius 49.
; PLAN: r0=90(x), r1=151(y), r2=49(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 151
LDI r2, 49
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single yellow pixel at (104, 106).
; PLAN: r0=104(x), r1=106(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 104
LDI r1, 106
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
