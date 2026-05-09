; DESCRIPTION: Places a orange line segment connecting (249, 161) to (3, 184).
; PLAN: r0=249(x1), r1=161(y1), r2=3(x2), r3=184(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 161
LDI r2, 3
LDI r3, 184
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
