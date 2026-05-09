; DESCRIPTION: Places a orange line segment connecting (345, 162) to (178, 36).
; PLAN: r0=345(x1), r1=162(y1), r2=178(x2), r3=36(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 162
LDI r2, 178
LDI r3, 36
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
