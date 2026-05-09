; DESCRIPTION: Places a orange line segment connecting (162, 121) to (152, 248).
; PLAN: r0=162(x1), r1=121(y1), r2=152(x2), r3=248(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 121
LDI r2, 152
LDI r3, 248
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
