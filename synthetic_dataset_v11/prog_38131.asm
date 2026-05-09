; DESCRIPTION: Places a orange line segment connecting (59, 133) to (175, 9).
; PLAN: r0=59(x1), r1=133(y1), r2=175(x2), r3=9(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 133
LDI r2, 175
LDI r3, 9
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
