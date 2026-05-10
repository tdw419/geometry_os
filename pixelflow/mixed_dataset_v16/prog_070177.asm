; DESCRIPTION: Places a orange line segment connecting (6, 79) to (435, 70).
; PLAN: r0=6(x1), r1=79(y1), r2=435(x2), r3=70(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 79
LDI r2, 435
LDI r3, 70
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
