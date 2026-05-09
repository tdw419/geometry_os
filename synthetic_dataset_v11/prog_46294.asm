; DESCRIPTION: Composite: . Then Sets a single blue pixel at (202, 241). Then Places a purple circle of radius 12 at center (105, 138).
; PLAN: r0=202(x), r1=241(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=105(x), r1=138(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single blue pixel at (202, 241).
; PLAN: r0=202(x), r1=241(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 202
LDI r1, 241
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Places a purple circle of radius 12 at center (105, 138).
; PLAN: r0=105(x), r1=138(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 138
LDI r2, 12
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
