; DESCRIPTION: Draws a red line from (407, 82) to (40, 137).
; PLAN: r0=407(x1), r1=82(y1), r2=40(x2), r3=137(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 82
LDI r2, 40
LDI r3, 137
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
