; DESCRIPTION: Places a orange line segment connecting (65, 223) to (331, 79).
; PLAN: r0=65(x1), r1=223(y1), r2=331(x2), r3=79(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 223
LDI r2, 331
LDI r3, 79
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
