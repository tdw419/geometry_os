; DESCRIPTION: Places a orange line segment connecting (140, 127) to (49, 9).
; PLAN: r0=140(x1), r1=127(y1), r2=49(x2), r3=9(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 127
LDI r2, 49
LDI r3, 9
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
