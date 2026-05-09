; DESCRIPTION: Composite: . Then Draws a purple circle centered at (140, 143) with radius 61. Then Sets a single cyan pixel at (78, 175).
; PLAN: r0=140(x), r1=143(y), r2=61(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=78(x), r1=175(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a purple circle centered at (140, 143) with radius 61.
; PLAN: r0=140(x), r1=143(y), r2=61(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 143
LDI r2, 61
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single cyan pixel at (78, 175).
; PLAN: r0=78(x), r1=175(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 78
LDI r1, 175
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
