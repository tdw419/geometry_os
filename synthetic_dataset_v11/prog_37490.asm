; DESCRIPTION: Composite: . Then Sets a single purple pixel at (200, 140). Then Places a red line segment connecting (101, 30) to (3, 66).
; PLAN: r0=200(x), r1=140(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=101(x1), r1=30(y1), r2=3(x2), r3=66(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single purple pixel at (200, 140).
; PLAN: r0=200(x), r1=140(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 200
LDI r1, 140
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Places a red line segment connecting (101, 30) to (3, 66).
; PLAN: r0=101(x1), r1=30(y1), r2=3(x2), r3=66(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 30
LDI r2, 3
LDI r3, 66
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
