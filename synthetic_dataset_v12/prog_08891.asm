; DESCRIPTION: Composite: Sets a single red pixel at (332, 17) then Renders a magenta line between points (133, 143) and (396, 145).
; PLAN: r0=332(x), r1=17(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=133(x1), r6=143(y1), r7=396(x2), r8=145(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 332
LDI r1, 17
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 133
LDI r6, 143
LDI r7, 396
LDI r8, 145
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
