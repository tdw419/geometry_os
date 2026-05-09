; DESCRIPTION: Draws a green line from (314, 41) to (302, 120).
; PLAN: r0=314(x1), r1=41(y1), r2=302(x2), r3=120(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 41
LDI r2, 302
LDI r3, 120
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
