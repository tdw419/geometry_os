; DESCRIPTION: Places a orange line segment connecting (345, 132) to (311, 252).
; PLAN: r0=345(x1), r1=132(y1), r2=311(x2), r3=252(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 132
LDI r2, 311
LDI r3, 252
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
