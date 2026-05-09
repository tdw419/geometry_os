; DESCRIPTION: Places a orange line segment connecting (209, 231) to (117, 162).
; PLAN: r0=209(x1), r1=231(y1), r2=117(x2), r3=162(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 231
LDI r2, 117
LDI r3, 162
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
