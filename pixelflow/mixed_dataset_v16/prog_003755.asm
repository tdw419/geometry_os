; DESCRIPTION: Renders a magenta line between points (399, 22) and (24, 147).
; PLAN: r0=399(x1), r1=22(y1), r2=24(x2), r3=147(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 22
LDI r2, 24
LDI r3, 147
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
