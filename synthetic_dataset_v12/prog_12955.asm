; DESCRIPTION: Composite: Places a black line segment connecting (222, 139) to (332, 118) then Sets a single purple pixel at (410, 79).
; PLAN: r0=222(x1), r1=139(y1), r2=332(x2), r3=118(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=410(x), r6=79(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 222
LDI r1, 139
LDI r2, 332
LDI r3, 118
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 410
LDI r6, 79
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
