; DESCRIPTION: Composite: Renders a orange line between points (331, 116) and (139, 121) then Sets a single orange pixel at (162, 110).
; PLAN: r0=331(x1), r1=116(y1), r2=139(x2), r3=121(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=162(x), r6=110(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 331
LDI r1, 116
LDI r2, 139
LDI r3, 121
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 162
LDI r6, 110
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
