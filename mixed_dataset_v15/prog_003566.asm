; DESCRIPTION: Places a orange line segment connecting (435, 184) to (169, 95).
; PLAN: r0=435(x1), r1=184(y1), r2=169(x2), r3=95(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 184
LDI r2, 169
LDI r3, 95
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
