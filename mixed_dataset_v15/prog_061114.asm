; DESCRIPTION: Places a orange line segment connecting (353, 152) to (406, 63).
; PLAN: r0=353(x1), r1=152(y1), r2=406(x2), r3=63(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 152
LDI r2, 406
LDI r3, 63
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
