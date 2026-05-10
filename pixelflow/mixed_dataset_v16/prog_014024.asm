; DESCRIPTION: Composite: Sets a single red pixel at (486, 91) then Places a blue line segment connecting (102, 70) to (344, 17).
; PLAN: r0=486(x), r1=91(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=102(x1), r6=70(y1), r7=344(x2), r8=17(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 486
LDI r1, 91
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 102
LDI r6, 70
LDI r7, 344
LDI r8, 17
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
