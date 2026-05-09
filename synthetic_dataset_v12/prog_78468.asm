; DESCRIPTION: Composite: Sets a single black pixel at (70, 145) then Places a orange line segment connecting (359, 86) to (222, 201).
; PLAN: r0=70(x), r1=145(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=359(x1), r6=86(y1), r7=222(x2), r8=201(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 70
LDI r1, 145
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 359
LDI r6, 86
LDI r7, 222
LDI r8, 201
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
