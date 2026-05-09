; DESCRIPTION: Places a blue line segment connecting (13, 31) to (26, 191).
; PLAN: r0=13(x1), r1=31(y1), r2=26(x2), r3=191(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 31
LDI r2, 26
LDI r3, 191
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
