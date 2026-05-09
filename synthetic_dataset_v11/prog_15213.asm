; DESCRIPTION: Composite: . Then Draws a blue circle centered at (91, 97) with radius 77. Then Sets a single cyan pixel at (40, 171).
; PLAN: r0=91(x), r1=97(y), r2=77(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=40(x), r1=171(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a blue circle centered at (91, 97) with radius 77.
; PLAN: r0=91(x), r1=97(y), r2=77(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 97
LDI r2, 77
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single cyan pixel at (40, 171).
; PLAN: r0=40(x), r1=171(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 40
LDI r1, 171
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
