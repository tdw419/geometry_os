; DESCRIPTION: Draws a red line from (201, 190) to (138, 89).
; PLAN: r0=201(x1), r1=190(y1), r2=138(x2), r3=89(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 190
LDI r2, 138
LDI r3, 89
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
