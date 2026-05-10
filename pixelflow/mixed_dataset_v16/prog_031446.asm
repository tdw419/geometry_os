; DESCRIPTION: Composite: Sets a single green pixel at (495, 160) then Draws a blue line from (471, 17) to (166, 61).
; PLAN: r0=495(x), r1=160(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=471(x1), r6=17(y1), r7=166(x2), r8=61(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 495
LDI r1, 160
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 471
LDI r6, 17
LDI r7, 166
LDI r8, 61
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
