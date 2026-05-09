; DESCRIPTION: Places a purple line segment connecting (33, 67) to (492, 131).
; PLAN: r0=33(x1), r1=67(y1), r2=492(x2), r3=131(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 67
LDI r2, 492
LDI r3, 131
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
