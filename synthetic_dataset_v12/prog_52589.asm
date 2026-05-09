; DESCRIPTION: Draws a red line from (273, 121) to (321, 155).
; PLAN: r0=273(x1), r1=121(y1), r2=321(x2), r3=155(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 121
LDI r2, 321
LDI r3, 155
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
