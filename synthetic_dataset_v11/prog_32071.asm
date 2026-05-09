; DESCRIPTION: Draws a yellow line from (149, 169) to (177, 241).
; PLAN: r0=149(x1), r1=169(y1), r2=177(x2), r3=241(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 169
LDI r2, 177
LDI r3, 241
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
