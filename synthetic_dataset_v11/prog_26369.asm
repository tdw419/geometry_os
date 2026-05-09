; DESCRIPTION: Places a orange line segment connecting (248, 174) to (231, 165).
; PLAN: r0=248(x1), r1=174(y1), r2=231(x2), r3=165(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 174
LDI r2, 231
LDI r3, 165
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
