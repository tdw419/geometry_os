; DESCRIPTION: Composite: . Then Sets a single blue pixel at (94, 136). Then Renders a blue disk with center (151, 183) and radius 64.
; PLAN: r0=94(x), r1=136(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=151(x), r1=183(y), r2=64(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single blue pixel at (94, 136).
; PLAN: r0=94(x), r1=136(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 94
LDI r1, 136
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Renders a blue disk with center (151, 183) and radius 64.
; PLAN: r0=151(x), r1=183(y), r2=64(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 183
LDI r2, 64
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
