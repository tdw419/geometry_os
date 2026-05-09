; DESCRIPTION: Draws a red line from (138, 141) to (188, 169).
; PLAN: r0=138(x1), r1=141(y1), r2=188(x2), r3=169(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 141
LDI r2, 188
LDI r3, 169
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
