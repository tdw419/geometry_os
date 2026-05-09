; DESCRIPTION: Composite: Places a orange dot at position (178, 113) then Draws a orange line from (109, 90) to (110, 148).
; PLAN: r0=178(x), r1=113(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=109(x1), r6=90(y1), r7=110(x2), r8=148(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 178
LDI r1, 113
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 109
LDI r6, 90
LDI r7, 110
LDI r8, 148
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
