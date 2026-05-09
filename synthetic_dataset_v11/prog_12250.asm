; DESCRIPTION: Composite: . Then Sets a single purple pixel at (106, 57). Then Renders a blue disk with center (119, 156) and radius 79.
; PLAN: r0=106(x), r1=57(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=119(x), r1=156(y), r2=79(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single purple pixel at (106, 57).
; PLAN: r0=106(x), r1=57(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 106
LDI r1, 57
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a blue disk with center (119, 156) and radius 79.
; PLAN: r0=119(x), r1=156(y), r2=79(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 156
LDI r2, 79
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
