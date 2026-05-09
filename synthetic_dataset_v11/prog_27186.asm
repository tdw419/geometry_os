; DESCRIPTION: Composite: . Then Sets a single purple pixel at (77, 48). Then Creates a black circular shape at (162, 160) with radius 65.
; PLAN: r0=77(x), r1=48(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=162(x), r1=160(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single purple pixel at (77, 48).
; PLAN: r0=77(x), r1=48(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 77
LDI r1, 48
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Creates a black circular shape at (162, 160) with radius 65.
; PLAN: r0=162(x), r1=160(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 160
LDI r2, 65
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
