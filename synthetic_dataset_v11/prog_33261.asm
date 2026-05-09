; DESCRIPTION: Composite: . Then Sets a single blue pixel at (182, 159). Then Places a purple line segment connecting (229, 187) to (70, 166).
; PLAN: r0=182(x), r1=159(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=229(x1), r1=187(y1), r2=70(x2), r3=166(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single blue pixel at (182, 159).
; PLAN: r0=182(x), r1=159(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 182
LDI r1, 159
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Places a purple line segment connecting (229, 187) to (70, 166).
; PLAN: r0=229(x1), r1=187(y1), r2=70(x2), r3=166(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 187
LDI r2, 70
LDI r3, 166
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
