; DESCRIPTION: Composite: Places a purple line segment connecting (140, 29) to (335, 90) then Places a orange dot at position (194, 54).
; PLAN: r0=140(x1), r1=29(y1), r2=335(x2), r3=90(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=194(x), r6=54(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 140
LDI r1, 29
LDI r2, 335
LDI r3, 90
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 194
LDI r6, 54
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
