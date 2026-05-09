; DESCRIPTION: Composite: . Then Creates a white circular shape at (199, 216) with radius 33. Then Sets a single purple pixel at (60, 71).
; PLAN: r0=199(x), r1=216(y), r2=33(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=60(x), r1=71(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a white circular shape at (199, 216) with radius 33.
; PLAN: r0=199(x), r1=216(y), r2=33(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 199
LDI r1, 216
LDI r2, 33
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single purple pixel at (60, 71).
; PLAN: r0=60(x), r1=71(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 60
LDI r1, 71
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
