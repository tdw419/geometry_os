; DESCRIPTION: Draws a yellow line from (27, 169) to (188, 78).
; PLAN: r0=27(x1), r1=169(y1), r2=188(x2), r3=78(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 169
LDI r2, 188
LDI r3, 78
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
