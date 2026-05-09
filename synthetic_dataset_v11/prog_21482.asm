; DESCRIPTION: Places a purple line segment connecting (227, 122) to (24, 29).
; PLAN: r0=227(x1), r1=122(y1), r2=24(x2), r3=29(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 122
LDI r2, 24
LDI r3, 29
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
