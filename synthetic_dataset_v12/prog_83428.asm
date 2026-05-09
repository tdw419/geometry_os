; DESCRIPTION: Places a orange line segment connecting (330, 231) to (304, 151).
; PLAN: r0=330(x1), r1=231(y1), r2=304(x2), r3=151(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 231
LDI r2, 304
LDI r3, 151
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
