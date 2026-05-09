; DESCRIPTION: Places a orange line segment connecting (178, 210) to (31, 133).
; PLAN: r0=178(x1), r1=210(y1), r2=31(x2), r3=133(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 210
LDI r2, 31
LDI r3, 133
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
