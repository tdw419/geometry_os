; DESCRIPTION: Draws a red line from (507, 229) to (432, 233).
; PLAN: r0=507(x1), r1=229(y1), r2=432(x2), r3=233(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 229
LDI r2, 432
LDI r3, 233
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
