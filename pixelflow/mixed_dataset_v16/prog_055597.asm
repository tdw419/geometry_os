; DESCRIPTION: Places a orange line segment connecting (280, 16) to (162, 162).
; PLAN: r0=280(x1), r1=16(y1), r2=162(x2), r3=162(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 16
LDI r2, 162
LDI r3, 162
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
