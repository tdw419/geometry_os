; DESCRIPTION: Composite: . Then Places a purple dot at position (248, 7). Then Places a orange circle of radius 74 at center (107, 156).
; PLAN: r0=248(x), r1=7(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=107(x), r1=156(y), r2=74(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a purple dot at position (248, 7).
; PLAN: r0=248(x), r1=7(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 248
LDI r1, 7
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Places a orange circle of radius 74 at center (107, 156).
; PLAN: r0=107(x), r1=156(y), r2=74(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 156
LDI r2, 74
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
