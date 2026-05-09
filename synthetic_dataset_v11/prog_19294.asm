; DESCRIPTION: Places a orange line segment connecting (104, 21) to (99, 141).
; PLAN: r0=104(x1), r1=21(y1), r2=99(x2), r3=141(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 21
LDI r2, 99
LDI r3, 141
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
