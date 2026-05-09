; DESCRIPTION: Composite: . Then Draws a orange circle centered at (133, 163) with radius 48. Then Sets a single orange pixel at (207, 238).
; PLAN: r0=133(x), r1=163(y), r2=48(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=207(x), r1=238(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a orange circle centered at (133, 163) with radius 48.
; PLAN: r0=133(x), r1=163(y), r2=48(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 163
LDI r2, 48
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single orange pixel at (207, 238).
; PLAN: r0=207(x), r1=238(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 207
LDI r1, 238
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
