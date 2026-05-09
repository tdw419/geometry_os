; DESCRIPTION: Composite: Places a purple line segment connecting (228, 205) to (44, 236) then Sets a single yellow pixel at (105, 181).
; PLAN: r0=228(x1), r1=205(y1), r2=44(x2), r3=236(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=105(x), r6=181(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 228
LDI r1, 205
LDI r2, 44
LDI r3, 236
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 105
LDI r6, 181
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
