; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (127, 66). Then Draws a orange circle centered at (165, 90) with radius 76.
; PLAN: r0=127(x), r1=66(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=165(x), r1=90(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single cyan pixel at (127, 66).
; PLAN: r0=127(x), r1=66(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 127
LDI r1, 66
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a orange circle centered at (165, 90) with radius 76.
; PLAN: r0=165(x), r1=90(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 90
LDI r2, 76
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
