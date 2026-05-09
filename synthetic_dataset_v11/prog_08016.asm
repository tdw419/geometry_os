; DESCRIPTION: Draws a yellow line from (17, 41) to (54, 212).
; PLAN: r0=17(x1), r1=41(y1), r2=54(x2), r3=212(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 41
LDI r2, 54
LDI r3, 212
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
