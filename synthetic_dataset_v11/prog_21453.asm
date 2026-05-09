; DESCRIPTION: Composite: . Then Sets a single blue pixel at (81, 21). Then Renders a blue disk with center (191, 84) and radius 24.
; PLAN: r0=81(x), r1=21(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=191(x), r1=84(y), r2=24(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single blue pixel at (81, 21).
; PLAN: r0=81(x), r1=21(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 81
LDI r1, 21
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Renders a blue disk with center (191, 84) and radius 24.
; PLAN: r0=191(x), r1=84(y), r2=24(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 84
LDI r2, 24
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
