; DESCRIPTION: Places a yellow line segment connecting (62, 48) to (67, 121).
; PLAN: r0=62(x1), r1=48(y1), r2=67(x2), r3=121(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 48
LDI r2, 67
LDI r3, 121
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
