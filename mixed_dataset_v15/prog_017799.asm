; DESCRIPTION: Composite: Sets a single yellow pixel at (338, 166) then Draws a orange line from (405, 50) to (350, 147).
; PLAN: r0=338(x), r1=166(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=405(x1), r6=50(y1), r7=350(x2), r8=147(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 338
LDI r1, 166
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 405
LDI r6, 50
LDI r7, 350
LDI r8, 147
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
