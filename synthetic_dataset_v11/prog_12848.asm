; DESCRIPTION: Draws a red line from (251, 201) to (15, 207).
; PLAN: r0=251(x1), r1=201(y1), r2=15(x2), r3=207(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 201
LDI r2, 15
LDI r3, 207
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
