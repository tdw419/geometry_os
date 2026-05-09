; DESCRIPTION: Draws a red line from (226, 169) to (198, 66).
; PLAN: r0=226(x1), r1=169(y1), r2=198(x2), r3=66(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 169
LDI r2, 198
LDI r3, 66
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
