; DESCRIPTION: Places a orange line segment connecting (430, 231) to (425, 70).
; PLAN: r0=430(x1), r1=231(y1), r2=425(x2), r3=70(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 231
LDI r2, 425
LDI r3, 70
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
