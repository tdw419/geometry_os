; DESCRIPTION: Places a orange line segment connecting (155, 126) to (115, 169).
; PLAN: r0=155(x1), r1=126(y1), r2=115(x2), r3=169(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 126
LDI r2, 115
LDI r3, 169
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
