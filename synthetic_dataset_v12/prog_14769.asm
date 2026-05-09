; DESCRIPTION: Draws a red line from (193, 110) to (201, 240).
; PLAN: r0=193(x1), r1=110(y1), r2=201(x2), r3=240(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 110
LDI r2, 201
LDI r3, 240
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
