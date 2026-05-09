; DESCRIPTION: Composite: . Then Sets a single red pixel at (144, 86). Then Draws a orange circle centered at (57, 113) with radius 12.
; PLAN: r0=144(x), r1=86(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=57(x), r1=113(y), r2=12(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single red pixel at (144, 86).
; PLAN: r0=144(x), r1=86(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 144
LDI r1, 86
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Draws a orange circle centered at (57, 113) with radius 12.
; PLAN: r0=57(x), r1=113(y), r2=12(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 57
LDI r1, 113
LDI r2, 12
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
