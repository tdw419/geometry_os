; DESCRIPTION: Draws a blue line from (290, 169) to (106, 15).
; PLAN: r0=290(x1), r1=169(y1), r2=106(x2), r3=15(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 169
LDI r2, 106
LDI r3, 15
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
