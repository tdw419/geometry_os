; DESCRIPTION: Places a orange line segment connecting (147, 156) to (168, 250).
; PLAN: r0=147(x1), r1=156(y1), r2=168(x2), r3=250(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 156
LDI r2, 168
LDI r3, 250
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
