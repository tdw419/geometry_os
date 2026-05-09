; DESCRIPTION: Composite: Sets a single purple pixel at (459, 42) then Draws a orange line from (391, 211) to (440, 73).
; PLAN: r0=459(x), r1=42(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=391(x1), r6=211(y1), r7=440(x2), r8=73(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 459
LDI r1, 42
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 391
LDI r6, 211
LDI r7, 440
LDI r8, 73
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
