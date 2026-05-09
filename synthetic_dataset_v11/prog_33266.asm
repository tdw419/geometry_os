; DESCRIPTION: Places a orange line segment connecting (231, 151) to (247, 222).
; PLAN: r0=231(x1), r1=151(y1), r2=247(x2), r3=222(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 151
LDI r2, 247
LDI r3, 222
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
