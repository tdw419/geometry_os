; DESCRIPTION: Composite: Sets a single yellow pixel at (493, 114) then Places a yellow line segment connecting (14, 232) to (344, 225).
; PLAN: r0=493(x), r1=114(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=14(x1), r6=232(y1), r7=344(x2), r8=225(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 493
LDI r1, 114
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 14
LDI r6, 232
LDI r7, 344
LDI r8, 225
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
