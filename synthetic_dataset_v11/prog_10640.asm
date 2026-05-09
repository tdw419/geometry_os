; DESCRIPTION: Composite: . Then Sets a single blue pixel at (32, 163). Then Places a white circle of radius 77 at center (83, 105).
; PLAN: r0=32(x), r1=163(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=83(x), r1=105(y), r2=77(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single blue pixel at (32, 163).
; PLAN: r0=32(x), r1=163(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 32
LDI r1, 163
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Places a white circle of radius 77 at center (83, 105).
; PLAN: r0=83(x), r1=105(y), r2=77(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 105
LDI r2, 77
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
