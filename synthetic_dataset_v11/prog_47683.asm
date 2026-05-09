; DESCRIPTION: Composite: . Then Sets a single blue pixel at (119, 64). Then Creates a green circular shape at (111, 185) with radius 44.
; PLAN: r0=119(x), r1=64(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=111(x), r1=185(y), r2=44(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single blue pixel at (119, 64).
; PLAN: r0=119(x), r1=64(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 119
LDI r1, 64
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Creates a green circular shape at (111, 185) with radius 44.
; PLAN: r0=111(x), r1=185(y), r2=44(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 185
LDI r2, 44
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
