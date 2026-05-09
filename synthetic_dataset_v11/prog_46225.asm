; DESCRIPTION: Composite: . Then Sets a single blue pixel at (169, 24). Then Draws a white circle centered at (182, 182) with radius 44.
; PLAN: r0=169(x), r1=24(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=182(x), r1=182(y), r2=44(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single blue pixel at (169, 24).
; PLAN: r0=169(x), r1=24(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 169
LDI r1, 24
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Draws a white circle centered at (182, 182) with radius 44.
; PLAN: r0=182(x), r1=182(y), r2=44(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 182
LDI r2, 44
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
