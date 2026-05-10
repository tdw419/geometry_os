; DESCRIPTION: Composite: Places a purple dot at position (250, 124) then Draws a orange line from (503, 175) to (334, 126).
; PLAN: r0=250(x), r1=124(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=503(x1), r6=175(y1), r7=334(x2), r8=126(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 250
LDI r1, 124
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 503
LDI r6, 175
LDI r7, 334
LDI r8, 126
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
