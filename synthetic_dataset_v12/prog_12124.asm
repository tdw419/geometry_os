; DESCRIPTION: Places a orange line segment connecting (60, 251) to (70, 121).
; PLAN: r0=60(x1), r1=251(y1), r2=70(x2), r3=121(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 251
LDI r2, 70
LDI r3, 121
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
