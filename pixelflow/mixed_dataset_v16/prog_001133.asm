; DESCRIPTION: Renders a orange line between points (212, 147) and (363, 184).
; PLAN: r0=212(x1), r1=147(y1), r2=363(x2), r3=184(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 147
LDI r2, 363
LDI r3, 184
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
