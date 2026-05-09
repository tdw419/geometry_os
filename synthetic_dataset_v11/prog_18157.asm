; DESCRIPTION: Draws a red line from (78, 110) to (119, 109).
; PLAN: r0=78(x1), r1=110(y1), r2=119(x2), r3=109(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 110
LDI r2, 119
LDI r3, 109
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
