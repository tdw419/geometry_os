; DESCRIPTION: Composite: . Then Draws a cyan circle centered at (153, 90) with radius 66. Then Sets a single cyan pixel at (120, 245).
; PLAN: r0=153(x), r1=90(y), r2=66(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=120(x), r1=245(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a cyan circle centered at (153, 90) with radius 66.
; PLAN: r0=153(x), r1=90(y), r2=66(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 90
LDI r2, 66
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single cyan pixel at (120, 245).
; PLAN: r0=120(x), r1=245(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 120
LDI r1, 245
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
