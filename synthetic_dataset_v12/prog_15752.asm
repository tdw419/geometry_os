; DESCRIPTION: Places a orange line segment connecting (450, 116) to (161, 250).
; PLAN: r0=450(x1), r1=116(y1), r2=161(x2), r3=250(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 116
LDI r2, 161
LDI r3, 250
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
