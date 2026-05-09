; DESCRIPTION: Places a orange line segment connecting (76, 255) to (178, 47).
; PLAN: r0=76(x1), r1=255(y1), r2=178(x2), r3=47(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 255
LDI r2, 178
LDI r3, 47
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
