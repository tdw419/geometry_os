; DESCRIPTION: Composite: . Then Sets a single white pixel at (233, 180). Then Renders a black disk with center (175, 51) and radius 47.
; PLAN: r0=233(x), r1=180(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=175(x), r1=51(y), r2=47(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single white pixel at (233, 180).
; PLAN: r0=233(x), r1=180(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 233
LDI r1, 180
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a black disk with center (175, 51) and radius 47.
; PLAN: r0=175(x), r1=51(y), r2=47(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 51
LDI r2, 47
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
