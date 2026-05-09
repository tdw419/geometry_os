; DESCRIPTION: Composite: . Then Sets a single black pixel at (57, 136). Then Creates a cyan circular shape at (106, 125) with radius 71.
; PLAN: r0=57(x), r1=136(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=106(x), r1=125(y), r2=71(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single black pixel at (57, 136).
; PLAN: r0=57(x), r1=136(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 57
LDI r1, 136
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Creates a cyan circular shape at (106, 125) with radius 71.
; PLAN: r0=106(x), r1=125(y), r2=71(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 125
LDI r2, 71
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
