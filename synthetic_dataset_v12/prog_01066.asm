; DESCRIPTION: Renders a magenta line between points (278, 252) and (54, 137).
; PLAN: r0=278(x1), r1=252(y1), r2=54(x2), r3=137(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 252
LDI r2, 54
LDI r3, 137
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
