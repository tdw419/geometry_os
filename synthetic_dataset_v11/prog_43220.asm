; DESCRIPTION: Composite: . Then Sets a single green pixel at (39, 185). Then Draws a blue circle centered at (157, 106) with radius 80.
; PLAN: r0=39(x), r1=185(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=157(x), r1=106(y), r2=80(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single green pixel at (39, 185).
; PLAN: r0=39(x), r1=185(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 39
LDI r1, 185
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Draws a blue circle centered at (157, 106) with radius 80.
; PLAN: r0=157(x), r1=106(y), r2=80(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 106
LDI r2, 80
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
