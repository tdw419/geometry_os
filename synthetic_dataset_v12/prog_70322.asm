; DESCRIPTION: Draws a green line from (112, 169) to (222, 138).
; PLAN: r0=112(x1), r1=169(y1), r2=222(x2), r3=138(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 169
LDI r2, 222
LDI r3, 138
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
