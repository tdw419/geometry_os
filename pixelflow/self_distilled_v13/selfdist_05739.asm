; DESCRIPTION: Renders a orange line segment connecting (54, 16) to (331, 152).
; PLAN: r0=54(x1), r1=16(y1), r2=331(x2), r3=152(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 16
LDI r2, 331
LDI r3, 152
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
