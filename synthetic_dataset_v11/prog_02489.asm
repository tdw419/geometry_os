; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (153, 36). Then Places a purple circle of radius 14 at center (236, 200).
; PLAN: r0=153(x), r1=36(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=236(x), r1=200(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single magenta pixel at (153, 36).
; PLAN: r0=153(x), r1=36(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 153
LDI r1, 36
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Places a purple circle of radius 14 at center (236, 200).
; PLAN: r0=236(x), r1=200(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 236
LDI r1, 200
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
