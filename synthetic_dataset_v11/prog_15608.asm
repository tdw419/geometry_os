; DESCRIPTION: Places a orange line segment connecting (221, 222) to (115, 85).
; PLAN: r0=221(x1), r1=222(y1), r2=115(x2), r3=85(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 222
LDI r2, 115
LDI r3, 85
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
