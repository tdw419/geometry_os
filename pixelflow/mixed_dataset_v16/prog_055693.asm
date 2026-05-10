; DESCRIPTION: Composite: Renders a orange line between points (467, 109) and (225, 133) then Sets a single red pixel at (51, 201).
; PLAN: r0=467(x1), r1=109(y1), r2=225(x2), r3=133(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=51(x), r6=201(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 467
LDI r1, 109
LDI r2, 225
LDI r3, 133
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 51
LDI r6, 201
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
