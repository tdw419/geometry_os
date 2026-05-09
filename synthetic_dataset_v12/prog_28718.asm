; DESCRIPTION: Places a orange line segment connecting (147, 146) to (149, 90).
; PLAN: r0=147(x1), r1=146(y1), r2=149(x2), r3=90(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 146
LDI r2, 149
LDI r3, 90
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
