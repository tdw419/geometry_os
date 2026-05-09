; DESCRIPTION: Composite: Sets a single cyan pixel at (342, 118) then Draws a yellow line from (105, 84) to (364, 226).
; PLAN: r0=342(x), r1=118(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=105(x1), r6=84(y1), r7=364(x2), r8=226(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 342
LDI r1, 118
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 105
LDI r6, 84
LDI r7, 364
LDI r8, 226
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
