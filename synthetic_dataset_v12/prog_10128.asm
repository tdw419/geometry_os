; DESCRIPTION: Renders a orange line between points (211, 147) and (58, 156).
; PLAN: r0=211(x1), r1=147(y1), r2=58(x2), r3=156(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 147
LDI r2, 58
LDI r3, 156
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
