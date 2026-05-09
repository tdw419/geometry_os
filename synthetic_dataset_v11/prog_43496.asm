; DESCRIPTION: Composite: . Then Sets a single white pixel at (111, 216). Then Draws a cyan circle centered at (133, 110) with radius 31.
; PLAN: r0=111(x), r1=216(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=133(x), r1=110(y), r2=31(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single white pixel at (111, 216).
; PLAN: r0=111(x), r1=216(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 111
LDI r1, 216
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a cyan circle centered at (133, 110) with radius 31.
; PLAN: r0=133(x), r1=110(y), r2=31(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 110
LDI r2, 31
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
