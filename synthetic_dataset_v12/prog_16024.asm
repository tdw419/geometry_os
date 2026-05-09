; DESCRIPTION: Places a orange line segment connecting (229, 213) to (201, 188).
; PLAN: r0=229(x1), r1=213(y1), r2=201(x2), r3=188(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 213
LDI r2, 201
LDI r3, 188
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
