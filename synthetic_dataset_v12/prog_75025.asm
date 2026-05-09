; DESCRIPTION: Places a blue line segment connecting (454, 109) to (231, 188).
; PLAN: r0=454(x1), r1=109(y1), r2=231(x2), r3=188(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 109
LDI r2, 231
LDI r3, 188
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
