; DESCRIPTION: Places a orange line segment connecting (207, 244) to (104, 123).
; PLAN: r0=207(x1), r1=244(y1), r2=104(x2), r3=123(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 244
LDI r2, 104
LDI r3, 123
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
