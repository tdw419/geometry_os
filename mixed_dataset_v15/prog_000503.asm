; DESCRIPTION: Places a orange line segment connecting (261, 250) to (248, 254).
; PLAN: r0=261(x1), r1=250(y1), r2=248(x2), r3=254(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 250
LDI r2, 248
LDI r3, 254
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
