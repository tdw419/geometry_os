; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (35, 100). Then Draws a purple circle centered at (117, 107) with radius 73.
; PLAN: r0=35(x), r1=100(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=117(x), r1=107(y), r2=73(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single yellow pixel at (35, 100).
; PLAN: r0=35(x), r1=100(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 35
LDI r1, 100
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Draws a purple circle centered at (117, 107) with radius 73.
; PLAN: r0=117(x), r1=107(y), r2=73(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 107
LDI r2, 73
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
