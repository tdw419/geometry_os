; DESCRIPTION: Composite: . Then Draws a blue line from (34, 246) to (229, 201). Then Sets a single red pixel at (178, 52).
; PLAN: r0=34(x1), r1=246(y1), r2=229(x2), r3=201(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=178(x), r1=52(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a blue line from (34, 246) to (229, 201).
; PLAN: r0=34(x1), r1=246(y1), r2=229(x2), r3=201(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 246
LDI r2, 229
LDI r3, 201
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single red pixel at (178, 52).
; PLAN: r0=178(x), r1=52(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 178
LDI r1, 52
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
