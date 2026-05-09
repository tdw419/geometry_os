; DESCRIPTION: Composite: . Then Sets a single blue pixel at (97, 57). Then Places a white circle of radius 22 at center (109, 118).
; PLAN: r0=97(x), r1=57(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=109(x), r1=118(y), r2=22(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single blue pixel at (97, 57).
; PLAN: r0=97(x), r1=57(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 97
LDI r1, 57
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Places a white circle of radius 22 at center (109, 118).
; PLAN: r0=109(x), r1=118(y), r2=22(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 118
LDI r2, 22
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
