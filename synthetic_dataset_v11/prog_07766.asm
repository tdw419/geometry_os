; DESCRIPTION: Composite: . Then Draws a green circle centered at (241, 51) with radius 12. Then Sets a single white pixel at (34, 15).
; PLAN: r0=241(x), r1=51(y), r2=12(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=34(x), r1=15(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a green circle centered at (241, 51) with radius 12.
; PLAN: r0=241(x), r1=51(y), r2=12(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 241
LDI r1, 51
LDI r2, 12
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single white pixel at (34, 15).
; PLAN: r0=34(x), r1=15(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 34
LDI r1, 15
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
