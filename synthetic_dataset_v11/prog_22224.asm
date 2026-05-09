; DESCRIPTION: Places a orange line segment connecting (160, 231) to (67, 158).
; PLAN: r0=160(x1), r1=231(y1), r2=67(x2), r3=158(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 231
LDI r2, 67
LDI r3, 158
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
