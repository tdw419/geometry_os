; DESCRIPTION: Draws a red line from (369, 77) to (431, 189).
; PLAN: r0=369(x1), r1=77(y1), r2=431(x2), r3=189(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 77
LDI r2, 431
LDI r3, 189
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
