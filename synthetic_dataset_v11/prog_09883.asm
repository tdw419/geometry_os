; DESCRIPTION: Composite: . Then Sets a single blue pixel at (114, 7). Then Draws a orange circle centered at (73, 154) with radius 61.
; PLAN: r0=114(x), r1=7(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=73(x), r1=154(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single blue pixel at (114, 7).
; PLAN: r0=114(x), r1=7(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 114
LDI r1, 7
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Draws a orange circle centered at (73, 154) with radius 61.
; PLAN: r0=73(x), r1=154(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 73
LDI r1, 154
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
