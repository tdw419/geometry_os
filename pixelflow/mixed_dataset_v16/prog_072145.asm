; DESCRIPTION: Draws a red line from (95, 169) to (307, 41).
; PLAN: r0=95(x1), r1=169(y1), r2=307(x2), r3=41(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 169
LDI r2, 307
LDI r3, 41
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
