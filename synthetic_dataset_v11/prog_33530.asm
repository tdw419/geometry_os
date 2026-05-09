; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (101, 153). Then Places a purple circle of radius 44 at center (73, 119).
; PLAN: r0=101(x), r1=153(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=73(x), r1=119(y), r2=44(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single yellow pixel at (101, 153).
; PLAN: r0=101(x), r1=153(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 101
LDI r1, 153
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Places a purple circle of radius 44 at center (73, 119).
; PLAN: r0=73(x), r1=119(y), r2=44(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 73
LDI r1, 119
LDI r2, 44
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
