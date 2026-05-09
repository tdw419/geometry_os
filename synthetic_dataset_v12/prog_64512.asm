; DESCRIPTION: Draws a red line from (304, 252) to (89, 129).
; PLAN: r0=304(x1), r1=252(y1), r2=89(x2), r3=129(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 252
LDI r2, 89
LDI r3, 129
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
