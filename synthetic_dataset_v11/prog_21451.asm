; DESCRIPTION: Places a orange line segment connecting (54, 187) to (206, 162).
; PLAN: r0=54(x1), r1=187(y1), r2=206(x2), r3=162(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 187
LDI r2, 206
LDI r3, 162
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
