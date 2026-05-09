; DESCRIPTION: Places a orange line segment connecting (59, 201) to (58, 152).
; PLAN: r0=59(x1), r1=201(y1), r2=58(x2), r3=152(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 201
LDI r2, 58
LDI r3, 152
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
