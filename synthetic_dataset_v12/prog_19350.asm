; DESCRIPTION: Renders a magenta line between points (363, 2) and (147, 2).
; PLAN: r0=363(x1), r1=2(y1), r2=147(x2), r3=2(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 2
LDI r2, 147
LDI r3, 2
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
