; DESCRIPTION: Composite: . Then Places a purple dot at position (14, 44). Then Renders a black disk with center (134, 124) and radius 64.
; PLAN: r0=14(x), r1=44(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=134(x), r1=124(y), r2=64(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a purple dot at position (14, 44).
; PLAN: r0=14(x), r1=44(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 14
LDI r1, 44
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a black disk with center (134, 124) and radius 64.
; PLAN: r0=134(x), r1=124(y), r2=64(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 124
LDI r2, 64
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
