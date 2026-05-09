; DESCRIPTION: Composite: . Then Creates a black circular shape at (84, 170) with radius 63. Then Sets a single red pixel at (232, 40).
; PLAN: r0=84(x), r1=170(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=232(x), r1=40(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a black circular shape at (84, 170) with radius 63.
; PLAN: r0=84(x), r1=170(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 170
LDI r2, 63
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single red pixel at (232, 40).
; PLAN: r0=232(x), r1=40(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 232
LDI r1, 40
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
