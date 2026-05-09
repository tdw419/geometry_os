; DESCRIPTION: Composite: . Then Places a orange circle of radius 17 at center (107, 199). Then Sets a single orange pixel at (9, 53).
; PLAN: r0=107(x), r1=199(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=9(x), r1=53(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a orange circle of radius 17 at center (107, 199).
; PLAN: r0=107(x), r1=199(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 199
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single orange pixel at (9, 53).
; PLAN: r0=9(x), r1=53(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 9
LDI r1, 53
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
