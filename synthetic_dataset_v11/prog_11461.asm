; DESCRIPTION: Places a orange line segment connecting (162, 0) to (99, 154).
; PLAN: r0=162(x1), r1=0(y1), r2=99(x2), r3=154(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 0
LDI r2, 99
LDI r3, 154
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
