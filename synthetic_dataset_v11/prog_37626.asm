; DESCRIPTION: Composite: . Then Sets a single purple pixel at (11, 112). Then Draws a red circle centered at (115, 98) with radius 70.
; PLAN: r0=11(x), r1=112(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=115(x), r1=98(y), r2=70(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single purple pixel at (11, 112).
; PLAN: r0=11(x), r1=112(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 11
LDI r1, 112
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a red circle centered at (115, 98) with radius 70.
; PLAN: r0=115(x), r1=98(y), r2=70(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 98
LDI r2, 70
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
