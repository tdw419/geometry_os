; DESCRIPTION: Composite: Places a cyan line segment connecting (473, 241) to (490, 72) then Sets a single orange pixel at (270, 188).
; PLAN: r0=473(x1), r1=241(y1), r2=490(x2), r3=72(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=270(x), r6=188(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 473
LDI r1, 241
LDI r2, 490
LDI r3, 72
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 270
LDI r6, 188
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
