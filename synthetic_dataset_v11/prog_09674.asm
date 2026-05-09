; DESCRIPTION: Places a orange line segment connecting (161, 174) to (203, 208).
; PLAN: r0=161(x1), r1=174(y1), r2=203(x2), r3=208(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 174
LDI r2, 203
LDI r3, 208
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
