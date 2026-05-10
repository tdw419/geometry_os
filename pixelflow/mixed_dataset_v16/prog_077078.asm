; DESCRIPTION: Places a orange line segment connecting (81, 149) to (504, 184).
; PLAN: r0=81(x1), r1=149(y1), r2=504(x2), r3=184(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 149
LDI r2, 504
LDI r3, 184
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
