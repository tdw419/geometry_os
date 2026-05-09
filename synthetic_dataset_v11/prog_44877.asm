; DESCRIPTION: Composite: . Then Sets a single blue pixel at (190, 85). Then Places a purple line segment connecting (146, 182) to (97, 75).
; PLAN: r0=190(x), r1=85(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=146(x1), r1=182(y1), r2=97(x2), r3=75(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single blue pixel at (190, 85).
; PLAN: r0=190(x), r1=85(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 190
LDI r1, 85
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Places a purple line segment connecting (146, 182) to (97, 75).
; PLAN: r0=146(x1), r1=182(y1), r2=97(x2), r3=75(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 182
LDI r2, 97
LDI r3, 75
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
