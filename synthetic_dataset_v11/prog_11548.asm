; DESCRIPTION: Composite: . Then Renders a black disk with center (157, 71) and radius 43. Then Sets a single cyan pixel at (51, 144).
; PLAN: r0=157(x), r1=71(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=51(x), r1=144(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a black disk with center (157, 71) and radius 43.
; PLAN: r0=157(x), r1=71(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 71
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single cyan pixel at (51, 144).
; PLAN: r0=51(x), r1=144(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 51
LDI r1, 144
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
