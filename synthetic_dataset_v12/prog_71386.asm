; DESCRIPTION: Draws a magenta line from (456, 169) to (129, 122).
; PLAN: r0=456(x1), r1=169(y1), r2=129(x2), r3=122(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 169
LDI r2, 129
LDI r3, 122
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
