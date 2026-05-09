; DESCRIPTION: Renders a yellow line between points (316, 221) and (302, 79).
; PLAN: r0=316(x1), r1=221(y1), r2=302(x2), r3=79(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 221
LDI r2, 302
LDI r3, 79
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
