; DESCRIPTION: Composite: . Then Draws a cyan circle centered at (44, 29) with radius 14. Then Sets a single cyan pixel at (15, 159).
; PLAN: r0=44(x), r1=29(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=15(x), r1=159(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a cyan circle centered at (44, 29) with radius 14.
; PLAN: r0=44(x), r1=29(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 44
LDI r1, 29
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single cyan pixel at (15, 159).
; PLAN: r0=15(x), r1=159(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 15
LDI r1, 159
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
