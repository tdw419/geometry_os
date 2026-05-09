; DESCRIPTION: Composite: . Then Sets a single blue pixel at (205, 61). Then Creates a black circular shape at (42, 102) with radius 39.
; PLAN: r0=205(x), r1=61(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=42(x), r1=102(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single blue pixel at (205, 61).
; PLAN: r0=205(x), r1=61(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 205
LDI r1, 61
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Creates a black circular shape at (42, 102) with radius 39.
; PLAN: r0=42(x), r1=102(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 42
LDI r1, 102
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
