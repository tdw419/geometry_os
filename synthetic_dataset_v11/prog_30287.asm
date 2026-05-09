; DESCRIPTION: Composite: . Then Draws a blue circle centered at (193, 78) with radius 57. Then Sets a single purple pixel at (247, 245).
; PLAN: r0=193(x), r1=78(y), r2=57(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=247(x), r1=245(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a blue circle centered at (193, 78) with radius 57.
; PLAN: r0=193(x), r1=78(y), r2=57(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 78
LDI r2, 57
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single purple pixel at (247, 245).
; PLAN: r0=247(x), r1=245(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 247
LDI r1, 245
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
