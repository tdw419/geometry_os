; DESCRIPTION: Composite: Places a orange dot at position (316, 153) then Draws a red line from (198, 60) to (10, 166).
; PLAN: r0=316(x), r1=153(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=198(x1), r6=60(y1), r7=10(x2), r8=166(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 316
LDI r1, 153
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 198
LDI r6, 60
LDI r7, 10
LDI r8, 166
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
