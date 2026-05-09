; DESCRIPTION: Composite: . Then Sets a single purple pixel at (18, 144). Then Renders a black disk with center (108, 212) and radius 33.
; PLAN: r0=18(x), r1=144(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=108(x), r1=212(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single purple pixel at (18, 144).
; PLAN: r0=18(x), r1=144(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 18
LDI r1, 144
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a black disk with center (108, 212) and radius 33.
; PLAN: r0=108(x), r1=212(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 212
LDI r2, 33
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
