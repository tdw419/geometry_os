; DESCRIPTION: Places a orange line segment connecting (79, 155) to (250, 126).
; PLAN: r0=79(x1), r1=155(y1), r2=250(x2), r3=126(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 155
LDI r2, 250
LDI r3, 126
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
