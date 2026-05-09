; DESCRIPTION: Places a purple line segment connecting (91, 196) to (501, 101).
; PLAN: r0=91(x1), r1=196(y1), r2=501(x2), r3=101(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 196
LDI r2, 501
LDI r3, 101
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
