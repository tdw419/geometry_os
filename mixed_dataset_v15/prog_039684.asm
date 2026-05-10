; DESCRIPTION: Places a yellow line segment connecting (475, 141) to (194, 67).
; PLAN: r0=475(x1), r1=141(y1), r2=194(x2), r3=67(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 141
LDI r2, 194
LDI r3, 67
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
