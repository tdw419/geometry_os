; DESCRIPTION: Composite: . Then Sets a single blue pixel at (82, 227). Then Renders a purple disk with center (119, 78) and radius 50.
; PLAN: r0=82(x), r1=227(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=119(x), r1=78(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single blue pixel at (82, 227).
; PLAN: r0=82(x), r1=227(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 82
LDI r1, 227
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Renders a purple disk with center (119, 78) and radius 50.
; PLAN: r0=119(x), r1=78(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 78
LDI r2, 50
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
