; DESCRIPTION: Draws a red line from (189, 174) to (4, 133).
; PLAN: r0=189(x1), r1=174(y1), r2=4(x2), r3=133(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 174
LDI r2, 4
LDI r3, 133
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
