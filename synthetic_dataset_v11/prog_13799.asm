; DESCRIPTION: Composite: . Then Sets a single blue pixel at (103, 53). Then Renders a cyan disk with center (74, 145) and radius 11.
; PLAN: r0=103(x), r1=53(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=74(x), r1=145(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single blue pixel at (103, 53).
; PLAN: r0=103(x), r1=53(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 103
LDI r1, 53
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Renders a cyan disk with center (74, 145) and radius 11.
; PLAN: r0=74(x), r1=145(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 145
LDI r2, 11
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
