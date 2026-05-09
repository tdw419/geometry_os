; DESCRIPTION: Composite: . Then Sets a single black pixel at (163, 135). Then Places a blue circle of radius 49 at center (134, 207).
; PLAN: r0=163(x), r1=135(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=134(x), r1=207(y), r2=49(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single black pixel at (163, 135).
; PLAN: r0=163(x), r1=135(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 163
LDI r1, 135
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Places a blue circle of radius 49 at center (134, 207).
; PLAN: r0=134(x), r1=207(y), r2=49(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 207
LDI r2, 49
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
