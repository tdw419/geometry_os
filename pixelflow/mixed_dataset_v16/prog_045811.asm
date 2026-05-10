; DESCRIPTION: Draws a red line from (188, 169) to (239, 165).
; PLAN: r0=188(x1), r1=169(y1), r2=239(x2), r3=165(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 169
LDI r2, 239
LDI r3, 165
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
