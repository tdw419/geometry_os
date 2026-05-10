; DESCRIPTION: Renders a magenta line between points (283, 252) and (169, 198).
; PLAN: r0=283(x1), r1=252(y1), r2=169(x2), r3=198(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 252
LDI r2, 169
LDI r3, 198
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
