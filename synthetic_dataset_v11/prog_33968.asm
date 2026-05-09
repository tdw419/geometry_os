; DESCRIPTION: Composite: . Then Places a orange circle of radius 70 at center (139, 166). Then Places a purple dot at position (37, 45).
; PLAN: r0=139(x), r1=166(y), r2=70(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=37(x), r1=45(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a orange circle of radius 70 at center (139, 166).
; PLAN: r0=139(x), r1=166(y), r2=70(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 166
LDI r2, 70
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a purple dot at position (37, 45).
; PLAN: r0=37(x), r1=45(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 37
LDI r1, 45
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
