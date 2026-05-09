; DESCRIPTION: Composite: . Then Draws a purple circle centered at (150, 57) with radius 46. Then Sets a single yellow pixel at (89, 160).
; PLAN: r0=150(x), r1=57(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=89(x), r1=160(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a purple circle centered at (150, 57) with radius 46.
; PLAN: r0=150(x), r1=57(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 150
LDI r1, 57
LDI r2, 46
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single yellow pixel at (89, 160).
; PLAN: r0=89(x), r1=160(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 89
LDI r1, 160
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
