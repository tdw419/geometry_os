; DESCRIPTION: Places a orange line segment connecting (98, 206) to (428, 108).
; PLAN: r0=98(x1), r1=206(y1), r2=428(x2), r3=108(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 206
LDI r2, 428
LDI r3, 108
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
