; DESCRIPTION: Composite: Draws a orange line from (321, 176) to (221, 92) then Places a orange dot at position (251, 171).
; PLAN: r0=321(x1), r1=176(y1), r2=221(x2), r3=92(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=251(x), r6=171(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 321
LDI r1, 176
LDI r2, 221
LDI r3, 92
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 251
LDI r6, 171
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
