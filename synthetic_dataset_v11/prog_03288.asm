; DESCRIPTION: Composite: . Then Sets a single blue pixel at (124, 71). Then Draws a purple circle centered at (77, 105) with radius 55.
; PLAN: r0=124(x), r1=71(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=77(x), r1=105(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single blue pixel at (124, 71).
; PLAN: r0=124(x), r1=71(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 124
LDI r1, 71
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Draws a purple circle centered at (77, 105) with radius 55.
; PLAN: r0=77(x), r1=105(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 105
LDI r2, 55
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
