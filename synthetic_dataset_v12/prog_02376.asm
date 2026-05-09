; DESCRIPTION: Places a purple line segment connecting (16, 250) to (187, 218).
; PLAN: r0=16(x1), r1=250(y1), r2=187(x2), r3=218(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 250
LDI r2, 187
LDI r3, 218
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
