; DESCRIPTION: Draws a red line from (186, 162) to (296, 156).
; PLAN: r0=186(x1), r1=162(y1), r2=296(x2), r3=156(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 162
LDI r2, 296
LDI r3, 156
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
