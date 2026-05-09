; DESCRIPTION: Renders a orange line between points (9, 147) and (147, 69).
; PLAN: r0=9(x1), r1=147(y1), r2=147(x2), r3=69(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 147
LDI r2, 147
LDI r3, 69
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
