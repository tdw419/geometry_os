; DESCRIPTION: Composite: Places a purple line segment connecting (466, 106) to (14, 89) then Places a red dot at position (301, 164).
; PLAN: r0=466(x1), r1=106(y1), r2=14(x2), r3=89(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=301(x), r6=164(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 466
LDI r1, 106
LDI r2, 14
LDI r3, 89
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 301
LDI r6, 164
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
