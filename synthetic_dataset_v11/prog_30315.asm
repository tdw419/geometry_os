; DESCRIPTION: Composite: . Then Sets a single black pixel at (99, 171). Then Renders a cyan disk with center (177, 172) and radius 71.
; PLAN: r0=99(x), r1=171(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=177(x), r1=172(y), r2=71(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single black pixel at (99, 171).
; PLAN: r0=99(x), r1=171(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 99
LDI r1, 171
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Renders a cyan disk with center (177, 172) and radius 71.
; PLAN: r0=177(x), r1=172(y), r2=71(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 172
LDI r2, 71
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
