; DESCRIPTION: Composite: . Then Draws a purple circle centered at (116, 177) with radius 76. Then Sets a single green pixel at (12, 65).
; PLAN: r0=116(x), r1=177(y), r2=76(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=12(x), r1=65(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a purple circle centered at (116, 177) with radius 76.
; PLAN: r0=116(x), r1=177(y), r2=76(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 177
LDI r2, 76
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single green pixel at (12, 65).
; PLAN: r0=12(x), r1=65(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 12
LDI r1, 65
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
