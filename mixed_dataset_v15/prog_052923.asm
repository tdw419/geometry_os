; DESCRIPTION: Draws a red line from (72, 122) to (129, 185).
; PLAN: r0=72(x1), r1=122(y1), r2=129(x2), r3=185(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 122
LDI r2, 129
LDI r3, 185
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
