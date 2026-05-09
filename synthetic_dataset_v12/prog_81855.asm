; DESCRIPTION: Places a orange line segment connecting (90, 49) to (31, 243).
; PLAN: r0=90(x1), r1=49(y1), r2=31(x2), r3=243(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 49
LDI r2, 31
LDI r3, 243
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
