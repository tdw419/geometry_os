; DESCRIPTION: Places a orange line segment connecting (210, 75) to (46, 9).
; PLAN: r0=210(x1), r1=75(y1), r2=46(x2), r3=9(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 75
LDI r2, 46
LDI r3, 9
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
