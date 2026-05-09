; DESCRIPTION: Composite: . Then Places a purple circle of radius 60 at center (145, 131). Then Places a black dot at position (203, 185).
; PLAN: r0=145(x), r1=131(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=203(x), r1=185(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a purple circle of radius 60 at center (145, 131).
; PLAN: r0=145(x), r1=131(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 131
LDI r2, 60
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a black dot at position (203, 185).
; PLAN: r0=203(x), r1=185(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 203
LDI r1, 185
LDI r2, 0x000000
PSET r0, r1, r2
HALT
