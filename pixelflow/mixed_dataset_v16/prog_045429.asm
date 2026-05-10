; DESCRIPTION: Places a orange line segment connecting (202, 13) to (155, 231).
; PLAN: r0=202(x1), r1=13(y1), r2=155(x2), r3=231(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 13
LDI r2, 155
LDI r3, 231
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
