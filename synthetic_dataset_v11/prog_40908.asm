; DESCRIPTION: Composite: . Then Sets a single orange pixel at (191, 87). Then Places a purple circle of radius 33 at center (88, 217).
; PLAN: r0=191(x), r1=87(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=88(x), r1=217(y), r2=33(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single orange pixel at (191, 87).
; PLAN: r0=191(x), r1=87(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 191
LDI r1, 87
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Places a purple circle of radius 33 at center (88, 217).
; PLAN: r0=88(x), r1=217(y), r2=33(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 217
LDI r2, 33
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
