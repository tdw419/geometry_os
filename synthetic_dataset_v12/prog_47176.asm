; DESCRIPTION: Places a orange line segment connecting (456, 191) to (152, 133).
; PLAN: r0=456(x1), r1=191(y1), r2=152(x2), r3=133(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 191
LDI r2, 152
LDI r3, 133
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
