; DESCRIPTION: Places a orange line segment connecting (444, 168) to (117, 0).
; PLAN: r0=444(x1), r1=168(y1), r2=117(x2), r3=0(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 168
LDI r2, 117
LDI r3, 0
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
