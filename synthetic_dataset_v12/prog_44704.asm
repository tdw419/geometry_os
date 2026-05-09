; DESCRIPTION: Composite: Places a white line segment connecting (192, 161) to (455, 248) then Sets a single yellow pixel at (447, 201).
; PLAN: r0=192(x1), r1=161(y1), r2=455(x2), r3=248(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=447(x), r6=201(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 192
LDI r1, 161
LDI r2, 455
LDI r3, 248
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 447
LDI r6, 201
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
