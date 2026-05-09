; DESCRIPTION: Places a orange line segment connecting (210, 34) to (127, 22).
; PLAN: r0=210(x1), r1=34(y1), r2=127(x2), r3=22(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 34
LDI r2, 127
LDI r3, 22
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
