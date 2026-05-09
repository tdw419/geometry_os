; DESCRIPTION: Draws a red line from (27, 110) to (314, 233).
; PLAN: r0=27(x1), r1=110(y1), r2=314(x2), r3=233(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 110
LDI r2, 314
LDI r3, 233
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
