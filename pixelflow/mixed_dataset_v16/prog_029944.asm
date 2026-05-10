; DESCRIPTION: Composite: Renders a orange line between points (349, 150) and (82, 85) then Sets a single red pixel at (205, 170).
; PLAN: r0=349(x1), r1=150(y1), r2=82(x2), r3=85(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=205(x), r6=170(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 349
LDI r1, 150
LDI r2, 82
LDI r3, 85
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 205
LDI r6, 170
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
