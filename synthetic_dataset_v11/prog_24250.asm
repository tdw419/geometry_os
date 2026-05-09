; DESCRIPTION: Composite: . Then Sets a single blue pixel at (199, 155). Then Places a white circle of radius 20 at center (185, 194).
; PLAN: r0=199(x), r1=155(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=185(x), r1=194(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single blue pixel at (199, 155).
; PLAN: r0=199(x), r1=155(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 199
LDI r1, 155
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Places a white circle of radius 20 at center (185, 194).
; PLAN: r0=185(x), r1=194(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 194
LDI r2, 20
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
