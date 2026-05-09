; DESCRIPTION: Composite: Draws a magenta line from (252, 99) to (348, 251) then Places a white dot at position (311, 250).
; PLAN: r0=252(x1), r1=99(y1), r2=348(x2), r3=251(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=311(x), r6=250(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 252
LDI r1, 99
LDI r2, 348
LDI r3, 251
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 311
LDI r6, 250
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
