; DESCRIPTION: Composite: . Then Draws a red circle centered at (183, 111) with radius 20. Then Places a orange dot at position (155, 28).
; PLAN: r0=183(x), r1=111(y), r2=20(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=155(x), r1=28(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a red circle centered at (183, 111) with radius 20.
; PLAN: r0=183(x), r1=111(y), r2=20(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 111
LDI r2, 20
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a orange dot at position (155, 28).
; PLAN: r0=155(x), r1=28(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 155
LDI r1, 28
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
