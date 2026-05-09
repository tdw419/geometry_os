; DESCRIPTION: Composite: . Then Draws a blue circle centered at (190, 87) with radius 56. Then Sets a single green pixel at (223, 153).
; PLAN: r0=190(x), r1=87(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=223(x), r1=153(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a blue circle centered at (190, 87) with radius 56.
; PLAN: r0=190(x), r1=87(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 87
LDI r2, 56
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single green pixel at (223, 153).
; PLAN: r0=223(x), r1=153(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 223
LDI r1, 153
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
