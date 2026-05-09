; DESCRIPTION: Renders a magenta line between points (142, 5) and (147, 10).
; PLAN: r0=142(x1), r1=5(y1), r2=147(x2), r3=10(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 5
LDI r2, 147
LDI r3, 10
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
