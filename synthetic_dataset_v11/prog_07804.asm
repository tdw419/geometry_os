; DESCRIPTION: Composite: . Then Sets a single black pixel at (117, 145). Then Places a green line segment connecting (183, 187) to (162, 64).
; PLAN: r0=117(x), r1=145(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=183(x1), r1=187(y1), r2=162(x2), r3=64(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single black pixel at (117, 145).
; PLAN: r0=117(x), r1=145(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 117
LDI r1, 145
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Places a green line segment connecting (183, 187) to (162, 64).
; PLAN: r0=183(x1), r1=187(y1), r2=162(x2), r3=64(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 187
LDI r2, 162
LDI r3, 64
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
