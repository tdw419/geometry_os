; DESCRIPTION: Composite: Sets a single yellow pixel at (321, 145) then Draws a green line from (429, 170) to (461, 146).
; PLAN: r0=321(x), r1=145(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=429(x1), r6=170(y1), r7=461(x2), r8=146(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 321
LDI r1, 145
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 429
LDI r6, 170
LDI r7, 461
LDI r8, 146
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
