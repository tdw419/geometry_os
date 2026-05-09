; DESCRIPTION: Composite: . Then Places a white line segment connecting (165, 140) to (134, 201). Then Places a white dot at position (170, 86).
; PLAN: r0=165(x1), r1=140(y1), r2=134(x2), r3=201(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=170(x), r1=86(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a white line segment connecting (165, 140) to (134, 201).
; PLAN: r0=165(x1), r1=140(y1), r2=134(x2), r3=201(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 140
LDI r2, 134
LDI r3, 201
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a white dot at position (170, 86).
; PLAN: r0=170(x), r1=86(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 170
LDI r1, 86
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
