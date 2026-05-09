; DESCRIPTION: Draws a magenta line from (31, 169) to (129, 91).
; PLAN: r0=31(x1), r1=169(y1), r2=129(x2), r3=91(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 169
LDI r2, 129
LDI r3, 91
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
