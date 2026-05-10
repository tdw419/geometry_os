; DESCRIPTION: Composite: Places a white dot at position (448, 201) then Renders a yellow line between points (396, 187) and (98, 77).
; PLAN: r0=448(x), r1=201(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=396(x1), r6=187(y1), r7=98(x2), r8=77(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 448
LDI r1, 201
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 396
LDI r6, 187
LDI r7, 98
LDI r8, 77
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
