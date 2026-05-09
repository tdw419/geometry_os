; DESCRIPTION: Renders a orange line between points (147, 102) and (25, 91).
; PLAN: r0=147(x1), r1=102(y1), r2=25(x2), r3=91(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 102
LDI r2, 25
LDI r3, 91
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
