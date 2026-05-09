; DESCRIPTION: Draws a red line from (81, 174) to (212, 85).
; PLAN: r0=81(x1), r1=174(y1), r2=212(x2), r3=85(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 174
LDI r2, 212
LDI r3, 85
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
