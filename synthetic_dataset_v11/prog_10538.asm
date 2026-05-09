; DESCRIPTION: Places a blue line segment connecting (116, 124) to (44, 67).
; PLAN: r0=116(x1), r1=124(y1), r2=44(x2), r3=67(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 124
LDI r2, 44
LDI r3, 67
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
