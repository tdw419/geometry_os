; DESCRIPTION: Places a orange line segment connecting (244, 236) to (440, 68).
; PLAN: r0=244(x1), r1=236(y1), r2=440(x2), r3=68(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 236
LDI r2, 440
LDI r3, 68
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
