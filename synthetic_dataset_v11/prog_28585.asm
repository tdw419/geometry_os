; DESCRIPTION: Renders a orange line between points (55, 63) and (147, 237).
; PLAN: r0=55(x1), r1=63(y1), r2=147(x2), r3=237(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 63
LDI r2, 147
LDI r3, 237
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
