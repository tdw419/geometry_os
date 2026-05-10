; DESCRIPTION: Composite: Sets a single orange pixel at (222, 114) then Draws a red line from (268, 25) to (409, 249).
; PLAN: r0=222(x), r1=114(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=268(x1), r6=25(y1), r7=409(x2), r8=249(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 222
LDI r1, 114
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 268
LDI r6, 25
LDI r7, 409
LDI r8, 249
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
