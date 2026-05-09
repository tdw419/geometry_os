; DESCRIPTION: Draws a red line from (78, 89) to (204, 95).
; PLAN: r0=78(x1), r1=89(y1), r2=204(x2), r3=95(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 89
LDI r2, 204
LDI r3, 95
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
