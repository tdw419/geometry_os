; DESCRIPTION: Draws a yellow line from (149, 113) to (54, 169).
; PLAN: r0=149(x1), r1=113(y1), r2=54(x2), r3=169(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 113
LDI r2, 54
LDI r3, 169
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
