; DESCRIPTION: Places a orange line segment connecting (130, 104) to (68, 184).
; PLAN: r0=130(x1), r1=104(y1), r2=68(x2), r3=184(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 104
LDI r2, 68
LDI r3, 184
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
