; DESCRIPTION: Composite: Draws a red line from (344, 107) to (250, 68) then Sets a single cyan pixel at (404, 15).
; PLAN: r0=344(x1), r1=107(y1), r2=250(x2), r3=68(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=404(x), r6=15(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 344
LDI r1, 107
LDI r2, 250
LDI r3, 68
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 404
LDI r6, 15
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
