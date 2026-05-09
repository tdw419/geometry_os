; DESCRIPTION: Composite: Places a blue line segment connecting (495, 199) to (153, 218) then Sets a single red pixel at (222, 191).
; PLAN: r0=495(x1), r1=199(y1), r2=153(x2), r3=218(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=222(x), r6=191(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 495
LDI r1, 199
LDI r2, 153
LDI r3, 218
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 222
LDI r6, 191
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
