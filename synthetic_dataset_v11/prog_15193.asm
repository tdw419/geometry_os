; DESCRIPTION: Places a orange line segment connecting (6, 197) to (44, 70).
; PLAN: r0=6(x1), r1=197(y1), r2=44(x2), r3=70(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 197
LDI r2, 44
LDI r3, 70
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
