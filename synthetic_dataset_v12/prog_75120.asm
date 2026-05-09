; DESCRIPTION: Composite: Places a purple line segment connecting (374, 1) to (411, 71) then Places a red dot at position (99, 139).
; PLAN: r0=374(x1), r1=1(y1), r2=411(x2), r3=71(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=99(x), r6=139(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 374
LDI r1, 1
LDI r2, 411
LDI r3, 71
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 99
LDI r6, 139
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
