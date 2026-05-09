; DESCRIPTION: Composite: . Then Sets a single blue pixel at (28, 77). Then Places a red circle of radius 67 at center (164, 105).
; PLAN: r0=28(x), r1=77(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=164(x), r1=105(y), r2=67(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single blue pixel at (28, 77).
; PLAN: r0=28(x), r1=77(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 28
LDI r1, 77
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Places a red circle of radius 67 at center (164, 105).
; PLAN: r0=164(x), r1=105(y), r2=67(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 105
LDI r2, 67
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
