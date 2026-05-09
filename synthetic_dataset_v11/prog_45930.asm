; DESCRIPTION: Renders a orange line between points (121, 193) and (8, 147).
; PLAN: r0=121(x1), r1=193(y1), r2=8(x2), r3=147(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 193
LDI r2, 8
LDI r3, 147
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
