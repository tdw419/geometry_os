; DESCRIPTION: Renders a orange line between points (172, 169) and (198, 89).
; PLAN: r0=172(x1), r1=169(y1), r2=198(x2), r3=89(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 169
LDI r2, 198
LDI r3, 89
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
