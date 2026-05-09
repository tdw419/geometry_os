; DESCRIPTION: Places a orange line segment connecting (127, 162) to (65, 244).
; PLAN: r0=127(x1), r1=162(y1), r2=65(x2), r3=244(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 162
LDI r2, 65
LDI r3, 244
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
