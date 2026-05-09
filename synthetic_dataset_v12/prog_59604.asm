; DESCRIPTION: Composite: Renders a magenta line between points (158, 132) and (468, 218) then Places a purple dot at position (323, 78).
; PLAN: r0=158(x1), r1=132(y1), r2=468(x2), r3=218(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=323(x), r6=78(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 158
LDI r1, 132
LDI r2, 468
LDI r3, 218
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 323
LDI r6, 78
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
