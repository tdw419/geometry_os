; DESCRIPTION: Places a orange line segment connecting (76, 223) to (80, 14).
; PLAN: r0=76(x1), r1=223(y1), r2=80(x2), r3=14(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 223
LDI r2, 80
LDI r3, 14
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
