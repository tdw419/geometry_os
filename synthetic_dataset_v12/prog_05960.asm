; DESCRIPTION: Draws a red line from (137, 38) to (226, 149).
; PLAN: r0=137(x1), r1=38(y1), r2=226(x2), r3=149(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 38
LDI r2, 226
LDI r3, 149
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
