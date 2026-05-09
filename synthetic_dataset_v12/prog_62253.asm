; DESCRIPTION: Draws a magenta line from (147, 47) to (233, 229).
; PLAN: r0=147(x1), r1=47(y1), r2=233(x2), r3=229(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 47
LDI r2, 233
LDI r3, 229
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
