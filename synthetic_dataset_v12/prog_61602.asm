; DESCRIPTION: Draws a red line from (266, 121) to (193, 188).
; PLAN: r0=266(x1), r1=121(y1), r2=193(x2), r3=188(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 121
LDI r2, 193
LDI r3, 188
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
