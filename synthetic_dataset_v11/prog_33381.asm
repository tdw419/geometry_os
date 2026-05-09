; DESCRIPTION: Composite: . Then Sets a single black pixel at (202, 35). Then Places a black line segment connecting (75, 125) to (196, 159).
; PLAN: r0=202(x), r1=35(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=75(x1), r1=125(y1), r2=196(x2), r3=159(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single black pixel at (202, 35).
; PLAN: r0=202(x), r1=35(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 202
LDI r1, 35
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Places a black line segment connecting (75, 125) to (196, 159).
; PLAN: r0=75(x1), r1=125(y1), r2=196(x2), r3=159(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 125
LDI r2, 196
LDI r3, 159
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
