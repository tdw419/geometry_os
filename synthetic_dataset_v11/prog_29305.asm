; DESCRIPTION: Renders a yellow line between points (54, 197) and (41, 79).
; PLAN: r0=54(x1), r1=197(y1), r2=41(x2), r3=79(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 197
LDI r2, 41
LDI r3, 79
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
