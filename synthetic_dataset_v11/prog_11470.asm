; DESCRIPTION: Draws a red line from (5, 110) to (93, 186).
; PLAN: r0=5(x1), r1=110(y1), r2=93(x2), r3=186(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 110
LDI r2, 93
LDI r3, 186
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
