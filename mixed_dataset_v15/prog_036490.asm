; DESCRIPTION: Composite: Sets a single red pixel at (431, 163) then Draws a orange line from (394, 64) to (483, 181).
; PLAN: r0=431(x), r1=163(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=394(x1), r6=64(y1), r7=483(x2), r8=181(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 431
LDI r1, 163
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 394
LDI r6, 64
LDI r7, 483
LDI r8, 181
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
