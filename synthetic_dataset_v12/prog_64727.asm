; DESCRIPTION: Places a blue line segment connecting (8, 24) to (67, 124).
; PLAN: r0=8(x1), r1=24(y1), r2=67(x2), r3=124(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 24
LDI r2, 67
LDI r3, 124
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
