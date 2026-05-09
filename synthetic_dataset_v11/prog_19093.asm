; DESCRIPTION: Composite: . Then Sets a single orange pixel at (57, 157). Then Renders a purple disk with center (97, 175) and radius 65.
; PLAN: r0=57(x), r1=157(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=97(x), r1=175(y), r2=65(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single orange pixel at (57, 157).
; PLAN: r0=57(x), r1=157(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 57
LDI r1, 157
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Renders a purple disk with center (97, 175) and radius 65.
; PLAN: r0=97(x), r1=175(y), r2=65(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 175
LDI r2, 65
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
