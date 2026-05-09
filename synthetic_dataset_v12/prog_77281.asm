; DESCRIPTION: Draws a red line from (247, 41) to (101, 149).
; PLAN: r0=247(x1), r1=41(y1), r2=101(x2), r3=149(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 41
LDI r2, 101
LDI r3, 149
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
