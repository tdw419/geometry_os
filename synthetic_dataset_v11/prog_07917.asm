; DESCRIPTION: Composite: . Then Places a purple dot at position (88, 159). Then Places a purple circle of radius 25 at center (79, 106).
; PLAN: r0=88(x), r1=159(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=79(x), r1=106(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a purple dot at position (88, 159).
; PLAN: r0=88(x), r1=159(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 88
LDI r1, 159
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Places a purple circle of radius 25 at center (79, 106).
; PLAN: r0=79(x), r1=106(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 106
LDI r2, 25
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
