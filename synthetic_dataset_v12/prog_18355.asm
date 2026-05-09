; DESCRIPTION: Places a blue line segment connecting (427, 167) to (331, 70).
; PLAN: r0=427(x1), r1=167(y1), r2=331(x2), r3=70(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 167
LDI r2, 331
LDI r3, 70
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
