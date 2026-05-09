; DESCRIPTION: Composite: . Then Places a magenta line segment connecting (232, 75) to (193, 221). Then Sets a single red pixel at (97, 194).
; PLAN: r0=232(x1), r1=75(y1), r2=193(x2), r3=221(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=97(x), r1=194(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a magenta line segment connecting (232, 75) to (193, 221).
; PLAN: r0=232(x1), r1=75(y1), r2=193(x2), r3=221(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 75
LDI r2, 193
LDI r3, 221
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single red pixel at (97, 194).
; PLAN: r0=97(x), r1=194(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 97
LDI r1, 194
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
