; DESCRIPTION: Composite: Draws a yellow line from (212, 96) to (122, 201) then Sets a single purple pixel at (13, 181).
; PLAN: r0=212(x1), r1=96(y1), r2=122(x2), r3=201(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=13(x), r6=181(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 212
LDI r1, 96
LDI r2, 122
LDI r3, 201
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 13
LDI r6, 181
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
