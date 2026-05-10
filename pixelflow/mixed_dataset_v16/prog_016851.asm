; DESCRIPTION: Places a green line segment connecting (23, 157) to (428, 181).
; PLAN: r0=23(x1), r1=157(y1), r2=428(x2), r3=181(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 157
LDI r2, 428
LDI r3, 181
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
