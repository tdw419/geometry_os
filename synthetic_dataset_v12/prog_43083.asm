; DESCRIPTION: Composite: Places a magenta line segment connecting (317, 192) to (181, 8) then Sets a single yellow pixel at (317, 124).
; PLAN: r0=317(x1), r1=192(y1), r2=181(x2), r3=8(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=317(x), r6=124(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 317
LDI r1, 192
LDI r2, 181
LDI r3, 8
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 317
LDI r6, 124
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
