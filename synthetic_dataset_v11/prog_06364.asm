; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (36, 155). Then Places a magenta circle of radius 15 at center (76, 235).
; PLAN: r0=36(x), r1=155(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=76(x), r1=235(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single yellow pixel at (36, 155).
; PLAN: r0=36(x), r1=155(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 36
LDI r1, 155
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Places a magenta circle of radius 15 at center (76, 235).
; PLAN: r0=76(x), r1=235(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 235
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
