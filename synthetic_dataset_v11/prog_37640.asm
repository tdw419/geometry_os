; DESCRIPTION: Renders a magenta line between points (101, 112) and (147, 68).
; PLAN: r0=101(x1), r1=112(y1), r2=147(x2), r3=68(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 112
LDI r2, 147
LDI r3, 68
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
