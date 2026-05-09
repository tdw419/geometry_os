; DESCRIPTION: Composite: . Then Draws a white circle centered at (99, 118) with radius 40. Then Places a purple dot at position (241, 35).
; PLAN: r0=99(x), r1=118(y), r2=40(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=241(x), r1=35(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a white circle centered at (99, 118) with radius 40.
; PLAN: r0=99(x), r1=118(y), r2=40(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 118
LDI r2, 40
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a purple dot at position (241, 35).
; PLAN: r0=241(x), r1=35(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 241
LDI r1, 35
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
