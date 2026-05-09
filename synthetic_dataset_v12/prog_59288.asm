; DESCRIPTION: Composite: Sets a single purple pixel at (364, 98) then Draws a green line from (344, 102) to (293, 35).
; PLAN: r0=364(x), r1=98(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=344(x1), r6=102(y1), r7=293(x2), r8=35(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 364
LDI r1, 98
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 344
LDI r6, 102
LDI r7, 293
LDI r8, 35
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
