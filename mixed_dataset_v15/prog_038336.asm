; DESCRIPTION: Draws a red line from (62, 155) to (123, 4).
; PLAN: r0=62(x1), r1=155(y1), r2=123(x2), r3=4(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 155
LDI r2, 123
LDI r3, 4
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
