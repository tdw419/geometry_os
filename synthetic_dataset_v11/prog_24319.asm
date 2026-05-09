; DESCRIPTION: Composite: . Then Sets a single orange pixel at (4, 134). Then Draws a purple circle centered at (83, 167) with radius 77.
; PLAN: r0=4(x), r1=134(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=83(x), r1=167(y), r2=77(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single orange pixel at (4, 134).
; PLAN: r0=4(x), r1=134(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 4
LDI r1, 134
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Draws a purple circle centered at (83, 167) with radius 77.
; PLAN: r0=83(x), r1=167(y), r2=77(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 167
LDI r2, 77
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
