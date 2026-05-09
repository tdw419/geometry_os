; DESCRIPTION: Places a orange line segment connecting (123, 180) to (157, 185).
; PLAN: r0=123(x1), r1=180(y1), r2=157(x2), r3=185(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 180
LDI r2, 157
LDI r3, 185
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
