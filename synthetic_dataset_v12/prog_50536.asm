; DESCRIPTION: Composite: Draws a white line from (361, 13) to (61, 118) then Sets a single orange pixel at (465, 97).
; PLAN: r0=361(x1), r1=13(y1), r2=61(x2), r3=118(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=465(x), r6=97(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 361
LDI r1, 13
LDI r2, 61
LDI r3, 118
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 465
LDI r6, 97
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
