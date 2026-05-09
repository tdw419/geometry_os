; DESCRIPTION: Renders a blue line between points (147, 95) and (156, 6).
; PLAN: r0=147(x1), r1=95(y1), r2=156(x2), r3=6(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 95
LDI r2, 156
LDI r3, 6
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
