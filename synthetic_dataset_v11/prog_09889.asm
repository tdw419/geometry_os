; DESCRIPTION: Composite: . Then Creates a white circular shape at (205, 146) with radius 20. Then Sets a single blue pixel at (63, 71).
; PLAN: r0=205(x), r1=146(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=63(x), r1=71(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a white circular shape at (205, 146) with radius 20.
; PLAN: r0=205(x), r1=146(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 205
LDI r1, 146
LDI r2, 20
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single blue pixel at (63, 71).
; PLAN: r0=63(x), r1=71(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 63
LDI r1, 71
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
