; DESCRIPTION: Composite: . Then Draws a purple circle centered at (225, 57) with radius 28. Then Sets a single purple pixel at (46, 135).
; PLAN: r0=225(x), r1=57(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=46(x), r1=135(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a purple circle centered at (225, 57) with radius 28.
; PLAN: r0=225(x), r1=57(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 57
LDI r2, 28
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single purple pixel at (46, 135).
; PLAN: r0=46(x), r1=135(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 46
LDI r1, 135
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
