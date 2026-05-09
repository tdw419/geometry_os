; DESCRIPTION: Composite: . Then Sets a single blue pixel at (120, 3). Then Creates a blue circular shape at (67, 177) with radius 61.
; PLAN: r0=120(x), r1=3(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=67(x), r1=177(y), r2=61(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single blue pixel at (120, 3).
; PLAN: r0=120(x), r1=3(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 120
LDI r1, 3
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Creates a blue circular shape at (67, 177) with radius 61.
; PLAN: r0=67(x), r1=177(y), r2=61(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 177
LDI r2, 61
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
