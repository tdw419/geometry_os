; DESCRIPTION: Composite: Sets a single yellow pixel at (482, 81) then Draws a yellow line from (270, 84) to (76, 85).
; PLAN: r0=482(x), r1=81(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=270(x1), r6=84(y1), r7=76(x2), r8=85(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 482
LDI r1, 81
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 270
LDI r6, 84
LDI r7, 76
LDI r8, 85
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
