; DESCRIPTION: Places a orange line segment connecting (193, 216) to (68, 214).
; PLAN: r0=193(x1), r1=216(y1), r2=68(x2), r3=214(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 216
LDI r2, 68
LDI r3, 214
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
