; DESCRIPTION: Places a orange line segment connecting (454, 110) to (236, 152).
; PLAN: r0=454(x1), r1=110(y1), r2=236(x2), r3=152(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 110
LDI r2, 236
LDI r3, 152
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
