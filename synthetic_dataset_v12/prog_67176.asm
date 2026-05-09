; DESCRIPTION: Places a orange line segment connecting (169, 150) to (220, 211).
; PLAN: r0=169(x1), r1=150(y1), r2=220(x2), r3=211(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 150
LDI r2, 220
LDI r3, 211
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
