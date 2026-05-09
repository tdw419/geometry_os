; DESCRIPTION: Composite: . Then Draws a orange line from (46, 172) to (201, 102). Then Sets a single blue pixel at (31, 66).
; PLAN: r0=46(x1), r1=172(y1), r2=201(x2), r3=102(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=31(x), r1=66(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a orange line from (46, 172) to (201, 102).
; PLAN: r0=46(x1), r1=172(y1), r2=201(x2), r3=102(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 172
LDI r2, 201
LDI r3, 102
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single blue pixel at (31, 66).
; PLAN: r0=31(x), r1=66(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 31
LDI r1, 66
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
