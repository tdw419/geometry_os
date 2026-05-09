; DESCRIPTION: Places a orange line segment connecting (431, 57) to (433, 91).
; PLAN: r0=431(x1), r1=57(y1), r2=433(x2), r3=91(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 57
LDI r2, 433
LDI r3, 91
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
