; DESCRIPTION: Renders a orange line between points (138, 21) and (147, 37).
; PLAN: r0=138(x1), r1=21(y1), r2=147(x2), r3=37(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 21
LDI r2, 147
LDI r3, 37
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
