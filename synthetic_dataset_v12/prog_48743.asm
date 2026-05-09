; DESCRIPTION: Places a blue line segment connecting (128, 170) to (181, 249).
; PLAN: r0=128(x1), r1=170(y1), r2=181(x2), r3=249(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 170
LDI r2, 181
LDI r3, 249
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
