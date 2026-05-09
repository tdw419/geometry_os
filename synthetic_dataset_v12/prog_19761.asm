; DESCRIPTION: Draws a red line from (432, 187) to (355, 5).
; PLAN: r0=432(x1), r1=187(y1), r2=355(x2), r3=5(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 187
LDI r2, 355
LDI r3, 5
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
