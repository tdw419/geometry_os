; DESCRIPTION: Places a orange line segment connecting (269, 191) to (231, 110).
; PLAN: r0=269(x1), r1=191(y1), r2=231(x2), r3=110(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 191
LDI r2, 231
LDI r3, 110
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
