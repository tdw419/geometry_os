; DESCRIPTION: Places a orange line segment connecting (91, 198) to (60, 236).
; PLAN: r0=91(x1), r1=198(y1), r2=60(x2), r3=236(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 198
LDI r2, 60
LDI r3, 236
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
