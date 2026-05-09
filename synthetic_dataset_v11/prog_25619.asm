; DESCRIPTION: Draws a red line from (163, 134) to (223, 137).
; PLAN: r0=163(x1), r1=134(y1), r2=223(x2), r3=137(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 134
LDI r2, 223
LDI r3, 137
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
