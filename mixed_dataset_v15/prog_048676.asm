; DESCRIPTION: Draws a red line from (175, 41) to (15, 147).
; PLAN: r0=175(x1), r1=41(y1), r2=15(x2), r3=147(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 41
LDI r2, 15
LDI r3, 147
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
