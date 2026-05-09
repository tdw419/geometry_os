; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (74, 251). Then Renders a black disk with center (77, 51) and radius 31.
; PLAN: r0=74(x), r1=251(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=77(x), r1=51(y), r2=31(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single cyan pixel at (74, 251).
; PLAN: r0=74(x), r1=251(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 74
LDI r1, 251
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a black disk with center (77, 51) and radius 31.
; PLAN: r0=77(x), r1=51(y), r2=31(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 51
LDI r2, 31
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
