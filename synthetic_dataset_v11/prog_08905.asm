; DESCRIPTION: Places a magenta line segment connecting (149, 125) to (207, 147).
; PLAN: r0=149(x1), r1=125(y1), r2=207(x2), r3=147(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 125
LDI r2, 207
LDI r3, 147
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
