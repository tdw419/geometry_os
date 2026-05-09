; DESCRIPTION: Places a orange line segment connecting (345, 55) to (245, 161).
; PLAN: r0=345(x1), r1=55(y1), r2=245(x2), r3=161(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 55
LDI r2, 245
LDI r3, 161
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
