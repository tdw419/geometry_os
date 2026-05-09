; DESCRIPTION: Places a orange line segment connecting (149, 120) to (138, 15).
; PLAN: r0=149(x1), r1=120(y1), r2=138(x2), r3=15(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 120
LDI r2, 138
LDI r3, 15
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
