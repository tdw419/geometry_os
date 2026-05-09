; DESCRIPTION: Composite: . Then Renders a red disk with center (119, 145) and radius 39. Then Sets a single purple pixel at (85, 135).
; PLAN: r0=119(x), r1=145(y), r2=39(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=85(x), r1=135(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a red disk with center (119, 145) and radius 39.
; PLAN: r0=119(x), r1=145(y), r2=39(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 145
LDI r2, 39
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single purple pixel at (85, 135).
; PLAN: r0=85(x), r1=135(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 85
LDI r1, 135
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
