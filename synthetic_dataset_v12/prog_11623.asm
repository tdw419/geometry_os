; DESCRIPTION: Places a orange line segment connecting (258, 120) to (174, 54).
; PLAN: r0=258(x1), r1=120(y1), r2=174(x2), r3=54(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 120
LDI r2, 174
LDI r3, 54
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
