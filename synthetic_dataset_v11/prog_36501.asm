; DESCRIPTION: Composite: . Then Draws a purple circle centered at (68, 139) with radius 32. Then Sets a single yellow pixel at (65, 177).
; PLAN: r0=68(x), r1=139(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=65(x), r1=177(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a purple circle centered at (68, 139) with radius 32.
; PLAN: r0=68(x), r1=139(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 68
LDI r1, 139
LDI r2, 32
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single yellow pixel at (65, 177).
; PLAN: r0=65(x), r1=177(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 65
LDI r1, 177
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
