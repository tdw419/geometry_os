; DESCRIPTION: Renders a magenta line between points (432, 20) and (64, 147).
; PLAN: r0=432(x1), r1=20(y1), r2=64(x2), r3=147(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 20
LDI r2, 64
LDI r3, 147
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
