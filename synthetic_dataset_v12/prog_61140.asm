; DESCRIPTION: Composite: Sets a single black pixel at (60, 9) then Draws a red line from (150, 110) to (195, 164).
; PLAN: r0=60(x), r1=9(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=150(x1), r6=110(y1), r7=195(x2), r8=164(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 60
LDI r1, 9
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 150
LDI r6, 110
LDI r7, 195
LDI r8, 164
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
