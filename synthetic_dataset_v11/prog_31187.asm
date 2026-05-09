; DESCRIPTION: Renders a orange line between points (172, 147) and (158, 237).
; PLAN: r0=172(x1), r1=147(y1), r2=158(x2), r3=237(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 147
LDI r2, 158
LDI r3, 237
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
