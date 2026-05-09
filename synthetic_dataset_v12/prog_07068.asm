; DESCRIPTION: Draws a green line from (287, 41) to (437, 169).
; PLAN: r0=287(x1), r1=41(y1), r2=437(x2), r3=169(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 41
LDI r2, 437
LDI r3, 169
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
