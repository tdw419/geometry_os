; DESCRIPTION: Places a orange line segment connecting (344, 145) to (46, 127).
; PLAN: r0=344(x1), r1=145(y1), r2=46(x2), r3=127(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 145
LDI r2, 46
LDI r3, 127
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
