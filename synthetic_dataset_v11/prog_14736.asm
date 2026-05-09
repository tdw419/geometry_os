; DESCRIPTION: Composite: . Then Renders a red disk with center (51, 98) and radius 47. Then Sets a single purple pixel at (29, 22).
; PLAN: r0=51(x), r1=98(y), r2=47(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=29(x), r1=22(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a red disk with center (51, 98) and radius 47.
; PLAN: r0=51(x), r1=98(y), r2=47(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 98
LDI r2, 47
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single purple pixel at (29, 22).
; PLAN: r0=29(x), r1=22(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 29
LDI r1, 22
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
