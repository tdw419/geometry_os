; DESCRIPTION: Places a orange line segment connecting (14, 88) to (175, 14).
; PLAN: r0=14(x1), r1=88(y1), r2=175(x2), r3=14(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 88
LDI r2, 175
LDI r3, 14
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
