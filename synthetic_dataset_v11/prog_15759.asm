; DESCRIPTION: Places a purple line segment connecting (170, 150) to (67, 46).
; PLAN: r0=170(x1), r1=150(y1), r2=67(x2), r3=46(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 150
LDI r2, 67
LDI r3, 46
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
