; DESCRIPTION: Composite: . Then Renders a purple disk with center (83, 109) and radius 48. Then Places a orange dot at position (58, 188).
; PLAN: r0=83(x), r1=109(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=58(x), r1=188(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a purple disk with center (83, 109) and radius 48.
; PLAN: r0=83(x), r1=109(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 109
LDI r2, 48
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a orange dot at position (58, 188).
; PLAN: r0=58(x), r1=188(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 58
LDI r1, 188
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
